import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerIconEffect extends StatelessWidget {
  final IconData? icon;
  final double? size;
  final Color? color;
  final Color? highlightColor;
  const ShimmerIconEffect(
      {super.key,
      required this.icon,
      this.size,
      this.color,
      this.highlightColor});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: color ?? Colors.grey.shade300,
      highlightColor: highlightColor ?? Colors.grey.shade100,
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }
}
