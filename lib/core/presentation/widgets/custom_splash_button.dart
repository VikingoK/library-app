import 'package:flutter/material.dart';
import 'package:librery_app/core/theme/app_colors.dart';

class CustomSplashButton extends StatelessWidget {
  const CustomSplashButton({
    super.key,
    required this.child,
    this.backgroundColor = Colors.transparent,
    this.splashColor,
    this.shadowColor = Colors.transparent,
    this.borderSideColor = Colors.transparent,
    required this.onTap,
    this.margin,
    this.borderRadius,
    this.shape,
    this.elevation,
  });

  final Widget child;
  final Color backgroundColor;
  final Color? splashColor;
  final Color? shadowColor;
  final Color borderSideColor;
  final void Function()? onTap;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final ShapeBorder? shape;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final splashColorCondition = splashColor ?? AppColors.nightGray;

    return Container(
      margin: margin,
      child: Material(
        color: backgroundColor,
        shadowColor: shadowColor,
        elevation: elevation ?? 1,
        shape: shape ??
            RoundedRectangleBorder(
              side: BorderSide(color: borderSideColor, width: 1.0),
              borderRadius:
                  borderRadius ?? const BorderRadius.all(Radius.circular(10)),
            ),
        child: InkWell(
            splashColor: splashColorCondition,
            borderRadius:
                borderRadius ?? const BorderRadius.all(Radius.circular(10)),
            onTap: onTap,
            child: child),
      ),
    );
  }
}
