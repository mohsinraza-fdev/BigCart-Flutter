import 'package:flutter/material.dart';

const SizedBox verticalSpaceMini = SizedBox(height: 5);
const SizedBox verticalSpaceSmall = SizedBox(height: 11);
const SizedBox verticalSpaceMedium = SizedBox(height: 17);
const SizedBox verticalSpaceRegular = SizedBox(height: 21);
const SizedBox verticalSpaceLarge = SizedBox(height: 25);

double screenWidth(BuildContext context, {double percentage = 1}) =>
    MediaQuery.of(context).size.width * percentage;
double screenHeight(BuildContext context, {double percentage = 1}) =>
    MediaQuery.of(context).size.height * percentage;
double statusBarHeight(BuildContext context) =>
    MediaQuery.of(context).padding.top;
