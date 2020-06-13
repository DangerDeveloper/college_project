import '../logic/select_dropdown_chapter_pdf.dart';
import '../routs/routs.dart';
import '../widget/drop_down_pdf.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PdfPage extends StatefulWidget {
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  void _showScaffold() {
    final snackBar = SnackBar(content: Text('Hold and drag instead of tap'));
    scaffoldKey.currentState.removeCurrentSnackBar();
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<SelectDropDownChapterPDF>(context);
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          ConstantText('Select Semester'),
          SizedBox(
            height: 3,
          ),
          Container(
            alignment: Alignment.center,
            height: (width * 0.12) > 70 ? 80 : ((width * 0.12) + 20),
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: DropDownPDF(
                showScaffold: _showScaffold,
                list: data.semester,
                set: data.setSemester,
                position: data.semesterPosition,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          ConstantText('Select Subject'),
          SizedBox(height: 3.0),
          Container(
            alignment: Alignment.center,
            height: (width * 0.12) > 70 ? 80 : ((width * 0.12) + 20),
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: DropDownPDF(
                showScaffold: _showScaffold,
                list: data.subject,
                set: data.setSubject,
                position: data.subjectPosition,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          ConstantText('Select Unit'),
          SizedBox(height: 3.0),
          Container(
            alignment: Alignment.center,
            height: (width * 0.12) > 70 ? 80 : ((width * 0.12) + 20),
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: DropDownPDF(
                showScaffold: _showScaffold,
                list: data.unit,
                position: data.unitPosition,
                set: data.setUnit,
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Container(
            width: double.infinity,
            height: width * 0.13,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                textColor: Colors.white,
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.of(context).pushNamed(ROUTES.UNIT_TOPIC_PAGE);
                },
                child: Text(
                  'CLICK HEAR',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
