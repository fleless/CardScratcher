import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// LoadingIndicator displays a fullscreen loading indicator depending on loading stream value.
///
class LoadingIndicator extends StatelessWidget {
  final Stream<bool> loading;

  const LoadingIndicator({this.loading});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: loading,
      builder: (context, snapshot) {
        return Visibility(
          visible: snapshot.hasData && snapshot.data,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
