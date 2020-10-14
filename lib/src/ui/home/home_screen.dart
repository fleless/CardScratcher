import 'dart:ui';
import 'package:cardscratcher/src/constants/styles/app_colors.dart';
import 'package:cardscratcher/src/ui/home/OtherUtils.dart';
import 'package:cardscratcher/src/widgets/marquee_widget.dart';
import 'package:quiver/async.dart';
import 'package:cardscratcher/src/constants/styles/app_icons.dart';
import 'package:cardscratcher/src/ui/home/ad_manager.dart';
import 'package:cardscratcher/src/widgets/button_home.dart';
import 'package:cardscratcher/src/widgets/drawer_widget.dart';
import 'package:cardscratcher/src/widgets/empty_app_bar_widget.dart';
import 'package:cardscratcher/src/widgets/round_button_widget.dart';
import 'package:cardscratcher/src/widgets/scratcher_widget.dart';
import 'package:cardscratcher/src/widgets/timer_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:confetti/confetti.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _startTime = 30;
  int _currentTime = 0;
  String timerText = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ConfettiController _controllerTopCenter;
  CountdownTimer countDownTimer;

  @override
  void initState() {
    super.initState();
    _controllerTopCenter =
        ConfettiController(duration: const Duration(milliseconds: 500));
    countDownTimer = startTimer();
    AdManager.initAdMob();
    AdManager.onAdClosed = () => {
          if (AdManager.adIsReadyToShow)
            showScratchViewDialog(context, confettiWidget(),
                _controllerTopCenter.play, startTimer)
          else
            HomeUtils.showCenterFlash(context: context,message: "Please wait for the timer to finish.", alignment: Alignment.topCenter)
        };
  }

  @override
  void dispose() {
    AdManager.interstitialAd.dispose();
    _controllerTopCenter.dispose();
    countDownTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      appBar: EmptyAppBar(),
      body: SafeArea(
        child: Container(
          color: AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: _buildContent(),
        ),
        //LoadingIndicator(loading: _bloc.loading),
        //NetworkErrorMessages(error: _bloc.error),
      ),
    );
  }

  Widget _buildContent() {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: <Widget>[
          ListTile(
            leading: RoundButton(AppIcons.menuICon, -2,
                () => {_scaffoldKey.currentState.openDrawer()}),
            trailing: RoundButton(
                AppIcons.userIcon,
                2,
                () => {
                      HomeUtils.showCenterFlash(context: context,message: "Coming soon...", alignment: Alignment.topCenter)
                    }),
          ),
          Expanded(
            flex: 5,
            child: Center(
              child: TimerView(timerText),
            ),
          ),
          Expanded(
            flex: 1,
            child: AnimatedOpacity(
              opacity: HomeUtils.isVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Text(
                "Les derniers gagnants",
                style: TextStyle(fontFamily: 'Poppins', fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: AnimatedOpacity(
              curve: Curves.easeInBack,
              opacity: HomeUtils.isVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Marquee(),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: ButtonHome(() => {
                    if (AdManager.adIsLoaded)
                      AdManager.interstitialAd.show()
                    else
                      HomeUtils.showCenterFlash(context: context,message: "ad is not loaded. Press the play button again.", alignment: Alignment.topCenter)
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget confettiWidget() {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        minimumSize: Size(10, 10),
        maximumSize: Size(20, 20),
        emissionFrequency: 0.6,
        confettiController: _controllerTopCenter,
        blastDirectionality: BlastDirectionality.explosive,
        // don't specify a direction, blast randomly
        shouldLoop: false,
        // start again as soon as the animation is finished
        colors: const [
          Colors.green,
          Colors.blue,
          Colors.pink,
          Colors.orange,
          Colors.purple
        ], // manually specify the colors to be used
      ),
    );
  }

  CountdownTimer startTimer() {
    CountdownTimer countDownTimer = CountdownTimer(
      Duration(seconds: _startTime),
      Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _currentTime = _startTime - duration.elapsed.inSeconds;
        timerText = _currentTime.toString() + " Sec";
      });
    });

    sub.onDone(() {
      setState(() {
        timerText = "tawa";
      });
      sub.cancel();
      AdManager.adIsReadyToShow = true;
    });
    return countDownTimer;
  }
}
