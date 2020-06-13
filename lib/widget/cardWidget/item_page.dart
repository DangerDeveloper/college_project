import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';
import '../../controllers/offset_controller.dart';
import '../../controllers/page_controller_app.dart';

class ItemPage extends StatelessWidget {
  final Color color;
  final int index;
  final String numberCard;
  final String name;
  final String imageUrl;
  final MultiTrackTween multiTrackTween = MultiTrackTween([
    Track('rotate')
        .add(Duration(milliseconds: 300), Tween(end: -1.1, begin: 0.0)),
    Track('scale')
        .add(Duration(milliseconds: 300), Tween(end: 0.0, begin: 1.0)),
    Track('ocacity')
        .add(Duration(milliseconds: 300), Tween(end: 0.0, begin: 1.0)),
    Track('padding')
        .add(Duration(milliseconds: 300), Tween(end: 35.0, begin: 20.0)),
  ]);

  ItemPage({this.color, this.index, this.numberCard, this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<PageControllerApp>(context, listen: false)
            .setCurrentIndex(index);
      },
      child: Consumer<OffsetController>(
        builder: (ctx, value, ch) {
          int pageIndex =
              Provider.of<PageControllerApp>(context, listen: false).index;
          return Stack(
            children: <Widget>[
              ControlledAnimation(
                tween: multiTrackTween,
                duration: multiTrackTween.duration,
                playback: pageIndex > index
                    ? Playback.PLAY_FORWARD
                    : Playback.PLAY_REVERSE,
                builder: (ctxx, animation) {
                  return Positioned(
                    top: 10.0,
                    left: 0.0,
                    right: animation['padding'],
                    bottom: 20.0,
                    child: Transform.rotate(
                      angle: animation['rotate'],
                      child: Transform.scale(
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 300),
                          opacity: animation['ocacity'],
                          child: ch,
                        ),
                        scale: animation['scale'],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 15.0,
                  spreadRadius: 1.0,
                  offset: Offset(2.0, 10.0)),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
