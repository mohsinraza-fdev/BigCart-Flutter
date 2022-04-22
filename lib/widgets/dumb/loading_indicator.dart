import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../shared/styles.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 80),
      alignment: Alignment.center,
      child: const SpinKitSpinningLines(
        size: 100,
        color: appGreyColor,
        lineWidth: 3,
        duration: Duration(milliseconds: 1500),
      ),
    );
  }
}
