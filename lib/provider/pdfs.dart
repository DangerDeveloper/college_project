import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' as a;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart' as b;

class PdfS extends ChangeNotifier {
  String _urlPDFPath = '';
  String _assetPDFPath = '';
  String filename;

  get urlPDFPath => _urlPDFPath;
  get assetPDFPath => _assetPDFPath;

  Future<File> getFileFromAsset() async {
    try {
      var data = await rootBundle.load(urlPDFPath);
      var bytes = data.buffer.asUint8List();
      var dir = await b.getApplicationDocumentsDirectory();
      File file = File("${dir.path}");
      File assetFile = await file.writeAsBytes(bytes);
      _assetPDFPath = assetFile.path;
      notifyListeners();
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }

  Future<void> deletFromUrl() async {
    try {
      String dir = (await b.getTemporaryDirectory()).path;
      File file = File('$dir/$filename');
      file.deleteSync(recursive: true);
      _urlPDFPath = '';
      notifyListeners();
    } catch (e) {
      notifyListeners();
      throw Exception("Error Deleting. Try Again Later.");
    }
  }

  Future<void> getFileFromUrl() async {
    try {
      final url = 'http://africau.edu/images/default/sample.pdf';
      filename = url.substring(url.lastIndexOf('/') + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await a.consolidateHttpClientResponseBytes(response);
      String dir = (await b.getTemporaryDirectory()).path;
      File file = File('$dir/$filename');
      await file.writeAsBytes(bytes);
      _urlPDFPath = file.path;
      notifyListeners();
    } catch (e) {
      notifyListeners();
      throw Exception("Error Opening PDF. Try Again Later.");
    }
  }

  Future<void> downloadPdf() async {
    try {
      final url = 'http://africau.edu/images/default/sample.pdf';
      final filename = url.substring(url.lastIndexOf('/') + 1);
      String dir = (await b.getApplicationDocumentsDirectory()).path;
      String path = "$dir/pdfs/$filename";
      await Dio().download(url, path);
      _assetPDFPath = path;
      notifyListeners();
    } catch (e) {
      notifyListeners();
      throw Exception('Error Downloading. Try Again Later.');
    }
  }
}











