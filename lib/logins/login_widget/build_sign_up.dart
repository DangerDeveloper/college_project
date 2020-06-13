import '../login_const/login_const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../style/theme.dart' as Theme;

class BuildSignUP extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final FocusNode myFocusNodeName;
  final FocusNode myFocusNodeEmail;
  final FocusNode myFocusNodePassword;
  final TextEditingController signupPasswordController;

  final Function validateEmail;
  final Function validateName;
  final Function validatePassword;
  final Function toggleSignup;
  final Function toggleSignupConfirm;
  final Function submit;
  bool obscureTextSignup;
  bool obscureTextSignupConfirm;
  bool isLoading;

  Map<String, String> authData;

  BuildSignUP({
    this.formKey,
    this.myFocusNodeName,
    this.validateEmail,
    this.validateName,
    this.authData,
    this.myFocusNodeEmail,
    this.myFocusNodePassword,
    this.signupPasswordController,
    this.validatePassword,
    this.obscureTextSignup,
    this.toggleSignup,
    this.obscureTextSignupConfirm,
    this.toggleSignupConfirm,
    this.submit,
    this.isLoading,
  });

  @override
  _BuildSignUPState createState() => _BuildSignUPState();
}

class _BuildSignUPState extends State<BuildSignUP> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    return Container(
      padding: EdgeInsets.only(top: height * 0.02),
      child: Form(
        key: widget.formKey,
        child: Column(
          children: <Widget>[
            Container(
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
                              right: 25.0,
                            ),
                            child: TextFormField(
                              focusNode: widget.myFocusNodeName,
                              // use this code
                              // ignore: missing_return
                              validator: widget.validateName,
                              onSaved: (value) {
                                widget.authData['name'] = value;
                              },
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.words,
                              style: TextStyle(
                                  fontFamily: "WorkSansSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  FontAwesomeIcons.user,
                                  color: Colors.black,
                                ),
                                hintText: "Name",
                                hintStyle: TextStyle(
                                    fontFamily: "WorkSansSemiBold",
                                    fontSize: 16.0),
                              ),
                            ),
                          ),
                          Container(
                            width: width * .7,
                            height: 1.0,
                            color: Colors.grey[400],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                left: 25.0,
                                right: 25.0),
                            child: TextFormField(
                              focusNode: widget.myFocusNodeEmail,
                              // use this
                              validator: widget.validateEmail,
                              onSaved: (value) {
                                widget.authData['email'] = value;
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
                                ),
                                hintText: "Email Address",
                                hintStyle: TextStyle(
                                    fontFamily: "WorkSansSemiBold",
                                    fontSize: 16.0),
                              ),
                            ),
                          ),
                          Container(
                            width: width * .7,
                            height: 1.0,
                            color: Colors.grey[400],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                left: 25.0,
                                right: 25.0),
                            child: TextFormField(
                              focusNode: widget.myFocusNodePassword,
                              controller: widget.signupPasswordController,
                              // use this
                              // ignore: missing_return
                              validator: widget.validatePassword,
                              onSaved: (value) {
                                widget.authData['password'] = value;
                              },
                              obscureText: widget.obscureTextSignup,
                              style: TextStyle(
                                  fontFamily: "WorkSansSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  FontAwesomeIcons.lock,
                                  color: Colors.black,
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    fontFamily: "WorkSansSemiBold",
                                    fontSize: 16.0),
                                suffixIcon: GestureDetector(
                                  onTap: widget.toggleSignup,
                                  child: Icon(
                                    widget.obscureTextSignup
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                    size: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: width * .7,
                            height: 1.0,
                            color: Colors.grey[400],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                left: 25.0,
                                right: 25.0),
                            child: TextFormField(
                              obscureText: widget.obscureTextSignupConfirm,
                              // ignore: missing_return
                              validator: (value) {
                                if (value != widget.signupPasswordController.text) {
                                  return 'Passwords do not match!';
                                }
                              },
                              style: TextStyle(
                                  fontFamily: "WorkSansSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  FontAwesomeIcons.lock,
                                  color: Colors.black,
                                ),
                                hintText: "Confirmation",
                                hintStyle: TextStyle(
                                    fontFamily: "WorkSansSemiBold",
                                    fontSize: 16.0),
                                suffixIcon: GestureDetector(
                                  onTap: widget.toggleSignupConfirm,
                                  child: Icon(
                                    widget.obscureTextSignupConfirm
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                    size: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
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
                    child: widget.isLoading
                        ? CircularProgressIndicator()
                        : Container(
                            decoration: change,
                            child: MaterialButton(
                                highlightColor: Colors.transparent,
                                splashColor: Theme.Colors.loginGradientEnd,
                                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 42.0),
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontFamily: "WorkSansBold"),
                                  ),
                                ),
                                onPressed: widget.submit),
                          ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.white10,
                            Colors.white,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    width: width * 0.25,
                    height: 1.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text(
                      "Or",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: "WorkSansMedium"),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white10,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    width: width * 0.25,
                    height: 1.0,
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          FontAwesomeIcons.facebookF,
                          color: Color(0xFF0084ff),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          FontAwesomeIcons.google,
                          color: Color(0xFF0084ff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
