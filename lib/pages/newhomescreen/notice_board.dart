import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iit_app/pages/newhomescreen/noticeboard_data.dart';
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
    if (widget.data.isNotEmpty) {
      return ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (context, item) => Container(
          height: 58.0,
          margin: const EdgeInsets.all(4.0),
          padding:
              const EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.shade50,
                offset: const Offset(
                  1.0,
                  1.0,
                ), //Offset
                blurRadius: 3.0,
                spreadRadius: 1.0,
              ),
            ],
            color: widget.data[item].isPinned
                ? Color(0xFFd1e6ff)
                : Color(0xFFf3f9ff),
          ),
          child: Row(
            children: [
              Icon(
                Icons.circle,
                color: widget.data[item].isActive
                    ? Color(0xFF00d823)
                    : Color(0xFFff0000),
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
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Color(0xFF1d72df),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      _dateFormatter(widget.data[item].date),
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Color(0xFF1d72df),
                          fontWeight: FontWeight.w200,
                          fontSize: 13,
                        ),
                      ),
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
      return Center(
          child: Text(
        "No Results Found",
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Color(0xFF1d72df),
            fontWeight: FontWeight.w400,
            fontSize: 25,
          ),
        ),
      ));
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
