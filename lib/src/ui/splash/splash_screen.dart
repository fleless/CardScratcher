import 'dart:async';

import 'package:cardscratcher/src/constants/routes.dart';
import 'package:cardscratcher/src/constants/styles/app_images.dart';
import 'package:cardscratcher/src/widgets/empty_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final DateTime _displayDateTime = DateTime.now();

  void _redirectWithDelay(final String route) {
    final int delay = DateTime.now().difference(_displayDateTime).inSeconds;
    if (delay < 3) {
      Timer(Duration(seconds: 3 - delay), () => Modular.to.pushReplacementNamed(route));
    } else {
      Modular.to.pushReplacementNamed(route);
    }
  }

  @override
  void initState() {
    super.initState();
    _redirectWithDelay(Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: AppImages.logo(height: 100),
        ),
      ),
    );
  }
}
