import 'package:flutter/material.dart';
import 'package:colibreria/src/core/utils/gaps.dart';
import 'package:colibreria/src/features/shared/presentation/widgets/widgets.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final double borderRadius;
  final double elevation;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final Widget? icon;

  const CustomElevatedButton({
    super.key,
    required this.text,
    this.borderRadius = Gaps.radiusLarge,
    this.elevation = 5,
    this.padding = const EdgeInsets.all(Gaps.medium),
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return SizedBox(
      width: width,
      child: ElevatedButton.icon(
        icon: icon,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: Colors.white,
          elevation: elevation,
          visualDensity: VisualDensity.standard,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        label:
            isLoading
                ? SizedBox(
                  height: 25,
                  width: 25,
                  child: CustomLoading(color: Colors.white),
                )
                : Text(
                  text,
                  style: textStyle.titleSmall?.copyWith(color: Colors.white),
                ),
      ),
    );
  }
}
