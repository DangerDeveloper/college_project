import '../data.dart';
import '../logic/select_dropdown_chapter_pdf.dart';
import '../widget/drop_down_pdf.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExperimentPdfPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  void _showScaffold() {
    final snackBar = SnackBar(content: Text('Hold and drag instead of tap'));
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<SelectDropDownChapterPDF>(context);
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(),
    );
  }
}

class ConstantText extends StatelessWidget {
  final text;

  const ConstantText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 2.0, bottom: 2.0, left: 20.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
