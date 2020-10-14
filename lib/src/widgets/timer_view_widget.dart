import 'package:cardscratcher/src/constants/styles/app_colors.dart';
import 'package:cardscratcher/src/constants/styles/app_images.dart';
import 'package:cardscratcher/src/ui/home/OtherUtils.dart';
import 'package:flutter/material.dart';

class TimerView extends StatefulWidget {

  final String remainingTime;

  TimerView(this.remainingTime);

  @override
  _TimerViewState createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> with SingleTickerProviderStateMixin{
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )
      ..forward();
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed)
        setState(() {
            HomeUtils.isVisible = true;
        });
    });
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      child: SlideTransition(
        position: offsetAnimation(-2),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: AssetImage(AppImages.timerView),
              fit: BoxFit.fill,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                    flex: 12,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("100 TND ", style: TextStyle(fontFamily: 'Poppins', fontSize: 40)),
                    ),
                  ),

                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                    flex: 12,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text("EN CASH ", style: TextStyle(fontFamily: 'Poppins', fontSize: 25)),
                    ),
                  ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),

                Expanded(
                  flex: 8,
                  child: Align(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 20,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text("T9ar9icha jeya dans : ", style: TextStyle(fontFamily: 'Poppins', fontSize: 12)),
                            )
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                            flex: 12,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(widget.remainingTime, style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: AppColors.primaryColor)),
                            )
                        )
                      ],
                    ),
                  )
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                )
              ],),
            ),
          ],
        )
      ),
    );
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
