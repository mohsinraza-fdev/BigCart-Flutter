import 'package:flutter/material.dart';
import '../../constants/asset_constants.dart';
import '../../shared/styles.dart';

class PageErrorIndicator extends StatelessWidget {
  const PageErrorIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 80, left: 40, right: 40),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: FittedBox(
              child: Image.asset(
                AssetConstants.errorIcon,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Oops! Something went wrong',
            textAlign: TextAlign.center,
            style: heading5.copyWith(color: appGreyColor),
          )
        ],
      ),
    );
  }
}
