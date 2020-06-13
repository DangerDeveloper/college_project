//import 'dart:async';
//import 'dart:convert';
//
//import 'package:firebase_auth/firebase_auth.dart';
//import '../models/http_exception.dart';
//import 'package:flutter/widgets.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
//
//class Auth with ChangeNotifier {
//  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
//  String _uID;
//
//  bool get isAuth {
//    return token != null;
//  }
//
//  String get token {
//    if (_uID != null) {
//      return _uID;
//    }
//    return null;
//  }
//
//  Future<bool> tryAutoLogin() async {
//    final prefs = await SharedPreferences.getInstance();
//    if (!prefs.containsKey('userData')) {
//      return false;
//    }
//    final extractedUserData =
//        json.decode(prefs.getString('userData')) as Map<String, Object>;
//    _uID = extractedUserData['uID'];
//    notifyListeners();
//    return true;
//  }
//
//  Future<void> signInWithEmailAndPassword(String email, String password) async {
//    try {
//      AuthResult user = await _firebaseAuth.signInWithEmailAndPassword(
//          email: email, password: password);
//      assert(user != null);
////      assert(await user.user.getIdToken() != null);
//      _uID = user.user.uid;
//      final prefs = await SharedPreferences.getInstance();
//      final userData = json.encode(
//        {
//          'uID': _uID,
//        },
//      );
//      prefs.setString('userData', userData);
//    } catch (e) {
//      print(e);
//    }
//    notifyListeners();
//  }
//
//  Future<void> doWithGoogle() async {
//    try {
//      GoogleSignInAccount signInAccount = await _googleSignIn.signIn();
//      GoogleSignInAuthentication signInAuthentication =
//          await signInAccount.authentication;
//      AuthCredential credential = GoogleAuthProvider.getCredential(
//        idToken: signInAuthentication.idToken,
//        accessToken: signInAuthentication.accessToken,
//      );
//      AuthResult user = await _firebaseAuth.signInWithCredential(credential);
//
//      _uID = user.user.uid;
//      final prefs = await SharedPreferences.getInstance();
//      final userData = json.encode(
//        {
//          'uID': _uID,
//        },
//      );
//      prefs.setString('userData', userData);
//    } catch (e) {
//      print(e);
//    }
//    notifyListeners();
//  }
//
//  Future<void> createUserWithEmailAndPassword(
//      String email, String password, String name) async {
//    try {
//      final List<String> providers =
//          await _firebaseAuth.fetchSignInMethodsForEmail(email: email);
//      if (providers.contains('password')) {
//        // This account is already Exist
//        // Throw Error
//      } else {
//        // Create a New Account
//        if (providers.contains('google.com')) {
//          // Now Link google provider with email provider
//          print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhyyyyyyyyyyyyyyyyyyy');
//          final GoogleSignInTokenData response =
//          await GoogleSignInPlatform.instance.getTokens(
//            email: email,
//            shouldRecoverAuth: true,
//          );
//          print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh ${response.idToken}');
//          AuthCredential credential = GoogleAuthProvider.getCredential(
//            idToken: response.idToken,
//            accessToken: response.accessToken,
//          );
//          AuthResult user =
//              await _firebaseAuth.signInWithCredential(credential);
//          AuthCredential emailCredential =
//              EmailAuthProvider.getCredential(email: email, password: password);
//          await user.user.linkWithCredential(emailCredential);
//        }
//        if (providers.contains('fb.com')) {
//          // Now Link Facebook Provider with email Provider
//        }
//      }
////      final AuthResult user = await _firebaseAuth
////          .createUserWithEmailAndPassword(email: email, password: password);
//
////      _uID = user.user.uid;
////      final prefs = await SharedPreferences.getInstance();
////      final userData = json.encode(
////        {
////          'uID': _uID,
////        },
////      );
////      prefs.setString('userData', userData);
//    } catch (e) {
//      print(e);
//    }
//    notifyListeners();
//  }
//
//  Future<void> signOut() async {
//    try {
//      await _firebaseAuth.signOut();
//      var user = _googleSignIn.currentUser;
//      print(user);
//      if (user != null) {
//        await _googleSignIn.signOut();
//      }
//      user = _googleSignIn.currentUser;
//      print(user);
//      _uID = null;
//      final prefs = await SharedPreferences.getInstance();
//      prefs.remove('userData');
//    } catch (e) {
//      print(e);
//    }
//    notifyListeners();
//  }
//
//  Future<void> forgotPassword(String email) async {
//    try {
//      await _firebaseAuth.sendPasswordResetEmail(email: email);
//    } catch (e) {
//      print(e);
//    }
//  }
//}
//
//abstract class BaseAuth {
//  Future<bool> tryAutoLogin();
//
//  Future<String> signInWithEmailAndPassword(String email, String password);
//
//  Future<String> createUserWithEmailAndPassword(String email, String password);
//
//  Future<void> signOut();
//
//  Future<void> forgotPassword(String email);
//
//  Future<void> doWithGoogle();
//}
////google.com
////password
