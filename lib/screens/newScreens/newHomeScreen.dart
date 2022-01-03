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
import 'package:iit_app/screens/newScreens/noticeboard.dart';
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
                    child: NoticeBoard(),
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
