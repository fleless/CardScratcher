import 'package:cardscratcher/src/constants/styles/app_colors.dart';
import 'package:cardscratcher/src/constants/styles/app_images.dart';
import 'package:cardscratcher/src/ui/home/ad_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

final scratchKey = GlobalKey<ScratcherState>();

showScratchViewDialog(BuildContext context, Widget confettiWidget, VoidCallback confettiPlay, VoidCallback resetTimer) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.7),
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Stack(
          children: <Widget>[
            Transform(
              transform:
                  Matrix4.translationValues(0.0, -curvedValue * 200, 0.0),
              child: Opacity(
                opacity: a1.value,
                child: AlertDialog(
                  backgroundColor: AppColors.accentColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  title: Align(
                    alignment: Alignment.center,
                    child: Text('9ar9ech!!', style: TextStyle(fontFamily: 'Poppins', fontSize: 20.0, color: Colors.white)),
                  ),
                  content: Scratcher(
                    image: Image(image: AssetImage(AppImages.nintyNine),fit: BoxFit.fill,),
                    key: scratchKey,
                    accuracy: ScratchAccuracy.high,
                    threshold: 75,
                    brushSize: 40,
                    onThreshold: () {
                      scratchKey.currentState
                          .reveal(duration: Duration(milliseconds: 2000));
                      confettiPlay.call();
                      AdManager.adIsReadyToShow = false;
                      resetTimer.call();
                    },
                    child: Container(
                      color: Colors.white,
                      height: 300,
                      width: 300,
                      alignment: Alignment.center,
                      child: Text(
                        "200\$",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            confettiWidget,
          ],
        );
      },
      transitionDuration: Duration(milliseconds: 500),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return null;
      });
}
