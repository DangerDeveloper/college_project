import '../enum/page_enum.dart';
import 'package:flutter/material.dart';

class PageRouteLogic extends ChangeNotifier {
  PAGE_ENUM _selectedPage = PAGE_ENUM.HOME;
  bool _isSideBarClose = true;
  AnimationController _animationController;

  PAGE_ENUM get selectedPage => _selectedPage;
  bool get isSideBarClose => _isSideBarClose;

  setPageEnum(PAGE_ENUM pageEnum) {
    _selectedPage = pageEnum;
    notifyListeners();
  }

  setAlwaysTrue() {
    _isSideBarClose = true;
    _animationController.reverse();
    notifyListeners();
  }

  setIsSideBar(AnimationController animationController) {
    _animationController = animationController;
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;
    if (isAnimationCompleted) {
        _isSideBarClose = true;
        _animationController.reverse();
        notifyListeners();
    } else {
        _isSideBarClose = false;
        _animationController.forward();
        notifyListeners();
    }
  }
}
