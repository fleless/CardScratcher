import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/styles/app_colors.dart';
import '../home/home_screen.dart';
import 'lib/flutter_login.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

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
    final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );

    return Container(
      color: AppColors.default_pink,
      child: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FlutterLogin(
          title: 'قرقشني',
          logo: 'assets/images/logo.png',
          onLogin: _authUser,
          onSignup: _authUser,
          onSubmitAnimationCompleted: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
          },
          onRecoverPassword: _recoverPassword,
          theme: LoginTheme(
            primaryColor: AppColors.default_pink,
            accentColor: AppColors.default_yellow,
            errorColor: Colors.deepOrange,
            titleStyle: TextStyle(
              color: AppColors.default_yellow,
              fontFamily: 'Quicksand',
              letterSpacing: 4,
            ),
            bodyStyle: TextStyle(
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.underline,
            ),
            textFieldStyle: TextStyle(
              color: Colors.black,
              shadows: [Shadow(color: Colors.white, blurRadius: 2)],
            ),
            buttonStyle: TextStyle(
              fontWeight: FontWeight.w800,
              color: AppColors.default_yellow,
            ),
            cardTheme: CardTheme(
              color: Colors.white,
              elevation: 5,
              margin: EdgeInsets.only(top: 15),
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
            ),
            inputTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.purple.withOpacity(.1),
              contentPadding: EdgeInsets.zero,
              errorStyle: TextStyle(
                backgroundColor: Colors.transparent,
                color: AppColors.default_pink,
              ),
              labelStyle: TextStyle(fontSize: 12),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1),
                borderRadius: inputBorder,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.default_pink, width: 1),
                borderRadius: inputBorder,
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade700, width: 1),
                borderRadius: inputBorder,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade400, width: 1),
                borderRadius: inputBorder,
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1),
                borderRadius: inputBorder,
              ),
            ),
            buttonTheme: LoginButtonTheme(
              splashColor: Colors.purple,
              backgroundColor: Colors.pinkAccent,
              highlightColor: Colors.lightGreen,
              elevation: 9.0,
              highlightElevation: 6.0,
              //shape: BeveledRectangleBorder(
                //borderRadius: BorderRadius.circular(10),
              //),
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              // shape: CircleBorder(side: BorderSide(color: Colors.green)),
               shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
            ),
          ),
        ),
      ),
      ),
    );
  }

}
