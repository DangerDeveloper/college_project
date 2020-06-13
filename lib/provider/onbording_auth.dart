import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnbordingAuth with ChangeNotifier {
  bool _isIntroScreenOpenedBefore;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> get isIntroScreenOpenedBeforeGetter async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _isIntroScreenOpenedBefore = prefs.getBool("isIntroScreenOpened");
      return _isIntroScreenOpenedBefore;
    } catch (e) {
      print(e);
      return _isIntroScreenOpenedBefore = false;
    }
  }

  Future<void> appOpened() async {
    try {
      _isLoading = true;
      notifyListeners();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _isIntroScreenOpenedBefore =
          await prefs.setBool("isIntroScreenOpened", true);
      _isLoading = false;
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
