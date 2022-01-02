import 'package:flutter/material.dart';
import 'package:iit_app/data/internet_connection_interceptor.dart';
import 'package:iit_app/external_libraries/fab_circular_menu.dart';
import 'package:iit_app/model/appConstants.dart';
import 'package:iit_app/model/colorConstants.dart';
import 'package:iit_app/screens/newScreens/events.dart';
import 'package:iit_app/ui/workshop_custom_widgets.dart';
import '../../services/buildWorkshops.dart' as buildWorkhops;
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iit_app/screens/newScreens/noticeboard_data.dart';
import 'package:intl/intl.dart';

class NewHomeScreen extends StatefulWidget {
  final BuildContext context;
  final GlobalKey<FabCircularMenuState> fabKey;
  final Function(bool refreshed) reload;

  const NewHomeScreen({Key key, this.context, this.fabKey, this.reload})
      : super(key: key);

  @override
  _NewHomeScreenState createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  void onRefresh() async {
    try {
      await AppConstants.updateAndPopulateWorkshops();
      await AppConstants.updateAndPopulateNotices();
    } on InternetConnectionException catch (_) {
      AppConstants.internetErrorFlushBar.showFlushbar(context);
      return;
    } catch (err) {
      print(err);
    }
    this.widget.reload(true);
  }

  @override
  void initState() {
    // _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return RefreshIndicator(
      displacement: 60,
      onRefresh: () async => onRefresh(),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 18.0, top: 15.0, bottom: 8.0),
              child: Text(
                'Events',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 23.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Events(),
              // child: Container(height: screensize.height * 0.28, child: Events()),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 8.0),
              child: Text(
                'Noticeboard',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 23.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 8.0, bottom: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: SizedBox(
                    height: screensize.height * 0.5,
                    child: NoticeBoard(getSampleValues()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
