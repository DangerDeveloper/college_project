import '../../provider/auth.dart';
import '../../routs/routs.dart';
import 'package:provider/provider.dart';

import '../login_const/login_const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../style/theme.dart' as Theme;

class BuildSignIN extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final FocusNode myFocusNodeEmailLogin;
  final FocusNode myFocusNodePasswordLogin;
  final Function validateEmail;
  final Function validatePassword;
  final Function toggleLogin;
  final Function submit;
  bool obscureTextLogin;
  bool isLoading;
  Map<String, String> authData;

  BuildSignIN({
    this.formKey,
    this.myFocusNodeEmailLogin,
    this.validateEmail,
    this.authData,
    this.myFocusNodePasswordLogin,
    this.validatePassword,
    this.obscureTextLogin,
    this.toggleLogin,
    this.isLoading,
    this.submit,
  });

  @override
  _BuildSignINState createState() => _BuildSignINState();
}

class _BuildSignINState extends State<BuildSignIN> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    var data = Provider.of<Auth>(context, listen: false);
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
                                right: 25.0),
                            child: TextFormField(
                              focusNode: widget.myFocusNodeEmailLogin,
                              // this is usefull
                              // ignore: missing_return
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
                                  size: 22.0,
                                ),
                                hintText: "Email Address",
                                hintStyle: TextStyle(
                                    fontFamily: "WorkSansSemiBold",
                                    fontSize: 17.0),
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
                              focusNode: widget.myFocusNodePasswordLogin,
                              // use this code
                              // ignore: missing_return
                              validator: widget.validatePassword,
                              onSaved: (value) {
                                widget.authData['password'] = value;
                              },
                              obscureText: widget.obscureTextLogin,
                              style: TextStyle(
                                  fontFamily: "WorkSansSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  FontAwesomeIcons.lock,
                                  size: 22.0,
                                  color: Colors.black,
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  fontFamily: "WorkSansSemiBold",
                                  fontSize: 17.0,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: widget.toggleLogin,
                                  child: Icon(
                                    widget.obscureTextLogin
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
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 42.0),
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontFamily: "WorkSansBold"),
                                ),
                              ),
                              onPressed: widget.submit,
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Container(
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    ROUTES.FORGOT_PASSWORD,
                    arguments: widget.validateEmail,
                  );
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: "WorkSansMedium"),
                ),
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
                      onTap: () async {
                        await Provider.of<Auth>(context, listen: false)
                            .doWithGoogle();
                      },
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
