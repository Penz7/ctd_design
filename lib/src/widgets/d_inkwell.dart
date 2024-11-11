import 'package:flutter/material.dart';

class DInkwell extends InkWell {
  DInkwell.base({
    super.key,
    required Widget child,
    super.onTap,
    double padding = 0,
    bool showShadow = false,
    double opacity = 0.4,
    BorderRadius super.borderRadius = BorderRadius.zero,
    Color borderColor = Colors.transparent,
    double borderWidth = 0,
    Widget? icon,
    Widget? suffixIcon,
  }) : super(
    splashColor: Colors.black.withOpacity(opacity),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: showShadow
            ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ]
            : null,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      padding: EdgeInsets.all(padding),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            icon,
            const SizedBox(width: 4),
          ],
          child,
          if (suffixIcon != null) ...[
            const SizedBox(width: 4),
            suffixIcon,
          ],
        ],
      ),
    ),
  );

  DInkwell.outline({
    super.key,
    required Widget child,
    super.onTap,
    double padding = 8,
    bool showShadow = false,
    double opacity = 0.4,
    BorderRadius super.borderRadius = const BorderRadius.all(Radius.circular(8)),
    Color borderColor = Colors.blue,
    double borderWidth = 1,
    Widget? icon,
    Widget? suffixIcon,
  }) : super(
    splashColor: Colors.black.withOpacity(opacity),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: showShadow
            ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ]
            : null,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      padding: EdgeInsets.all(padding),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            icon,
            const SizedBox(width: 4),
          ],
          child,
          if (suffixIcon != null) ...[
            const SizedBox(width: 4),
            suffixIcon,
          ],
        ],
      ),
    ),
  );
}
