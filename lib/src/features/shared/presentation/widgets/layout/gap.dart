import 'package:flutter/material.dart';
import 'package:colibreria/src/core/utils/gaps.dart';

class GapY extends StatelessWidget {
  final double size;

  const GapY.small({super.key}) : size = Gaps.small;
  const GapY.medium({super.key}) : size = Gaps.medium;
  const GapY.large({super.key}) : size = Gaps.large;

  const GapY.custom(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}

class GapX extends StatelessWidget {
  final double size;

  const GapX.small({super.key}) : size = Gaps.small;
  const GapX.medium({super.key}) : size = Gaps.medium;
  const GapX.large({super.key}) : size = Gaps.large;

  const GapX.custom(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size);
  }
}
