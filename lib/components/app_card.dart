import 'package:flutter/material.dart';
import 'package:teamora/components/app_colors.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const CustomCard({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.boxbg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.grey.withOpacity(0.5),
        ),
      ),
      child: child,
    );
  }
}