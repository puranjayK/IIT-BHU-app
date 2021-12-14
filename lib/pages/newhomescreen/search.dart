import 'package:flutter/material.dart';
import 'package:iit_app/pages/newhomescreen/notice_board.dart';
import 'package:iit_app/pages/newhomescreen/noticeboard_data.dart';

class Search extends StatelessWidget {
  String searchVal;
  Search({this.searchVal});

  _searchList() {
    final data = getSampleValues()
        .where((element) =>
            element.title.toLowerCase().contains(searchVal.toLowerCase()))
        .toList();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Search results for "$searchVal"',
              style: TextStyle(
                fontFamily: 'Gilroy',
                color: Colors.white,
                letterSpacing: .2,
                fontSize: 21.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          backgroundColor: Color(0xFF176ede),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              top: 10.0, left: 5.0, right: 5.0, bottom: 10.0),
          child: NoticeBoard(_searchList()),
        ));
  }
}
