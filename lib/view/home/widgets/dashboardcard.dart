import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:teamora/components/app_colors.dart';
import 'package:teamora/components/app_text.dart';
import 'package:teamora/models/activitymodel.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final String increase;
  final String duration;
  final bool isNegative;

  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    required this.increase,
    required this.duration,
    this.icon = Icons.ac_unit,
    this.isNegative = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= 1200;
          final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1200;
          final isMobile = constraints.maxWidth < 600;
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
                      fontSize: 13.sp,
                      color: AppColors.grey)),
                ),
                Icon(icon, size: isMobile ? 18.sp : 14.sp, color: AppColors.grey),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: isMobile ? 16.sp : 18.sp,  
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  isNegative ? Icons.arrow_downward : Icons.arrow_outward,
                  size: 14,
                  color: isNegative ? Colors.red : Colors.green,
                ),
                SizedBox(width: 2),
                Text(
                  increase,
                  style: TextStyle(
                    color: isNegative ? Colors.red : Colors.green,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Spacer(),
            CustomText(text: duration, style: TextStyle(fontSize: 14, color: AppColors.grey),),
          ],
        ),
      );
      }
    );
  }
}






class RecentActivityCard extends StatelessWidget {
  const RecentActivityCard({super.key});

  @override
  Widget build(BuildContext context) {

    final List<ActivityModel> activities = [
      ActivityModel(
        dotColor: Colors.green,
        title: "HealthCare Plus",
        tag: "Medicine",
        description: "New company onboarded",
        time: "5 minutes ago",
      ),
      ActivityModel(
        dotColor: Colors.teal,
        title: "SecureGuard Services",
        tag: "Security",
        description: "Upgraded to Enterprise plan",
        time: "1 hour ago",
      ),
      ActivityModel(
        dotColor: Colors.teal,
        title: "FreshFood Catering",
        tag: "Food",
        description: "Payment received - \$2,499",
        time: "2 hours ago",
      ),
      ActivityModel(
        dotColor: Colors.green,
        title: "CareConnect NDIS",
        tag: "NDIS",
        description: "New company onboarded",
        time: "3 hours ago",
      ),
      ActivityModel(
        dotColor: Colors.deepOrange,
        title: "CleanPro Services",
        tag: "Cleaning",
        description: "Subscription expiring in 7 days",
        time: "5 hours ago",
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final isMobile = w < 600;
        final isTablet = w >= 600 && w < 1200;
        final isDesktop = w >= 1200;

      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(isMobile ? 2.h : 3.h),
        decoration: BoxDecoration(
          color: AppColors.boxbg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.grey.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: "Recent Activity",
              style: TextStyle(
                fontSize: isMobile ? 14.sp : 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2.h),
      
            /// LISTVIEW BUILDER
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
      
                return ActivityItem(
                  dotColor: activity.dotColor,
                  title: activity.title,
                  tag: activity.tag,
                  description: activity.description,
                  time: activity.time,
                  fontSize: isMobile ? 12 : 14,
                );
              },
            ),
          ],
        ),
      );
      }
    );
  }
}


class ActivityItem extends StatelessWidget {
  final Color dotColor;
  final String title;
  final double fontSize;
  final String tag;
  final String description;
  final String time;

  const ActivityItem({
    super.key,
    required this.dotColor,
    required this.title,
    required this.tag,
    required this.description,
    required this.time,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Dot
          Container(
            margin: EdgeInsets.only(top: 8),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 2.w),

          /// Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title + Tag
                Row(
                  children: [
                    CustomText(
                      text: title,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 1.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.w, vertical: 0.4.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AppColors.grey.withOpacity(0.3)),
                      ),
                      child: CustomText(
                        text: tag,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 0.4.h),

                /// Description
                CustomText(
                  text: description,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                  ),
                ),

                SizedBox(height: 0.2.h),

                /// Time
                CustomText(
                  text: time,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
