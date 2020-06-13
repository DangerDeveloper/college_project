import '../consts/const.dart';
import '../enum/page_enum.dart';
import '../logic/page_route_logic.dart';
import './about.dart';
import './contact_page.dart';
import './downloads_page.dart';
import './home_page.dart';
import './profile_page.dart';
import './setting_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Templete extends StatefulWidget {
  @override
  _TempleteState createState() => _TempleteState();
}

class _TempleteState extends State<Templete>
    with SingleTickerProviderStateMixin<Templete> {
  AnimationController _animationController;
  final _animationDuration = const Duration(milliseconds: 400);

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final data = Provider.of<PageRouteLogic>(context);
    final pageIndex = data.selectedPage;
    final isSideBarClose = data.isSideBarClose;
    return AnimatedPositioned(
      duration: _animationDuration,
      top: 0,
      bottom: 0,
      left: isSideBarClose ? 0 : width - (width * 0.15),
      right: isSideBarClose ? 0 : -(width + (width * 0.15)),
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: GestureDetector(
                          onTap: () => data.setIsSideBar(_animationController),
                          child: Container(
                            decoration: NAVBAR_CONSTANT,
                            alignment: Alignment.center,
                            child: AnimatedIcon(
                              icon: AnimatedIcons.menu_close,
                              progress: _animationController.view,
                              color: Colors.white,
                              size: 25.0,
                            ),
                          ),
                        ),
                      ),
                      width: width * 0.15,
                      height: width * 0.15,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('College App'),
                      ),
                    ),
                  ],
                ),
              ),
              if (PAGE_ENUM.HOME == pageIndex)
                Expanded(
                  child: HomePage(),
                ),
              if (PAGE_ENUM.PROFILE == pageIndex)
                Expanded(
                  child: ProfilePage(),
                ),
              if (PAGE_ENUM.DOWNLOAD == pageIndex)
                Expanded(
                  child: DownloadsPage(),
                ),
              if (PAGE_ENUM.CONTACT == pageIndex)
                Expanded(
                  child: ContactPage(),
                ),
              if (PAGE_ENUM.SETTING == pageIndex)
                Expanded(
                  child: SettingPage(),
                ),
              if (PAGE_ENUM.ABOUT == pageIndex)
                Expanded(
                  child: About(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
