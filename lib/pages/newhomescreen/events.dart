import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Row(
          children: [
            EventCard(
              image: "assets/treasure.jpg",
              eventstatus: true,
              press: () {},
            ),
            EventCard(
              image: "assets/treasure.jpg",
              eventstatus: true,
              press: () {},
            ),
            EventCard(
              image: "assets/treasure.jpg",
              eventstatus: false,
              press: () {},
            ),
            EventCard(
              image: "assets/treasure.jpg",
              eventstatus: false,
              press: () {},
            ),
            EventCard(
              image: "assets/treasure.jpg",
              eventstatus: false,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({
    this.image,
    this.eventstatus,
    this.press,
  });

  final String image;
  final bool eventstatus;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Container(
        margin: EdgeInsets.only(left: 1.0, right: 1.0),
        width: 170.0,
        height: 170.0,
        child: Stack(
          children: [
            Container(
              height: 160.0,
              width: 155.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: new DecorationImage(
                  image: new AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if (eventstatus == true)
              Positioned(
                right: 10.0,
                bottom: 155.0,
                child: EventOnline(),
              ),
          ],
        ),
      ),
    );
  }
}

class EventOnline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.0,
      width: 15.0,
      decoration:
          BoxDecoration(color: Color(0xFF00d823), shape: BoxShape.circle),
    );
  }
}
