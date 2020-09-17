import 'package:cardscratcher/src/constants/routes.dart';
import 'package:cardscratcher/src/constants/styles/app_colors.dart';
import 'package:cardscratcher/src/utils/app_localization.dart';
import 'package:cardscratcher/src/widgets/empty_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      child: SizedBox(
        height: 40,
        child: SignInButtonBuilder(
          text: AppLocalizations.of(context).translate('sign_in_gmail'),
          icon: Icons.mail,
          onPressed: () {
            Modular.to.pushNamed(Routes.home);
          },
          backgroundColor: AppColors.gmailColor,
        ),
      ),
    );
  }
}
