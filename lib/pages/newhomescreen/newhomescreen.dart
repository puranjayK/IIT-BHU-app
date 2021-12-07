import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iit_app/pages/newhomescreen/events.dart';

class NewHomeScreen extends StatefulWidget {
  @override
  _NewHomeScreenState createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  @override
  // ignore: override_on_non_overriding_member
  FocusNode focusNode = new FocusNode();
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          GestureDetector(
            onTap: null,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.12,
              margin: EdgeInsets.only(top: 7.5, right: 8.0),
              child: Stack(
                children: [
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/profile.jpeg',
                          height: 42.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(right: 10.0, child: Online()),
                ],
              ),
            ),
          ),
        ],
        title: Container(
          width: MediaQuery.of(context).size.width * 0.65,
          decoration: BoxDecoration(
            color: Color(0xFFb9d8ff),
            borderRadius: BorderRadius.circular(40.0),
          ),
          height: 40,
          child: Center(
            child: TextField(
              style: GoogleFonts.notoSans(
                textStyle:
                    TextStyle(fontSize: 14, height: 2.0, letterSpacing: 0.1),
                fontWeight: FontWeight.w500,
              ),
              key: Key("buy_subject_input"),
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
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 18.0, top: 13.0, bottom: 8.0),
              child: Text(
                'Ongoing Events',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Color(0xFF176ede),
                    letterSpacing: .2,
                    fontSize: 23.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Events(),
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
