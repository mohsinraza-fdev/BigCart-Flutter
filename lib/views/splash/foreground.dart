import 'package:flutter/material.dart';
import '../../constants/asset_constants.dart';
import '../../shared/styles.dart';

class Foreground extends StatelessWidget {
  const Foreground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 96),
        Text(
          'Welcome to',
          style: heading4,
        ),
        const SizedBox(height: 1),
        Image.asset(
          AssetConstants.appLogo,
          width: 127,
          height: 50,
        ),
        const SizedBox(height: 17),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 47),
          child: Text(
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
            style: paragraph1,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        Text(
          'POWERED BY',
          style: heading3,
        ),
        const SizedBox(height: 6),
        RichText(
          text: TextSpan(
            text: 'TECH',
            style: heading2,
            children: <TextSpan>[
              TextSpan(text: ' IDARA', style: heading1),
            ],
          ),
        ),
        const SizedBox(height: 31),
      ],
    );
  }
}
