import 'package:flutter/material.dart';


final Decoration dropDownPDF = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.06),
      spreadRadius: 4,
      offset: Offset(0.0, 0.0),
      blurRadius: 15.0,
    ),
  ],
);

const Decoration DROPDOWN_PDF_FOCUS_ITEM = BoxDecoration(

  border: BorderDirectional(
    bottom: BorderSide(width: 1, color: Colors.black26),
    top: BorderSide(width: 1, color: Colors.black26),
  ),
);

const Decoration ARTICLES_MAIN_PAGE_DECORATION_CONST = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color(0xFF1b1e44),
      Color(0xFF2d3447),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);



const Decoration NAVBAR_CONSTANT = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color(0xFF1b1e44),
      Color(0xFF2d3447),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  shape: BoxShape.circle,
);

const Decoration CARD_SCROLL_WIDGET_CONTAINER = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(color: Colors.black12, offset: Offset(3.0, 6.0), blurRadius: 10.0)
  ],
);

final Decoration shadowEffectContainerFinal = BoxDecoration(
  color: Colors.grey[300],
  borderRadius: BorderRadius.all(
    Radius.circular(20.0),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.grey[600],
      blurRadius: 15.0,
      spreadRadius: 1.0,
      offset: Offset(4.0, 4.0),
    ),
    BoxShadow(
      color: Colors.white,
      blurRadius: 15.0,
      spreadRadius: 1.0,
      offset: Offset(-4.0, -4.0),
    ),
  ],
);

final Decoration mainContainer = BoxDecoration(
  color: Colors.green[400],
  borderRadius: BorderRadius.all(
    Radius.circular(10.0),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.green[700],
      blurRadius: 10.0,
      spreadRadius: 0.5,
      offset: Offset(3.0, 3.0),
    ),
    BoxShadow(
      color: Colors.white.withOpacity(0.6),
      blurRadius: 10.0,
      spreadRadius: 0.5,
      offset: Offset(-3.0, -3.0),
    ),
  ],
);
