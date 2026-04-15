import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:teamora/components/app_colors.dart';
import 'package:teamora/components/app_text.dart';
import 'package:teamora/components/tilesmanager.dart';

class IndustryInsightScreenCards extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final String duration;

  const IndustryInsightScreenCards({
    super.key,
    required this.title,
    required this.value,
    required this.duration,
    this.icon = Icons.ac_unit,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1200;
        final isTablet =
            constraints.maxWidth >= 700 && constraints.maxWidth < 1200;
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
                    child: CustomText(
                      text: title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13.sp, color: AppColors.grey),
                    ),
                  ),
                  Icon(
                    icon,
                    size: isMobile ? 18.sp : 13.sp,
                    color: AppColors.grey,
                  ),
                ],
              ),
              Spacer(),
              CustomText(
                text: value,
                style: TextStyle(
                  fontSize: isMobile ? 16.sp : 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              CustomText(
                text: duration,
                style: TextStyle(fontSize: 12, color: AppColors.grey),
              ),
            ],
          ),
        );
      },
    );
  }
}


class IndustryBreakdownCard extends StatelessWidget {
  final String title;
  final String growth;
  final bool isPositive;
  final Color color;
  final int companies;
  final int workers;
  final String revenue;
  final int avg;
  final double progress;

  const IndustryBreakdownCard({
    super.key,
    required this.title,
    required this.growth,
    required this.isPositive,
    required this.companies,
    required this.workers,
    required this.revenue,
    required this.avg,
    required this.progress,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveCardWrapper( // 👈 your reusable width widget
      space1: 40,
      space2: 32,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.boxbg,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: color.withOpacity(0.2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Top Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  decoration: BoxDecoration(
                    color: isPositive
                        ? Colors.green.withOpacity(0.1)
                        : Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: isPositive? Colors.green.withOpacity(0.4):Colors.red.withOpacity(0.4))
                  ),
                  child: Row(
                    children: [
                      Icon(isPositive? Icons.trending_up:Icons.trending_down,size: 12,color: isPositive?Colors.green:Colors.red,),
                      SizedBox(width: 5,),
                      CustomText(
                        text: growth,
                        style: TextStyle(
                          fontSize: 10,
                          color: isPositive ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            const SizedBox(height: 15),

            /// Info Rows
            _info("Companies", companies.toString()),
            _info("Workers", workers.toString()),
            _info("Revenue", revenue),
            _info("Avg Workers/Co", avg.toString()),

            const SizedBox(height: 15),
            Divider(),
            SizedBox(height: 2,),
            /// Progress Bar
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation(
                  color
                ),
              ),
            ),

            const SizedBox(height: 6),

            CustomText(
              text: "${(progress * 100).toStringAsFixed(1)}% market share",
              style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: title, style: const TextStyle(fontSize: 11)),
          CustomText(text: value,
              style:
                  const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}