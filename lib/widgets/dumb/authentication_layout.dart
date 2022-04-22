import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/asset_constants.dart';
import '../../shared/helpers.dart';
import '../../shared/styles.dart';

class AuthenticationLayout extends StatelessWidget {
  final Widget form;
  final VoidCallback onBackButtonPressed;
  final String image;
  final VoidCallback? onScreenTap;
  final double minHeight;
  bool? isDisabled;

  AuthenticationLayout(
      {required this.form,
      required this.onBackButtonPressed,
      required this.image,
      required this.minHeight,
      this.onScreenTap,
      this.isDisabled,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
    );

    double formContainerHeight =
        screenHeight(context, percentage: (minHeight / 896)) < minHeight
            ? minHeight
            : screenHeight(context, percentage: (minHeight / 896));

    return GestureDetector(
      onTap: onScreenTap,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight(context),
            width: screenWidth(context),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 131,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.0, 1.0],
                        colors: [
                          Colors.black.withOpacity(1),
                          Colors.black.withOpacity(0),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 63,
                  child: Text(
                    'Welcome',
                    style: heading6,
                  ),
                ),
                Positioned(
                  top: 53,
                  left: 1,
                  child: IconButton(
                    onPressed: onBackButtonPressed,
                    icon: ImageIcon(
                      AssetImage(AssetConstants.backArrow),
                    ),
                    iconSize: 22,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      Container(
                        constraints:
                            BoxConstraints(minHeight: formContainerHeight),
                        decoration: const BoxDecoration(
                          color: appWhiteColor,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                        ),
                        child: form,
                      ),
                      if (isDisabled == true)
                        Positioned.fill(
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
