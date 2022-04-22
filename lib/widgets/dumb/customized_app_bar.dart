import 'package:flutter/material.dart';

import '../../shared/styles.dart';

class CustomizedAppBar extends StatelessWidget {
  const CustomizedAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.leadingOnTap,
    this.trailing,
    this.trailingOnTap,
  }) : super(key: key);

  final String title;
  final String? leading;
  final VoidCallback? leadingOnTap;
  final String? trailing;
  final VoidCallback? trailingOnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 29,
            child: Text(
              title,
              style: heading6.copyWith(color: Colors.black),
            ),
          ),
          if (leading != null)
            Positioned(
              left: 0,
              bottom: 29,
              child: GestureDetector(
                onTap: leadingOnTap,
                child: Container(
                  height: 26,
                  width: 40,
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  padding: const EdgeInsets.only(left: 17),
                  child: Image.asset(
                    leading!,
                    width: 23,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          if (trailing != null)
            Positioned(
              right: 0,
              bottom: 29,
              child: GestureDetector(
                onTap: trailingOnTap,
                child: Container(
                  height: 26,
                  width: 40,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 17.41),
                  child: Image.asset(
                    trailing!,
                    width: 18.59,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
