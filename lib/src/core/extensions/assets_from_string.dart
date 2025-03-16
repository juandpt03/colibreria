import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:colibreria/src/features/shared/shared.dart';

extension AssetFromString on String {
  Widget toImage({BoxFit fit = BoxFit.contain, double? width, double? height}) {
    return Image.asset(
      this,
      fit: fit,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error, color: Colors.red);
      },
    );
  }

  Widget toSvg({
    BoxFit fit = BoxFit.contain,
    double? width,
    double? height,
    Color? color,
  }) {
    return SvgPicture.asset(
      this,
      fit: fit,
      width: width,
      height: height,
      placeholderBuilder: (context) => const CustomLoading(),
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }
}
