import 'package:cardscratcher/src/widgets/empty_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

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
      child: Scratcher(
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
    );
  }
}
