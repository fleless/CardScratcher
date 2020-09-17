import 'package:cardscratcher/src/constants/app_constants.dart';
import 'package:cardscratcher/src/constants/routes.dart';
import 'package:cardscratcher/src/constants/styles/themes/app_theme.dart';
import 'package:cardscratcher/src/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.black));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: AppConstants.title,
      theme: AppTheme.themeData,
      supportedLocales: AppLocalizations.supportedLocales(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateRoute: Modular.generateRoute,
      initialRoute: Routes.splash,
    );
  }
}
