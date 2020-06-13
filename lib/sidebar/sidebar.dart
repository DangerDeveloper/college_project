import '../provider/auth.dart';

import '../consts/const.dart';
import '../enum/page_enum.dart';
import '../logic/page_route_logic.dart';
import './top_sidebar.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<PageRouteLogic>(context);
    return Container(
      decoration: ARTICLES_MAIN_PAGE_DECORATION_CONST,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: TopSideBar(),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    ListTile(
                      onTap: () {
                        data.setPageEnum(PAGE_ENUM.HOME);
                        data.setAlwaysTrue();
                      },
                      leading: Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 24,
                      ),
                      title: Text(
                        'Home',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        data.setPageEnum(PAGE_ENUM.PROFILE);
                        data.setAlwaysTrue();
                      },
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 24,
                      ),
                      title: Text(
                        'Profile',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        data.setPageEnum(PAGE_ENUM.DOWNLOAD);
                        data.setAlwaysTrue();
                      },
                      leading: Icon(
                        Icons.file_download,
                        color: Colors.white,
                        size: 24,
                      ),
                      title: Text(
                        'Downloads',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        data.setPageEnum(PAGE_ENUM.SHARE);
                        data.setAlwaysTrue();
                      },
                      leading: Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 24,
                      ),
                      title: Text(
                        'Share',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        data.setPageEnum(PAGE_ENUM.CONTACT);
                        data.setAlwaysTrue();
                      },
                      leading: Icon(
                        Icons.contact_mail,
                        color: Colors.white,
                        size: 24,
                      ),
                      title: Text(
                        'Contact',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        data.setPageEnum(PAGE_ENUM.SETTING);
                        data.setAlwaysTrue();
                      },
                      leading: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 24,
                      ),
                      title: Text(
                        'Setting',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        data.setPageEnum(PAGE_ENUM.ABOUT);
                        data.setAlwaysTrue();
                      },
                      leading: Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 24,
                      ),
                      title: Text(
                        'About',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: ListTile(
                onTap: () async {
                  try {
                    await Provider.of<Auth>(context, listen: false)
                        .signOut();
                  } catch (error) {
                    print(error);
                  }
                },
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 22,
                ),
                title: Text('LOGOUT',
                    style: TextStyle(color: Colors.white, fontSize: 18),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//FlareActor(
//'assets/1.flr',
//fit: BoxFit.cover,
//)
