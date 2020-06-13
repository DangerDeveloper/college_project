import 'package:flutter/material.dart';

class SelectData extends StatefulWidget {
  List<String> list;

  SelectData(this.list);

  @override
  _SelectDataState createState() => _SelectDataState();
}

class _SelectDataState extends State<SelectData> {
  int currentPage = 0;
  PageController pageController;
  double pageControllerPage = 0.0;
  double offsetY;

  @override
  void initState() {
    pageController = PageController(
      initialPage: currentPage,
      viewportFraction: 0.3,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    pageController.addListener(() {
      setState(() {
        pageControllerPage = pageController.page;
        currentPage = pageControllerPage.toInt();
      });
    });
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      controller: pageController,
      itemCount: widget.list.length,
      itemBuilder: (c, index) {
        offsetY = (pageControllerPage - index).abs() * 20;
        double value = ((1.0 - ((pageControllerPage - index).abs() / 2)).abs());
        double fontSize = (width * 0.07) + ((-offsetY) / 3);
        return AnimatedOpacity(
          duration: Duration(milliseconds: 100),
          opacity: value > 1 ? 1 : value,
          child: Transform.translate(
            offset: Offset(0, offsetY),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF339DFA),
                        Color(0xFF339DFA),
                        Color(0xFF03C3CC),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
                    child: Text(
                      widget.list[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSize,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

//AnimatedContainer(
//duration: Duration(milliseconds: 200),
//alignment: Alignment.center,
//decoration: BoxDecoration(
//color: Colors.grey[800],
//borderRadius: BorderRadius.all(
//Radius.circular(10.0),
//),
//boxShadow: [
//BoxShadow(
//color: Colors.grey[900],
//blurRadius: 15.0,
//spreadRadius: 1.0,
//offset: Offset(4.0, 4.0),
//),
//BoxShadow(
//color: Colors.white,
//blurRadius: 15.0,
//spreadRadius: 1.0,
//offset: Offset(-4.0, -4.0),
//),
//]),
//width: (width * 0.45) + (-offsetY),
//height: (width * 0.2) + (-offsetY),
//child: Text(
//widget.list[index],
//login.style: TextStyle(
//color: Colors.white,
//fontSize: (width * 0.07) + ((-offsetY) / 3),
//),
//),
//)
