import 'package:flutter/material.dart';
import 'package:teamora/components/app_colors.dart';
import 'package:teamora/components/app_text.dart';

class PrimaryButton extends StatelessWidget {
  final Widget text;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final Color? color;
  final Color? bcolor;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
    this.color,
    this.bcolor,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width, 
        decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: bcolor ?? AppColors.primary)
        ),
        child: Center(
          child: text
        ),
      ),
    );
  }
}

// ─── Filter Dropdown ──────────────────────────────────────────────────────────

class FilterDropdown extends StatelessWidget {
  final String title;
  final VoidCallback onpressed;
  final double? hight;
  final Widget? icon;


  const FilterDropdown({super.key, 
  this.hight,
  this.icon,
  required this.title,
  required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: hight,
        decoration: BoxDecoration(
          color: const Color(0xfff2f4f7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon??SizedBox(),
            CustomText(text: title, style: const TextStyle(fontSize: 12)),
            const SizedBox(width: 8),
            const Icon(Icons.keyboard_arrow_down, size: 18),
          ],
        ),
      ),
    );
  }
}