import 'dart:ui';

import '../consts/const.dart';
import '../controllers/page_controller_app.dart';
import '../routs/routs.dart';
import '../widget/cardWidget/homepage_cardWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (ctx) => PageControllerApp(),
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, right: 18.0, top: 18.0),
                  child: GestureDetector(
                    onTap: () {
                      showMaterialModalBottomSheet(
                          elevation: 50.0,
                          backgroundColor: Colors.white.withOpacity(0.0),
                          context: context,
                          builder: (ctx, scrollController) {
                            return BackdropFilter(
                              child: Container(
                                height: height * 0.65,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0),
                                  ),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 50,
                                      width: double.infinity,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            right: 25.0,
                                          ),
                                          child: Container(
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.close,
                                                size: 28,
                                              ),
                                              onPressed: () =>
                                                  Navigator.of(ctx).pop(),
                                            ),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: 20.0,
                                          right: 20.0,
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 80,
                                                  color: Colors.blueGrey,
                                                ),
                                                padding: EdgeInsets.only(
                                                    top: 5, bottom: 5),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              filter: ImageFilter.blur(sigmaY: 5.0, sigmaX: 5.0),
                            );
                          });
                    },
                    child: Container(
                      width: double.infinity,
                      color: Colors.indigo,
                      height: 100,
                      child: Center(
                        child: Text('Notic Board'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(ROUTES.PDF_PAGE_ROUTE);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: mainContainer,
                      child: Center(
                        child: Text('Chapter PDF'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0,left: 18.0,top: 8.0,bottom: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(ROUTES.EXPERIMENT_PDF_PAGE);
                    },
                    child: Container(
                      width: double.infinity,
                      color: Colors.indigo,
                      height: 100,
                      child: Center(
                        child: Text('Experiment Pdf'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0,left: 18.0,top: 8.0,bottom: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(ROUTES.EXPERIMENT_PDF_PAGE);
                    },
                    child: Container(
                      width: double.infinity,
                      color: Colors.indigo,
                      height: 100,
                      child: Center(
                        child: Text('Previous Question Paper'),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.4,
                  child: HomePageCreditCard(),
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
