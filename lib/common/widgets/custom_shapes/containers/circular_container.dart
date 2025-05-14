import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.child,
    this.width = 300,
    this.height = 300,
    this.radius = 300,
    this.margin,
    this.padding = 0,
    this.backgrounColor = TColors.white,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgrounColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius), color: backgrounColor),
      child: child,
    );
  }
}
