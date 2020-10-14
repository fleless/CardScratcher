import 'package:cardscratcher/src/constants/routes.dart';
import 'package:cardscratcher/src/constants/styles/app_colors.dart';
import 'package:cardscratcher/src/constants/styles/app_icons.dart';
import 'package:cardscratcher/src/constants/styles/app_images.dart';
import 'package:cardscratcher/src/widgets/round_button_widget.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          DrawerHeader(
            child: Container(
                height: 142,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage(AppImages.nintyNine),
                )),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
          ),
          SizedBox(
            height: 80,
          ),
          GestureDetector(
              child: InkWell(
                  splashColor: Colors.cyan,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      'Règles du jeu',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ))),
          SizedBox(
            height: 60,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Nous contacter',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
            },
            child: Text(
              'Déconnexion',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 80,
          ),
          RoundButton(AppIcons.closeIcon, 0, (){Navigator.of(context).pop();})
        ],
      ),
    ));
  }
}
