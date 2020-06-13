import '../login_const/login_const.dart';
import '../../models/http_exception.dart';
import '../../provider/new_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../style/theme.dart' as Theme;

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isLoading = false;
  String _email = '';

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
//      await Provider.of<Auth>(context, listen: false).forgotPassword(_email);
//      _showErrorDialog('Email Sent to\n $_email', 'Check Your Email', true);
    } on HttpException catch (error) {
      var errorMessage = 'Somthing Went Wrong';
      if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'email not Exist.';
      } else if (error.toString().contains('RESET_PASSWORD_EXCEED_LIMIT')) {
        errorMessage = 'Reset Limit Exceed.';
      }
      _showErrorDialog(errorMessage, 'An Error Occurred!', false);
    } catch (error) {
      const errorMessage = 'Somthing Went Wrong. Please try again later.';
      _showErrorDialog(errorMessage, 'An Error Occurred!', false);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _showErrorDialog(String message, String text, bool check) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(text),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
              if (check) {
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    Function _validateEmail =
        ModalRoute.of(context).settings.arguments as Function;
    return Container(
      decoration: mainDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
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
                padding: EdgeInsets.only(top: height * 0.1),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 40.0),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Card(
                            elevation: 2.0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              width: width * 0.8,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 10.0,
                                        bottom: 10.0,
                                        left: 25.0,
                                        right: 25.0),
                                    child: TextFormField(
                                      // this is usefull
                                      // ignore: missing_return
                                      validator: _validateEmail,
                                      onSaved: (value) {
                                        _email = value;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyle(
                                          fontFamily: "WorkSansSemiBold",
                                          fontSize: 16.0,
                                          color: Colors.black),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        icon: Icon(
                                          FontAwesomeIcons.envelope,
                                          color: Colors.black,
                                          size: 22.0,
                                        ),
                                        hintText: "Email Address",
                                        hintStyle: TextStyle(
                                            fontFamily: "WorkSansSemiBold",
                                            fontSize: 17.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -20,
                            child: _isLoading
                                ? CircularProgressIndicator()
                                : Container(
                                    decoration: change,
                                    child: MaterialButton(
                                      highlightColor: Colors.transparent,
                                      splashColor:
                                          Theme.Colors.loginGradientEnd,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Text(
                                          "Reset Password",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 23.0,
                                              fontFamily: "WorkSansBold"),
                                        ),
                                      ),
                                      onPressed: _submit,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
