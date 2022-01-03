import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iit_app/model/appConstants.dart';
import 'package:iit_app/model/colorConstants.dart';
import 'package:iit_app/ui/search_workshop.dart';
import 'package:iit_app/external_libraries/fab_circular_menu.dart';

AppBar newHomeAppBar(BuildContext context, SearchBarWidget searchBarWidget,
    GlobalKey<FabCircularMenuState> fabKey, FocusNode focusNode) {
  Size screensize = MediaQuery.of(context).size;
  return AppBar(
    backgroundColor: Color(0xFF176ede),
    automaticallyImplyLeading: false,
    elevation: 10.0,
    leading: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Container(
          margin: EdgeInsets.only(left: 5, right: 10),
          height: 35.0,
          width: 35.0,
          child: Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
                // if (fabKey.currentState.isOpen) {
                //   fabKey.currentState.close();
                // }
              },
              child: Icon(
                Icons.menu_rounded,
                color: Color(0xFFb9d8ff),
                size: 40.0,
              ),
            ),
          ),
        )
        // IconButton(
        //   icon: Icon(
        //     Icons.menu_rounded,
        //     color: Color(0xFFb9d8ff),
        //     size: 40.0,
        //   ),
        //   tooltip: 'Menu Icon',
        //   onPressed: () {},
        // ),
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
                textStyle:
                    TextStyle(fontSize: 14, height: 2.0, letterSpacing: 0.1),
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
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => Search(
                //       searchVal: value,
                //     ),
                //   ),
                // );
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
  );
}
