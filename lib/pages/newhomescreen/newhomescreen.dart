import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:iit_app/model/appConstants.dart';
import 'package:iit_app/pages/newhomescreen/events.dart';
import 'package:iit_app/pages/newhomescreen/notice_board.dart';
import 'package:iit_app/pages/newhomescreen/noticeboard_data.dart';
import 'package:iit_app/pages/newhomescreen/search.dart';

class NewHomeScreen extends StatefulWidget {
  @override
  _NewHomeScreenState createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  ValueNotifier<bool> searchListener = ValueNotifier(true);
  @override
  // ignore: override_on_non_overriding_member
  FocusNode focusNode = new FocusNode();
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFffffff),
      floatingActionButton: FabCircularMenu(
          fabMargin: EdgeInsets.only(
              bottom: screensize.height * 0.025,
              right: screensize.width * 0.03),
          fabIconBorder: CircleBorder(),
          fabSize: 55.0,
          fabElevation: 8.0,
          animationDuration: Duration(milliseconds: 800),
          ringColor: Color(0xFFb9d8ff),
          ringDiameter: screensize.width * 0.54,
          ringWidth: (screensize.width * 0.8) / 6.6,
          fabOpenIcon: Icon(
            Icons.menu_rounded,
            color: Color(0xFF176ede),
          ),
          fabCloseIcon: Icon(
            Icons.close_rounded,
            color: Color(0xFF176ede),
          ),
          fabCloseColor: Color(0xFFb9d8ff),
          fabOpenColor: Color(0xFFb9d8ff),
          children: <Widget>[
            FloatingItems(),
            FloatingItems(),
            FloatingItems(),
          ]),
      appBar: AppBar(
        backgroundColor: Color(0xFF176ede),
        automaticallyImplyLeading: false,
        elevation: 10.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: IconButton(
            icon: Icon(
              Icons.menu_rounded,
              color: Color(0xFFb9d8ff),
              size: 40.0,
            ),
            tooltip: 'Menu Icon',
            onPressed: () {},
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: screensize.width * 0.65,
              decoration: BoxDecoration(
                color: Color(0xFFb9d8ff),
                borderRadius: BorderRadius.circular(40.0),
              ),
              height: 40,
              child: Center(
                child: TextField(
                  style: GoogleFonts.notoSans(
                    textStyle: TextStyle(
                        fontSize: 14, height: 2.0, letterSpacing: 0.1),
                    fontWeight: FontWeight.w500,
                  ),
                  focusNode: focusNode,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      size: 30.0,
                      color: Color(0xFF176ede),
                    ),
                  ),
                  onSubmitted: (value) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Search(
                          searchVal: value,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // SizedBox(
            //   width: screensize.width * 0.03,
            // ),
            Container(
              padding: EdgeInsets.all(8),
              height: screensize.height * 0.056,
              width: screensize.width * 0.094,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: (AppConstants.currentUser == null ||
                          AppConstants.isGuest == true ||
                          AppConstants.currentUser.photo_url == '')
                      ? AssetImage('assets/guest.png')
                      : NetworkImage(AppConstants.currentUser.photo_url),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 18.0, top: 10.0, bottom: 8.0),
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
              child:
                  Container(height: screensize.height * 0.28, child: Events()),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 1.0, bottom: 8.0),
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

class Online extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 11.0,
      width: 11.0,
      decoration:
          BoxDecoration(color: Color(0xFF00d823), shape: BoxShape.circle),
    );
  }
}

class FloatingItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Container(
        height: 45.0,
        decoration:
            BoxDecoration(color: Color(0xFF176ede), shape: BoxShape.circle),
      ),
    );
  }
}
