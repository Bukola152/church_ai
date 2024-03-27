import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../size_config.dart';

Text CreateGeneralText({
  required String inputText,
  required double fontSize,
  required FontWeight weight,
  required Color colorName,
  bool? softWrap,
  double letterSpacing = 0.0,
  TextAlign? textAlign,
}) {
  return Text(
    inputText,
    textAlign: textAlign,
    softWrap: softWrap,
    style: TextStyle(
        letterSpacing: getProportionateScreenWidth(letterSpacing),
        fontSize: getProportionateScreenWidth(fontSize),
        fontWeight: weight,
        color: colorName),
  );
}
