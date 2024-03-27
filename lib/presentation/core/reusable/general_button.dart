import 'package:flutter/material.dart';
class BuildButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Widget child;
  void Function()? onTap;
  final Color buttonColor;


  BuildButton({
    Key? key,
    required this.child,
    this.borderRadius,
    this.height,
    this.onTap,
    required this.buttonColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: borderRadius,
        ),
        child: child,
      ),
    );
  }
}

class CheckButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Widget child;
  void Function()? onTap;
  final Color buttonColor;
  final Color borderSideColor;

  CheckButton({
    Key? key,
    required this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.onTap,
    required this.buttonColor, required this.borderSideColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: borderRadius,
            border: Border.all(
                color: borderSideColor
            )
        ),
        child: child,
      ),
    );
  }
}