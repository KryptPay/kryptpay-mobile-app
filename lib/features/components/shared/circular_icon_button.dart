import 'package:flutter/material.dart';
import 'package:krypt/util/theme/colors.dart';

class CircularIconButton extends StatelessWidget {
  final Color? backgroundColor;
  final Widget icon;
  final VoidCallback? onTap;
  final double height;
  final double width;

  const CircularIconButton({
    super.key,
    this.backgroundColor,
    required this.icon,
    this.onTap,
    this.width = 38,
    this.height = 38,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor ?? grey600.withOpacity(0.1),
        ),
        child: icon,
      ),
    );
  }
}
