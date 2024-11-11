import 'package:ctd_design/src/app_font/app_font.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

class DText extends Text {

  DText.base(
      super.text, {
        super.key,
        double? fontSize = FontSizes.medium,
        Color? color = DColor.defaultText,
        FontWeight? fontWeight,
        super.maxLines,
        super.textAlign,
        TextOverflow? textOverflow = TextOverflow.ellipsis,
      }) : super(
    style: GoogleFonts.roboto(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    ),
    overflow: textOverflow,
  );

  DText.regular(
      super.text, {
        super.key,
        double? fontSize = FontSizes.medium,
        Color? color = DColor.defaultText,
        FontWeight? fontWeight = FontWeight.w400,
        super.maxLines,
        super.textAlign,
        TextOverflow? textOverflow = TextOverflow.ellipsis,
      }) : super(
    style: regularFont.copyWith(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
    overflow: textOverflow,
  );

  DText.medium(
      super.text, {
        super.key,
        double? fontSize = FontSizes.medium,
        Color? color = DColor.defaultText,
        FontWeight? fontWeight = FontWeight.w500,
        super.maxLines,
        super.textAlign,
        TextOverflow? textOverflow = TextOverflow.ellipsis,
      }) : super(
    style: mediumFont.copyWith(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
    overflow: textOverflow,
  );

  DText.bold(
      super.text, {
        super.key,
        double? fontSize = FontSizes.medium,
        Color? color = DColor.defaultText,
        FontWeight? fontWeight = FontWeight.w700,
        super.maxLines,
        TextOverflow? textOverflow = TextOverflow.ellipsis,
        super.textAlign,
      }) : super(
    style: boldFont.copyWith(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
    overflow: textOverflow,
  );
}