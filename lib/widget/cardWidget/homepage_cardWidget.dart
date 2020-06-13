import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/offset_controller.dart';
import './item_page.dart';
import '../../controllers/page_controller_app.dart';

class HomePageCreditCard extends StatefulWidget {
  @override
  _HomePageCreditCardState createState() => _HomePageCreditCardState();
}

class _HomePageCreditCardState extends State<HomePageCreditCard> {
  final PageController pageController = PageController(viewportFraction: 0.7);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => OffsetController(pageController),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: -40.0,
            right: 0.0,
            top: 0.0,
            bottom: 0.0,
            child: PageView(
              physics: ClampingScrollPhysics(),
              controller: pageController,
              onPageChanged: (index) {
                Provider.of<PageControllerApp>(context, listen: false)
                    .setPageIndex(index);
              },
              children: <Widget>[
                ItemPage(
                  index: 0,
                  imageUrl:
                      'https://images.unsplash.com/photo-1557682257-2f9c37a3a5f3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=486&q=80',
                ),
                ItemPage(
                  index: 1,
                  imageUrl:
                      'https://images.unsplash.com/photo-1557683304-673a23048d34?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                ),
                ItemPage(
                  index: 2,
                  imageUrl:
                      'https://images.unsplash.com/photo-1551917951-148edcd8ea8d?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                ),
                ItemPage(
                  index: 3,
                  imageUrl:
                      'https://images.unsplash.com/photo-1569982175971-d92b01cf8694?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
