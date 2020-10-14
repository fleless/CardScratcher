import 'package:marquee_flutter/marquee_flutter.dart';
import 'package:flutter/material.dart';

class Marquee extends StatefulWidget {
  @override
  _MarqueeState createState() => _MarqueeState();
}

class _MarqueeState extends State<Marquee> {
  String spacing = "     ";
  @override
  Widget build(BuildContext context) {
    return MarqueeWidget(
            text: "Firass Hamed$spacing Fahmi Barguellil$spacing Foulen Ben Foulen$spacing Test Ben Teestt",
            textStyle: new TextStyle(fontFamily: 'Poppins', fontSize: 15.0, fontWeight: FontWeight.w700,color: Colors.white
            ),
            scrollAxis: Axis.horizontal,
          );


  }
}
