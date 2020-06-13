import '../login_const/login_const.dart';
import '../login_widget/build_sign_in.dart';
import '../login_widget/build_sign_up.dart';
import '../../models/http_exception.dart';
import '../../provider/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/bubble_indication_painter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKeySignIn = GlobalKey();
  final GlobalKey<FormState> _formKeySignUp = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
    'name': '',
  };
  bool _isLoading = false;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _submitSignIn() async {
    if (!_formKeySignIn.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKeySignIn.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false).signInWithEmailAndPassword(
        _authData['email'],
        _authData['password'],
      );
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _submitSignUp() async {
    if (!_formKeySignUp.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKeySignUp.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false).createUserWithEmailAndPassword(
        _authData['email'],
        _authData['password'],
        _authData['name'],
      );
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();


  bool _obscureTextLogin = true;
  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

  TextEditingController signupPasswordController = TextEditingController();

  PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    return Scaffold(
      key: _scaffoldKey,
      body: NotificationListener<OverscrollIndicatorNotification>(
        // ignore: missing_return
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: Container(
          decoration: mainDecoration,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: height * 0.02),
                    child: Image(
                      height: height * 0.2,
                      fit: BoxFit.fill,
                      image: AssetImage('assets/img/login_logo.png'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: height * 0.02),
                    child: _buildMenuBar(context, width, height),
                  ),
                  Container(
                    height: height * 0.8,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (i) {
                        if (i == 0) {
                          setState(() {
                            right = Colors.white;
                            left = Colors.black;
                          });
                        } else if (i == 1) {
                          setState(() {
                            right = Colors.black;
                            left = Colors.white;
                          });
                        }
                      },
                      children: <Widget>[
                        BuildSignIN(
                          formKey: _formKeySignIn,
                          myFocusNodeEmailLogin: myFocusNodeEmailLogin,
                          authData: _authData,
                          isLoading: _isLoading,
                          myFocusNodePasswordLogin: myFocusNodePasswordLogin,
                          obscureTextLogin: _obscureTextLogin,
                          submit: _submitSignIn,
                          toggleLogin: _toggleLogin,
                          validateEmail: _validateEmail,
                          validatePassword: _validatePassword,
                        ),
                        BuildSignUP(
                          formKey: _formKeySignUp,
                          validateName: _validateName,
                          validateEmail: _validateEmail,
                          validatePassword: _validatePassword,
                          submit: _submitSignUp,
                          isLoading: _isLoading,
                          authData: _authData,
                          myFocusNodeEmail: myFocusNodeEmail,
                          myFocusNodeName: myFocusNodeName,
                          myFocusNodePassword: myFocusNodePassword,
                          obscureTextSignup: _obscureTextSignup,
                          obscureTextSignupConfirm: _obscureTextSignupConfirm,
                          signupPasswordController: signupPasswordController,
                          toggleSignup: _toggleSignup,
                          toggleSignupConfirm: _toggleSignupConfirm,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    myFocusNodeEmailLogin.dispose();
    myFocusNodePasswordLogin.dispose();
    myFocusNodePassword.dispose();
    myFocusNodeEmail.dispose();
    myFocusNodeName.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    ));
  }

  Widget _buildMenuBar(BuildContext context, width, height) {
    return Container(
      width: width * 0.8,
      height: width * 0.13,
      decoration: movingTile,
      child: CustomPaint(
        painter: TabIndicationPainter(
            pageController: _pageController, dxTarget: ((width * 0.4) - 25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignInButtonPress,
                child: Text(
                  "Existing",
                  style: TextStyle(
                      color: left,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignUpButtonPress,
                child: Text(
                  "New",
                  style: TextStyle(
                      color: right,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
    });
  }

  String _validateEmail(String value) {
    if (value.isEmpty) {
      return "Enter email address";
    }
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = RegExp(p);
    if (regExp.hasMatch(value)) {
      return null;
    }
    return 'Email is not valid';
  }

  String _validateName(String value) {
    if (value.isEmpty) {
      return "Enter Your Name";
    }
    Pattern pattern = '[a-zA-Z]';
    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(value)) {
      return null;
    }
    return 'Name is not valid';
  }

  String _validatePassword(String value) {
    if (value.isEmpty) {
      return "Enter Your Password";
    }
//    RegExp regex = RegExp(
//        "^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})");
    Pattern pattern = '[a-zA-Z]';
    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(value)) {
      return null;
    }
    return 'Password is not valid';
  }
}
