import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:iit_app/external_libraries/fab_circular_menu.dart';
import 'package:iit_app/pages/newHomepage/notice_board.dart';
import 'package:iit_app/screens/home_FAB.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<FabCircularMenuState> fabKey =
      GlobalKey<FabCircularMenuState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("homepage"),
      ),
      floatingActionButton: homeFAB(context, fabKey: fabKey),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Noticeboard',
              style: TextStyle(
                color: Colors.blue[800],
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: NoticeBoard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
