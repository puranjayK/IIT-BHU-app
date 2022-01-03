import 'dart:ui';
import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iit_app/data/internet_connection_interceptor.dart';
import 'package:iit_app/model/appConstants.dart';
import 'package:iit_app/model/built_post.dart';
import 'package:intl/intl.dart';

class NoticeBoard extends StatelessWidget {
  const NoticeBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: buildAllNotices(context));
  }
}

FutureBuilder<Response> buildAllNotices(BuildContext context,
    {Function reload}) {
  Size screensize = MediaQuery.of(context).size;
  return FutureBuilder<Response<BuiltList<BuiltAllNotices>>>(
    future: AppConstants.service.getAllNotices(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          if (snapshot.error is InternetConnectionException) {
            AppConstants.internetErrorFlushBar.showFlushbar(context);
          }
          return Center(
            child: Text(
              snapshot.error.toString(),
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
            ),
          );
        }

        final posts = snapshot.data.body;

        return _builtAllNotices(context, posts, reload: reload);
      } else {
        return Container(
          height: screensize.height * 0.285,
          child: Row(
            children: [
              SizedBox(
                width: screensize.width * 0.44,
              ),
              Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF176ede),
                ),
              ),
            ],
          ),
        );
      }
    },
  );
}
//sample[i]['date'].day >= DateTime.now().day

Widget _builtAllNotices(BuildContext context, BuiltList<BuiltAllNotices> posts,
    {Function reload}) {
  return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: posts.length,
      itemBuilder: (context, item) {
        DateTime date = DateTime.tryParse(posts[item].date);
        bool isActive = date.day >= DateTime.now().day &&
            date.month >= DateTime.now().month &&
            date.year >= DateTime.now().year;
        bool isPinned = posts[item].importance > 0;
        return Container(
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
            color: isPinned ? Color(0xFFd1e6ff) : Color(0xFFf3f9ff),
          ),
          child: Row(
            children: [
              Icon(
                Icons.circle,
                color: isActive ? Color(0xFF00d823) : Color(0xFFff0000),
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
                      posts[item].title,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Color(0xFF1d72df),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      _dateFormatter(date),
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
              isPinned
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
        );
      });
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
