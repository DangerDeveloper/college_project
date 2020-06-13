import '../logic/select_dropdown_chapter_pdf.dart';
import '../routs/routs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UnitTopicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<SelectDropDownChapterPDF>(context);
    List<String> semester = data.semester;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: Text(
                        'Pharmacognosy',
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: Text(
                        'Unit: 1',
                        style: TextStyle(fontSize: 16.0, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
                itemCount: semester.length,
                itemBuilder: (ctx, int) {
                  return ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    onTap: () {
                      Navigator.of(context).pushNamed(ROUTES.UNIT_TOPIC_DOWNLOAD_PAGE);
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
