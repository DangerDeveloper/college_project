import '../direct_select/direct_select.dart';
import 'package:flutter/material.dart';

class DropDownPDF extends StatefulWidget {
  final List<String> list;
  final Function set;
  final position;
  final Function showScaffold;

  DropDownPDF({this.list, this.set, this.position, this.showScaffold});

  @override
  _DropDownPDFState createState() => _DropDownPDFState();
}

class _DropDownPDFState extends State<DropDownPDF> {
  List<Widget> _buildItems1() {
    return widget.list
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    DirectSelect(
                      showScaffold: widget.showScaffold,
                      itemExtent: 37.0,
                      selectedIndex: widget.position,
                      child: MySelectionItem(
                        isForList: false,
                        title: widget.list[widget.position],
                      ),
                      items: _buildItems1(),
                      onSelectedItemChanged: (index) {
                        widget.set(index);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;

  const MySelectionItem({Key key, this.title, this.isForList = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: isForList
          ? Padding(
              child: _buildItem(
                context,
                Alignment.center,
              ),
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, right: 10.0, left: 20.0),
            )
          : Card(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: _buildItem(context, Alignment.centerLeft),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 10.0,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.import_export),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Widget _buildItem(BuildContext context, AlignmentGeometry alig) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: alig,
      child: FittedBox(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
