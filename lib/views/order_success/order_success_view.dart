import 'package:big_cart/app/app.router.dart';
import 'package:big_cart/constants/asset_constants.dart';
import 'package:big_cart/shared/helpers.dart';
import 'package:big_cart/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/locator.dart';
import '../../widgets/dumb/app_main_button.dart';

class OrderSuccessView extends StatelessWidget {
  int id;
  OrderSuccessView({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
    );
    return WillPopScope(
      onWillPop: () async {
        locator<NavigationService>().clearStackAndShow(Routes.homeView);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetConstants.orderSuccessIcon,
                    width: (screenWidth(context) * (227 / 414)),
                  ),
                  const SizedBox(height: 45),
                  Text(
                    'Congrats',
                    style: heading5.copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Your Order ',
                          style: paragraph8,
                          children: [
                            TextSpan(
                                text: '#' + id.toString().padLeft(5, '0'),
                                style: paragraph9),
                            TextSpan(
                                text: ' is\nSuccessfuly Received',
                                style: paragraph8)
                          ]),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenHeight(
                context,
                percentage: (90 / 896),
              ),
            ),
            AppMainButton(
                onTap: () {
                  locator<NavigationService>()
                      .clearStackAndShow(Routes.homeView);
                },
                text: 'Go to home'),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}
