import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../shared/styles.dart';
import '../../viewmodels/home_viewmodel.dart';

class LogoutLoadingScreen extends ViewModelWidget<HomeViewModel> {
  const LogoutLoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Positioned.fill(
      child: IgnorePointer(
        ignoring: !viewModel.logoutAnimationActive,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: viewModel.logoutAnimationActive ? 1 : 0,
          child: Container(
            alignment: Alignment.center,
            color: Colors.black.withOpacity(0.7),
            child: Material(
              type: MaterialType.transparency,
              child: Text(
                viewModel.logoutLoadingText,
                style: heading7,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
