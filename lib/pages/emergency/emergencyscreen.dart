import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iit_app/model/appConstants.dart';

class EmergencyScreen extends StatefulWidget {
  @override
  _EmergencyScreenState createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  FocusNode focusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF176ede),
        automaticallyImplyLeading: false,
        elevation: 10.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: Color(0xFFb9d8ff),
              size: 40.0,
            ),
            tooltip: 'Back Icon',
            onPressed: () {},
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Emergency',
              style: GoogleFonts.notoSans(
                textStyle: TextStyle(
                    fontSize: 28, letterSpacing: 0.1),
                fontWeight: FontWeight.w500,
                color: Color(0xFFb9d8ff),
              ),
              
            ),
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
            ),
          ],
        ),
      ),
      body: GridView.count(
        primary: false,
        padding: EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: screensize.height*0.05,
        crossAxisCount: 2,
        children: <Widget>[
            Column(
              children: [
                Container(
                height: screensize.height/8,
                width: screensize.width/2.5,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF3F9FF),
                  ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/vp.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                 ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  'Vatsal Dwiwedi', 
                  style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                ),
                Text(
                  '(V.P.)',
                  style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '+91 95717 14294',
                  style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
        Column(
              children: [
                Container(
                height: screensize.height/8,
                width: screensize.width/2.5,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF3F9FF),
                  ),
                child: Container(
                      // height: 75,
                      // width: 75,
                      // padding: EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/avp.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                 ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  'Shashwat Khare',
                  style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                ),
                Text(
                  '(A.V.P.)',
                  style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '+91 83196 07944',
                  style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                height: screensize.height/7.75,
                width: screensize.width/2.5,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF3F9FF),
                  ),
                child: Container(
                      // height: 75,
                      // width: 75,
                      // padding: EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/contact1.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                 ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  'Arpit Mehta',
                  style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                ),
                Text(
                  '+91 88998 57897',
                  style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  ),
                ),
                
              ]
          ),
          Column(
              children: [
                Container(
                height: screensize.height/7.75,
                width: screensize.width/2.5,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF3F9FF),
                  ),
                child: Container(
                      // height: 75,
                      // width: 75,
                      // padding: EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/contact2.jpeg'),
                          fit: BoxFit.cover,                         
                        ),
                      ),
                 ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  'Vaishnav Khaitan',
                  style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                ),
                Text(
                  '+91 90686 74125',
                  style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  ),
                ),
                
              ]
          ),
          Column(
              children: [
                Container(
                height: screensize.height/7.75,
                width: screensize.width/2.5,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF3F9FF),
                  ),
                child: Container(
                      // height: 75,
                      // width: 75,
                      // padding: EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/guest.png'),
                          fit: BoxFit.cover,                         
                        ),
                      ),
                 ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  'Ajay Vasishth',
                  style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                ),
                Text(
                  '+91 1234567890',
                  style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  ),
                ),
                
              ]
          ),
        Column(
              children: [
               Container(
                height: screensize.height/7.75,
                width: screensize.width/2.5,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF3F9FF),
                  ),
                child: Container(
                      // padding: EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/ambulance.png'),
                         
                        ),
                      ),
                 ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  'Ambulance',
                  style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                ),
                Text(
                  '+91 1234567890',
                  style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  ),
                ),
              ]
        ),
        Column(
              children: [
                Container(
                height: screensize.height/7.75,
                width: screensize.width/2.5,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF3F9FF),
                  ),
                child: Container(
                      // height: 75,
                      // width: 75,
                      // padding: EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/interview.png'),
                         
                        ),
                      ),
                 ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  'Counsellor',
                  style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                ),
                Text(
                  '+91 1234567890',
                  style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  ),
                ),
              ]
        ),
        Column(
          
              children: [
                Container(
                height: screensize.height/7.75,
                width: screensize.width/2.5,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF3F9FF),
                  ),
                child: Container(
                      // height: 75,
                      // width: 75,
                      // padding: EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/insurance.png'),
                         
                        ),
                      ),
                 ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  'Proctor Office',
                  style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                ),
                Text(
                  '+91 1234567890',
                  style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xFF176ede),
                  letterSpacing: .2,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  ),
                ),
              ]
        ),
        ]
      ),
    );
  }
}