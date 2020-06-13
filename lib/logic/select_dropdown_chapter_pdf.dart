import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SelectDropDownChapterPDF extends ChangeNotifier {
  int _semesterPosition = 0;
  int _subjectPosition = 0;
  int _unitPosition = 0;

  // i try this but it is only list formet
  Future<void> addProduct() async {
    final url = 'https://pharmacycollege-905e7.firebaseio.com/a.json';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'semester': ['1', '2', '3', '4', '5', '6', '7', '8'],
          'subject': [
            ['a', 'b', 'c'],
            ['d', 'e', 'f', 'g'],
            ['j', 'i', 'h'],
            ['k', 'l', 'm'],
            ['p', 'o', 'n'],
            ['q', 'r', 's'],
            ['v', 'u', 't'],
            ['w', 'x', 'y'],
          ],
          'unit': ['1', '2', '3', '4', '5'],
        }),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  get semesterPosition => _semesterPosition;

  get subjectPosition => _subjectPosition;

  get unitPosition => _unitPosition;

  setSemester(position) {
    _semesterPosition = position;
    notifyListeners();
  }

  setSubject(position) {
    _subjectPosition = position;
    notifyListeners();
  }

  setUnit(position) {
    _unitPosition = position;
    notifyListeners();
  }

  // at last i want to send List<String> because in pdf_page.dart i use list to render widget
  // for creating a drop down list
  List<String> get semester {
    // try this logic to extract data from map which is complicated for me
    List<String> addProduct = [];
    mapss.forEach((productId, productData) {
      List x = productData as List;
      for (int i = 0; i < x.length; i++) {
        addProduct.add(productData[i]['semester']);
      }
    });
    print(addProduct);
    return _semester;
  }

  List<String> get subject {
    return _subject[semesterPosition];
  }

  List<String> get unit {
    return _unit;
  }

  // logic for creating a list
  Map<String, String> unitTopicPageList() {
    Map<String, String> a = {};
    return a;
  }

  // i want this map structure
  Map<String, dynamic> mapss = {
    'college': [
      {
        'semester': '1',
        'subjects': [
          {
            'subjectName': 'Pharmacology',
            'chapters': [
              {
                'chapter': '1',
                'title': 'i',
                'TeacherName': 'i',
                'pdfurl': 'xyz',
              },
              {
                'chapter': '2',
                'data': 'do',
              },
              {
                'chapter': '3',
                'data': 'any',
              },
              {
                'chapter': '4',
                'data': 'thing',
              },
              {
                'chapter': '5',
                'data': 'well',
              },
            ],
          },
          {
            'subjectName': 'Medicine',
            'chapters': [
              {
                'chapter': '1',
                'data': 'king',
              },
              {
                'chapter': '2',
                'data': 'kong',
              },
              {
                'chapter': '3',
                'data': 'ming',
              },
              {
                'chapter': '4',
                'data': 'mong',
              },
              {
                'chapter': '5',
                'data': 'po',
              },
            ],
          },
        ],
      },
      {
        'semester': '2',
        'subjects': [
          {
            'subjectName': 'rock',
            'chapters': [
              {
                'chapter': '1',
                'data': 'if',
              },
              {
                'chapter': '2',
                'data': 'you',
              },
              {
                'chapter': '3',
                'data': 'do',
              },
              {
                'chapter': '4',
                'data': 'wel',
              },
              {
                'chapter': '5',
                'data': 'things',
              },
            ],
          },
          {
            'subjectName': 'Pongo',
            'chapters': [
              {
                'chapter': '1',
                'data': 'lolo',
              },
              {
                'chapter': '2',
                'data': 'pop',
              },
              {
                'chapter': '3',
                'data': 'mok',
              },
              {
                'chapter': '4',
                'data': 'tok',
              },
              {
                'chapter': '5',
                'data': 'ott',
              },
            ],
          },
        ],
      },
    ],
  };

  List<String> _semester = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];

  List _subject = [
    ['a', 'b', 'c'],
    ['d', 'e', 'f', 'g'],
    ['j', 'i', 'h'],
    ['k', 'l', 'm'],
    ['p', 'o', 'n'],
    ['q', 'r', 's'],
    ['v', 'u', 't'],
    ['w', 'x', 'y'],
  ];

  List<String> _unit = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
}
