import 'package:collegeproject/allPage.dart';
import 'package:collegeproject/main_rout/authentication_screen.dart';
import 'package:collegeproject/main_rout/onboarding.dart';
import 'package:collegeproject/provider/auth.dart';
import 'package:collegeproject/provider/onbording_auth.dart';
import 'package:collegeproject/sidebar/sidebar_layout.dart';
import './logins/ui/forgot_password.dart';
import './logic/select_dropdown_chapter_pdf.dart';
import './pages/articles.dart';
import './pages/experiment_pdf_page.dart';
import './pages/pdf_page.dart';
import './pages/unit_topic_download_page.dart';
import './pages/unit_topic_page.dart';
import './provider/pdfs.dart';
import './routs/routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

//int initScreen;

void main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  initScreen = prefs.getInt("initScreen");
//  await prefs.setInt("initScreen", 1);
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: OnbordingAuth(),
        ),
        ChangeNotifierProvider.value(
          value: PdfS(),
        ),
        ChangeNotifierProvider.value(
          value: SelectDropDownChapterPDF(),
        ),
      ],
      child: MaterialApp(
        title: 'College App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: ROUTES.ALL_PAGE,
        routes: {
          ROUTES.ARTICLES_ROUTE: (ctx) => Articles(),
          ROUTES.PDF_PAGE_ROUTE: (ctx) => PdfPage(),
          ROUTES.EXPERIMENT_PDF_PAGE: (ctx) => ExperimentPdfPage(),
          ROUTES.UNIT_TOPIC_PAGE: (ctx) => UnitTopicPage(),
          ROUTES.UNIT_TOPIC_DOWNLOAD_PAGE: (ctx) => UnitTopicDownloadPage(),
          ROUTES.FORGOT_PASSWORD: (ctx) => ForgotPassword(),
          ROUTES.ONBOARDING: (ctx) => OnBoarding(),
          ROUTES.AUTHENTICATION_SCREEN: (ctx) => AuthenticationScreen(),
          ROUTES.ALL_PAGE: (ctx) => AllPage(),
          ROUTES.SIDEBAR_LAYOUT: (ctx) => SideBarLayout(),
        },
      ),
    );
  }
}
