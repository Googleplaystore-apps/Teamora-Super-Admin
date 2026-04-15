import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:teamora/components/app_colors.dart';
import 'package:teamora/components/app_text.dart';

class CompanyDetailScreenCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
 

  const CompanyDetailScreenCard({
    super.key,
    required this.title,
    required this.value,
    this.icon = Icons.ac_unit,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= 1200;
          final isTablet = constraints.maxWidth >= 700 && constraints.maxWidth < 1200;
          final isMobile = constraints.maxWidth < 700;
      return Container(
        padding: EdgeInsets.all(isMobile ? 1.5.h : 3.h),
        decoration: BoxDecoration(
          color: AppColors.boxbg,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.grey.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomText(text: title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.grey)),
                ),
                Icon(icon, size: 22, color: AppColors.grey),
              ],
            ),
            Spacer(),
            CustomText(
              text: value,
              style: TextStyle(
                fontSize: isMobile ? 15.sp : 17.sp,  
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ), 
      );
      }
    );
  }
}
