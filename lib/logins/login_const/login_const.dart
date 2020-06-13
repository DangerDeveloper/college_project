import 'package:flutter/material.dart';
import '../style/theme.dart' as Theme;

Decoration change = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(5.0),),
  boxShadow: <BoxShadow>[
    BoxShadow(
      color: Theme.Colors.loginGradientStart,
      offset: Offset(1.0, 6.0),
      blurRadius: 20.0,
    ),
    BoxShadow(
      color: Theme.Colors.loginGradientEnd,
      offset: Offset(1.0, 6.0),
      blurRadius: 20.0,
    ),
  ],
  gradient: LinearGradient(
      colors: [
        Theme.Colors.loginGradientEnd,
        Theme.Colors.loginGradientStart
      ],
      begin: const FractionalOffset(0.2, 0.2),
      end: const FractionalOffset(1.0, 1.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp),
);

const Decoration mainDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [Theme.Colors.loginGradientStart, Theme.Colors.loginGradientEnd],
    begin: const FractionalOffset(0.0, 0.0),
    end: const FractionalOffset(1.0, 1.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  ),
);


const Decoration movingTile = BoxDecoration(
  color: const Color(0x552B2B2B),
  borderRadius: BorderRadius.all(
    Radius.circular(
      25.0,
    ),
  ),
);