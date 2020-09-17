import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NetworkErrorMessages extends StatelessWidget {
  final Stream<String> error;

  const NetworkErrorMessages({this.error});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: error,
      builder: (BuildContext context, AsyncSnapshot<String> snap) {
        if (snap.hasData && snap.data != null) {
          Future.delayed(const Duration(), () {
            final errorBar = SnackBar(
              backgroundColor: Colors.red,
              content: Text(snap.data),
              duration: const Duration(seconds: 5),
            );
            Scaffold.of(context).showSnackBar(errorBar);
          });
          return const SizedBox.shrink();
        } else {
          return Container();
        }
      },
    );
  }
}
