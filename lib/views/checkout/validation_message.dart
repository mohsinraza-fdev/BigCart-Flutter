import 'package:flutter/material.dart';

import '../../shared/styles.dart';

class ValidationMessage extends StatelessWidget {
  bool hasError;
  String? errorMessage;
  ValidationMessage({
    Key? key,
    required this.hasError,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: hasError == false ? 100 : 500),
      opacity: hasError == false ? 0.0 : 1.0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(
          left: 19,
          bottom: 5,
          top: 1,
        ),
        alignment: Alignment.topLeft,
        height: hasError == false ? 0 : 19,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: SizedBox(
                height: 19,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    errorMessage ?? ' ',
                    style: paragraph6.copyWith(color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
