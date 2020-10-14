import 'package:cardscratcher/src/constants/styles/app_colors.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
class HomeUtils{

  static bool isVisible = false;


 static void showCenterFlash({
   BuildContext context,
   String message,
    FlashPosition position,
    FlashStyle style,
    Alignment alignment,
  }) {
    showFlash(
      context: context,
      duration: Duration(seconds: 5),
      builder: (_, controller) {
        return Flash(
          controller: controller,
          backgroundColor: Colors.black87,
          borderRadius: BorderRadius.circular(0.0),
          position: position,
          style: style,
          alignment: alignment,
          enableDrag: true,
          onTap: () => controller.dismiss(),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                width: double.infinity,
                child:   DefaultTextStyle(
                  style: TextStyle(color: AppColors.accentColor),
                  child: Text(
                    message,
                  ),
                ),
              ),
          ),
        );
      },
    ).then((_) {
      if (_ != null) {
        // _showMessage(_.toString());
      }
    });
  }
}