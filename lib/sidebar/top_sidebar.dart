import 'package:flutter/material.dart';

class TopSideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned(
          top: 14.0,
          left: 14.0,
          right: (width * 0.15) + 14,
          bottom: -14.0,
          child: Opacity(
            opacity: 0.2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
              child: null,
            ),
          ),
        ),
        Positioned(
          top: 7.0,
          left: 7.0,
          right: (width * 0.15) + 7,
          bottom: -7.0,
          child: Opacity(
            opacity: 0.6,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
              child: null,
            ),
          ),
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          right: (width * 0.15),
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            child: null,
          ),
        ),
        Positioned(
          left: (((width - (width * 0.15)) / 2) - 50),
          bottom: -50,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/image_01.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
