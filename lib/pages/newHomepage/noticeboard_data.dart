import 'package:flutter/material.dart';

class NoticeBoardData {
  String title;
  DateTime date;
  bool isActive;
  bool isPinned;

  NoticeBoardData({
    this.title,
    this.date,
    this.isActive,
    this.isPinned,
  });
}

List<NoticeBoardData> getSampleValues() {
  List<Map> sample = List.generate(
    5,
    (index) => {'title': 'Regarding seating posture', 'date': DateTime.now()},
  );
  //sample.sort(((a, b) => a['date'].compareTo(b['date'])));
  List<NoticeBoardData> data = [
    NoticeBoardData(
        title: 'Pin title',
        date: DateTime.now(),
        isActive: true,
        isPinned: true),
    NoticeBoardData(
        title: 'Pin title',
        date: DateTime.parse("2021-12-08 20:18:04"),
        isActive: true,
        isPinned: false),
    NoticeBoardData(
        title: 'Pin title',
        date: DateTime.parse("2021-11-27 20:18:04"),
        isActive: false,
        isPinned: true),
    NoticeBoardData(
        title: 'Pin title',
        date: DateTime.tryParse("2021-12-02 20:18:04"),
        isActive: false,
        isPinned: true),
    NoticeBoardData(
        title: 'Pin title',
        date: DateTime.tryParse("2021-12-06 20:18:04"),
        isActive: true,
        isPinned: true)
  ];
  bool isActive = false;

  for (var i = 0; i < sample.length; i++) {
    if (sample[i]['date'].day >= DateTime.now().day) {
      isActive = true;
    }

    data.add(
      NoticeBoardData(
        title: sample[i]['title'],
        date: sample[i]['date'],
        isActive: isActive,
        isPinned: false,
      ),
    );
  }

  data.sort((a, b) {
    if (b.isPinned) {
      return 1;
    }
    return -1;
  });
  data.sort((a, b) {
    if (a.isPinned && b.isPinned) {
      return b.date.compareTo(a.date);
    }
    if (!a.isPinned && !b.isPinned) {
      return b.date.compareTo(a.date);
    }
    return -1;
  });

  return data;
}
