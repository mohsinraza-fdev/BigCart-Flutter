import 'package:flutter/material.dart';

import '../../shared/styles.dart';

class AuthenticationField extends StatelessWidget {
  AuthenticationField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onSubmit,
    required this.textColor,
    required this.onTap,
    required this.onEditingComplete,
    required this.label,
    required this.prefixIconPath,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.textSize,
    this.hasError,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  Function(String)? onChanged;
  Function(String)? onSubmit;
  VoidCallback onTap;
  VoidCallback onEditingComplete;
  Color textColor;
  String label;
  String prefixIconPath;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool obscureText;
  double? textSize;
  bool? hasError;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: hasError == true ? 300 : 200),
      alignment: Alignment.center,
      height: 62,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 2,
          color: hasError == true ? Colors.red : Colors.transparent,
        ),
      ),
      child: TextFormField(
        style: heading3.copyWith(
            letterSpacing: 15 * (3 / 100),
            color: textColor,
            fontSize: textSize),
        controller: controller,
        focusNode: focusNode,
        textInputAction: TextInputAction.done,
        maxLines: 1,
        textAlignVertical: TextAlignVertical.center,
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        obscureText: obscureText,
        obscuringCharacter: '•',
        decoration: InputDecoration(
            isCollapsed: true,
            border: InputBorder.none,
            label: Text(label),
            labelStyle: heading3.copyWith(letterSpacing: 15 * (3 / 100)),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: prefixIcon ??
                Padding(
                  padding: const EdgeInsets.only(left: 28, right: 21),
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: FittedBox(
                      child: ImageIcon(
                        AssetImage(prefixIconPath),
                        color: appGreyColor,
                      ),
                    ),
                  ),
                ),
            suffixIcon: suffixIcon),
      ),
    );
  }
}
