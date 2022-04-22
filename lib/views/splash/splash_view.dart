import 'package:big_cart/viewmodels/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';

import 'background.dart';
import 'foreground.dart';

class SplashView extends HookWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
    );

    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (viewModel) => viewModel.initializeApp(),
      builder: (context, model, child) => Scaffold(
        body: FadeTransition(
          opacity: animation,
          child: Stack(
            alignment: Alignment.center,
            children: const [
              Background(),
              Foreground(),
            ],
          ),
        ),
      ),
    );
  }
}
