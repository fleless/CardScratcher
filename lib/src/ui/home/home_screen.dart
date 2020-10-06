import 'package:cardscratcher/src/widgets/empty_app_bar_widget.dart';
import 'package:cardscratcher/src/widgets/round_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:scratcher/scratcher.dart';

import '../../constants/routes.dart';
import '../../constants/styles/app_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: _buildContent(),
        ),
        //LoadingIndicator(loading: _bloc.loading),
        //NetworkErrorMessages(error: _bloc.error),
      ),
    );
  }

  Widget _buildContent() {
    return Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                tooltip: 'Increase volume by 10',
                onPressed: () {
                  Modular.to.pushNamed(Routes.login);
                },
              ),
              ListTile(
                leading: RoundButton(AppIcons.menuICon, -2),
                trailing: RoundButton(AppIcons.userIcon, 2),
              ),
              Padding(padding: EdgeInsets.only(top: 20),),
              Scratcher(
                brushSize: 20,
                threshold: 50,
                accuracy: ScratchAccuracy.high,
                color: Colors.red,
                onChange: (value) => print("Scratch progress: $value%"),
                onThreshold: () => print("Threshold reached, you won!"),
                child: Container(
                  height: 300,
                  width: 300,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
    );
  }
}
