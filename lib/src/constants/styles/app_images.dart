import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

/// This class provides custom svg images to be used in the project.
///
class AppImages {
  AppImages._();

  static Widget logo({final double height, final double width}) => SvgPicture.asset(
    'assets/images/logo.svg',
    height: height,
    width: width,
  );

  static String get welcomeBackgroundSrc => 'assets/images/welcome_background.png';
  static String get splashLogo => 'assets/images/logo.png';
  static String get googleLogo => 'assets/images/google.jpg';
  static String get buttonRound => 'assets/images/button_round.png';
  static String get buttonRoundClicked => 'assets/images/button_round_clicked.png';
}
