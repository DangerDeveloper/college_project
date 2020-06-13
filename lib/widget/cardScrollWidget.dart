import 'dart:math';

import '../data.dart';
import 'package:flutter/material.dart';

final cardAspectRatio = 12.0 / 22.0;
final widgetAspectRatio = cardAspectRatio * 1.2;

class CardScrollWidget extends StatelessWidget {
  final padding = 20.0;
  final verticalInset = 20.0;
  final double currentPage;
  List<Widget> cardList = [];

  CardScrollWidget(this.currentPage);

  void addWidget(contraints) {
    final width = contraints.maxWidth;
    final height = contraints.maxHeight;
    final safeWidth = width - 2 * padding;
    final safeHeight = height - 2 * padding;
    final heightOfPrimaryCard = safeHeight;
    final widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;
    final primaryCardLeft = safeWidth - widthOfPrimaryCard;
    final horizontalInset = primaryCardLeft / 2;

    for (int i = 0; i < images.length; i++) {
      final delta = i - currentPage;
      final isOnRight = delta > 0;
      final start = padding + max(primaryCardLeft - horizontalInset * -delta * (isOnRight ? 15 : 1), 0.0);
      final cardItem = Positioned.directional(
        top: padding + verticalInset * max(-delta, 0.0),
        bottom: padding + verticalInset * max(-delta, 0.0),
        start: start,
        textDirection: TextDirection.rtl,
        child: AspectRatio(
          aspectRatio: cardAspectRatio,
          child: Container(
            child: Image.asset(
              images[i],
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
      cardList.add(cardItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
        builder: (ctx, constraint) {
          addWidget(constraint);
          return Stack(
            children: cardList,
          );
        },
      ),
    );
  }
}
