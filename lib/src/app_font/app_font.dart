import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

final fonts = GoogleFonts.nunito();

final regularFont = fonts.copyWith(
  fontSize: FontSizes.medium,
  color: DColor.defaultText,
  fontWeight: FontWeight.w400,
);

final mediumFont = fonts.copyWith(
  fontSize: FontSizes.medium,
  color: DColor.defaultText,
  fontWeight: FontWeight.w500,
);

final boldFont = fonts.copyWith(
  fontSize: FontSizes.medium,
  color: DColor.defaultText,
  fontWeight: FontWeight.w700,
);