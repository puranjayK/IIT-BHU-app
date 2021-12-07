import 'package:flutter/material.dart';
import 'package:iit_app/pages/newHomepage/notice_board.dart';
import 'package:iit_app/pages/newHomepage/noticeboard_data.dart';

class Search extends StatelessWidget {
  String searchVal;
  Search({this.searchVal});

  _searchList() {
    final data = getSampleValues()
        .where((element) => element.title.toLowerCase().startsWith(searchVal))
        .toList();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: NoticeBoard(_searchList()));
  }
}
