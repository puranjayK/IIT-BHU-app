import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:iit_app/pages/newHomepage/noticeboard_data.dart';
import 'package:intl/intl.dart';

class NoticeBoard extends StatefulWidget {
  @override
  _NoticeBoardState createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
  List<NoticeBoardData> data = getSampleValues();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, item) => Container(
        height: 60,
        margin: const EdgeInsets.all(4.0),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: data[item].isPinned ? Colors.blue[100] : Colors.blue[50],
        ),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              color: data[item].isActive ? Colors.green[300] : Colors.red[400],
              size: 10,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data[item].title,
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    _dateFormatter(data[item].date),
                    style: TextStyle(color: Colors.blue[700]),
                  ),
                ],
              ),
            ),
            data[item].isPinned
                ? Transform.rotate(
                    angle: 45,
                    child: Icon(
                      Icons.push_pin,
                      color: Colors.grey[800],
                      size: 20,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  _dateFormatter(DateTime date) {
    String day;
    int now = DateTime.now().day;

    if (date.day == now) {
      return 'Today';
    }
    if (date.day == now - 1) {
      return "Yesterday";
    }
    if (date.day == now + 1) {
      return "Tomorrow";
    }
    day = DateFormat('EEEE / dd MMM yyyy').format(date);
    return day;
  }
}
