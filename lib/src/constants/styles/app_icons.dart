import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'app_colors.dart';

/// This class provides custom svg icons to be used in the project.
///
class AppIcons {
  AppIcons._();

  static const double _iconDefaultSize = 22;

  static Widget selectionOff({
    final double height = _iconDefaultSize,
    final double width = _iconDefaultSize,
  }) =>
      SvgPicture.asset(
        'assets/icons/selection_off.svg',
        height: height,
        width: width,
      );

  static Widget selectionOn({
    final double height = _iconDefaultSize,
    final double width = _iconDefaultSize,
  }) =>
      SvgPicture.asset(
        'assets/icons/selection_on.svg',
        height: height,
        width: width,
      );

  static Widget email({
    final double height = _iconDefaultSize,
    final double width = _iconDefaultSize,
  }) =>
      SvgPicture.asset(
        'assets/icons/email.svg',
        height: height,
        width: width,
      );

  static Widget sms({
    final double height = _iconDefaultSize,
    final double width = _iconDefaultSize,
  }) =>
      SvgPicture.asset(
        'assets/icons/sms.svg',
        height: height,
        width: width,
      );

  static Widget fingerprint({
    final double height = _iconDefaultSize,
    final double width = _iconDefaultSize,
  }) =>
      SvgPicture.asset(
        'assets/icons/fingerprint.svg',
        height: height,
        width: width,
      );

  static Widget user({
    final double height = _iconDefaultSize,
    final double width = _iconDefaultSize,
    final Color color = AppColors.green,
  }) =>
      SvgPicture.asset(
        'assets/icons/user.svg',
        height: height,
        width: width,
        color: color,
      );

  static Widget lock({
    final double height = _iconDefaultSize,
    final double width = _iconDefaultSize,
    final Color color = AppColors.green,
  }) =>
      SvgPicture.asset(
        'assets/icons/lock.svg',
        height: height,
        width: width,
        color: color,
      );

  static Widget facebook = SvgPicture.asset('assets/icons/facebook.svg');
  static Widget google = SvgPicture.asset('assets/icons/google.svg');
  static Widget linkedin = SvgPicture.asset('assets/icons/linkedin.svg');
  static Widget attach = SvgPicture.asset('assets/icons/attach.svg');
}
