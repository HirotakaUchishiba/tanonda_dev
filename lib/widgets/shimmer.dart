import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  /// 楕円形
  const ShimmerWidget.circular({
    super.key,
    required this.width,
    required this.height,
    Color? baseColor,
    Color? highlightColor,
  })  : baseColor = baseColor ?? _baseColor,
        highlightColor = highlightColor ?? _highlightColor,
        borderRadius = null,
        shape = BoxShape.circle;

  const ShimmerWidget.rectangular({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 0,
    Color? baseColor,
    Color? highlightColor,
  })  : baseColor = baseColor ?? _baseColor,
        highlightColor = highlightColor ?? _highlightColor,
        shape = BoxShape.rectangle;

  static const _baseColor = Colors.black26;
  static const _highlightColor = Colors.black12;

  final double width;
  final double height;
  final Color baseColor;
  final Color highlightColor;
  final BoxShape shape;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: borderRadius == null
                ? null
                : BorderRadius.circular(borderRadius!),
            shape: shape,
          ),
        ),
      );
}

class AlignedShimmerWidget extends StatelessWidget {
  /// 楕円形
  const AlignedShimmerWidget.circular({
    super.key,
    required this.width,
    required this.height,
    this.alignment = Alignment.centerLeft,
    Color? baseColor,
    Color? highlightColor,
  })  : baseColor = baseColor ?? _baseColor,
        highlightColor = highlightColor ?? _highlightColor,
        borderRadius = null,
        shape = BoxShape.circle;

  const AlignedShimmerWidget.rectangular({
    super.key,
    required this.width,
    required this.height,
    this.alignment = Alignment.centerLeft,
    this.borderRadius = 0,
    Color? baseColor,
    Color? highlightColor,
  })  : baseColor = baseColor ?? _baseColor,
        highlightColor = highlightColor ?? _highlightColor,
        shape = BoxShape.rectangle;

  static const _baseColor = Colors.black26;
  static const _highlightColor = Colors.black12;

  final Alignment alignment;
  final double width;
  final double height;
  final Color baseColor;
  final Color highlightColor;
  final BoxShape shape;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) => Align(
        alignment: alignment,
        child: Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: baseColor,
              borderRadius: borderRadius == null
                  ? null
                  : BorderRadius.circular(borderRadius!),
              shape: shape,
            ),
          ),
        ),
      );
}
