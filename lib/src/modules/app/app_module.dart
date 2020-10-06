import 'package:cardscratcher/src/constants/routes.dart';
import 'package:cardscratcher/src/ui/home/home_screen.dart';
import 'package:cardscratcher/src/ui/login/login_screen.dart';
import 'package:cardscratcher/src/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
  ];

  // Provide all the routes for your module
  @override
  List<ModularRouter> get routers => [
    ...ModularRouter.group(
      transition: TransitionType.defaultTransition,
      routes: [

      ],
    ),
    ...ModularRouter.group(
      transition: TransitionType.fadeIn,
      routes: [
        ModularRouter(Routes.splash, child: (_, args) => SplashScreen()),
        ModularRouter(Routes.login, child: (_, args) => LoginScreen()),
        ModularRouter(Routes.home, child: (_, args) => HomeScreen()),
      ],
    ),
  ];

  // Provide the root widget associated with your module
  @override
  Widget get bootstrap => AppWidget();
}
