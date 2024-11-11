import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DInternetImage extends StatelessWidget {
  const DInternetImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = 0,
    this.placeHolder,
  });

  final String url;
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxFit fit;
  final String? placeHolder;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      errorWidget: (_, __, ___) => _buildErrorImage(),
      placeholder: (_, __) => const SizedBox(),
    );

    return borderRadius > 0
        ? ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: imageWidget,
    )
        : imageWidget;
  }

  Widget _buildErrorImage() {
    return LCImage.asset(
      name: placeHolder ?? "error_placeholder.png",
      width: width,
      height: height,
      boxFit: BoxFit.contain,
    );
  }
}

class LCImage extends Image {
  LCImage.asset({
    Key? key,
    required String name,
    double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.cover,
    String subFolder = "images",
  }) : super.asset(
    "assets/$subFolder/$name",
    key: key,
    width: width,
    height: height,
    color: color,
    fit: boxFit,
  );

  LCImage.file({
    Key? key,
    required File file,
    double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.cover,
  }) : super.file(
    file,
    key: key,
    width: width,
    height: height,
    color: color,
    fit: boxFit,
  );
}
