import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iit_app/pages/newHomepage/noticeboard_data.dart';
import 'package:intl/intl.dart';

class NoticeBoard extends StatefulWidget {
  List<NoticeBoardData> data;
  NoticeBoard(this.data);
  @override
  _NoticeBoardState createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
  //List<NoticeBoardData> data = widget.data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data != null) {
      return ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (context, item) => Container(
          height: 60,
          margin: const EdgeInsets.all(4.0),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color:
                widget.data[item].isPinned ? Colors.blue[100] : Colors.blue[50],
          ),
          child: Row(
            children: [
              Icon(
                Icons.circle,
                color: widget.data[item].isActive
                    ? Colors.green[300]
                    : Colors.red[400],
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
                      widget.data[item].title,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Color(0xFF176ede),
                          letterSpacing: .2,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      _dateFormatter(widget.data[item].date),
                      style: TextStyle(color: Colors.blue[700]),
                    ),
                  ],
                ),
              ),
              widget.data[item].isPinned
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
    } else {
      return Center(child: Text("Nothing Found"));
    }
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
