import 'dart:io';

import './pdf_view_page.dart';
import '../provider/pdfs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UnitTopicDownloadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<PdfS>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
                width: double.infinity,
                alignment: Alignment.center,
                height: 150,
                child: CircleAvatar(
                  radius: 70,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Text(
                      'AJAY SINGH GAUTAM',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Biotechnology',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Teacher at : PSIT, Kanpur',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Experience: 10 years',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
                width: double.infinity,
                height: 100,
                child: ListTile(
                  onTap: () async {
                    await data.getFileFromUrl();
                    var x = data.urlPDFPath;
                    if (x != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => PdfViewPage(
                            path: x,
                          ),
                        ),
                      ).then((_) {
                        data.deletFromUrl();
                      });
                    } else {
                      print('Somthing Went Wrong.');
                    }
                  },
                  title: Text('Medicine'),
                  trailing: IconButton(
                    icon: Icon(Icons.file_download),
                    onPressed: () async {
                      await data.downloadPdf();
                      print('download pdf and save to local dard drive.');
                    },
                  ),
                ),
              ),
              ListTile(
                title: Text('data'),
                onTap: () async {
                  var x = data.assetPDFPath;
                  if (x != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => PdfViewPage(
                          path: x,
                        ),
                      ),
                    );
                  } else {
                    print('fuck');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
