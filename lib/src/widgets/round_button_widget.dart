import 'package:cardscratcher/src/constants/styles/app_images.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatefulWidget {
  String buttonIconPath;
  double startOffset;
  RoundButton(this.buttonIconPath, this.startOffset);
  @override
  _State createState() => _State();
}

class _State extends State<RoundButton> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  String roundButtonPath = AppImages.buttonRound;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )
      ..forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: offsetAnimation(widget.startOffset),
      child: GestureDetector(
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(roundButtonPath),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Image(
                width: 30,
                height: 30,
                color: Colors.black,
                image: AssetImage(widget.buttonIconPath),
              ),
            ), // button text
          ),
          onTapDown: _onButtonTapDown,
          onTapUp: _onButtonTapUp,
          onTap: () {
            print("you clicked my");
          }),
    );
  }


  _onButtonTapDown(TapDownDetails details) {
    print(details);
    setState(() {
      roundButtonPath = AppImages.buttonRoundClicked;
    });
  }

  _onButtonTapUp(TapUpDetails details) {
    print(details);
    setState(() {
      roundButtonPath = AppImages.buttonRound;
    });
  }

  Animation<Offset> offsetAnimation(double startOffset) {
    Animation<Offset> _offsetAnimation = Tween<Offset>(
      begin: Offset(startOffset, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
    ));
    return _offsetAnimation;
  }
}
