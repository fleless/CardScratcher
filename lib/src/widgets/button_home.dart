import 'package:flutter/material.dart';
import 'package:cardscratcher/src/constants/styles/app_images.dart';

class ButtonHome extends StatefulWidget {

  final VoidCallback _onTap;
  ButtonHome(this._onTap);

  @override
  _ButtonHomeState createState() => _ButtonHomeState();
}

class _ButtonHomeState extends State<ButtonHome> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  String roundButtonPath = AppImages.buttonHome;



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
      position: offsetAnimation(2),
      child: GestureDetector(
          child: Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(roundButtonPath),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text("Jouer",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  )
              ),
            ), // button text
          ),
          onTapDown: _onButtonTapDown,
          onTapUp: _onButtonTapUp,
          onTap: widget._onTap, /*() {
            if(AdManager.adIsLoaded)
              AdManager.interstitialAd.show();
            else
              print("adEvent : ad is not loaded");

        showScratchViewDialog(context);
          }*/
          ),
    );
  }

  _onButtonTapDown(TapDownDetails details) {
    print(details);
    setState(() {
      roundButtonPath = AppImages.buttonHomeClicked;
    });
  }

  _onButtonTapUp(TapUpDetails details) {
    print(details);
    setState(() {
      roundButtonPath = AppImages.buttonHome;
    });
  }

  Animation<Offset> offsetAnimation(double startOffset) {
    Animation<Offset> _offsetAnimation = Tween<Offset>(
      begin: Offset(0, startOffset),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
    ));
    return _offsetAnimation;
  }
}
