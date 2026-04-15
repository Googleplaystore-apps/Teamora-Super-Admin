import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:teamora/components/app_colors.dart';
import 'package:teamora/components/app_text.dart';
import 'package:teamora/controller/dashboard_clr.dart';
import 'package:teamora/view/home/widgets/dashboardcard.dart';
import 'package:teamora/view/home/widgets/dashboard_chart.dart';
import 'package:teamora/view/home/widgets/sidebar.dart';

class DashboardScreen extends StatelessWidget {
  final bool showDrawer;
  DashboardScreen({super.key , this.showDrawer = true});

  final controller = Get.put(DashboardController());

  @override
Widget build(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final isDesktop = constraints.maxWidth >= 1200;
      final isTablet = constraints.maxWidth >= 700 && constraints.maxWidth < 1200;
      final isMobile = constraints.maxWidth < 700;

      return Scaffold(
        // ✅ Drawer only on mobile
        drawer: showDrawer ? SideBar() : null,
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.boxbg,
          elevation: 0,
          // ✅ Show hamburger only on mobile, hide on tablet/desktop
          automaticallyImplyLeading: showDrawer,
          title: CustomText(
            text: "Admin Dashboard",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          actions: [
            Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.primary.withOpacity(0.5)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Row(
                    children: [
                      Icon(Icons.shield_outlined, size: 14, color: AppColors.primary),
                      const SizedBox(width: 6),
                      const CustomText(
                        text: "Super Admin Access",
                        style: TextStyle(
                          fontSize: 10,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
            SizedBox(width: 3.w),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isMobile ? 2 : isTablet ? 3 : 4,
                        mainAxisSpacing: 1.h,
                        crossAxisSpacing: 1.h,
                        childAspectRatio: isMobile ? 1.4 : 1.8,
                      ),
                      children: [
                        DashboardCard(
                          title: "Total Active Companies",
                          icon: Icons.apartment,
                          value: "219",
                          increase: "+12",
                          duration: "this month",
                        ),
                        DashboardCard(
                          title: "Total Active Workers",
                          icon: Icons.people_outline,
                          value: "8,247",
                          increase: "+524",
                          duration: "this month",
                        ),
                        DashboardCard(
                          title: "Monthly Revenue",
                          icon: Icons.attach_money,
                          value: "\$465K",
                          increase: "+18%",
                          duration: "vs last month",
                        ),
                        DashboardCard(
                          title: "Active Subscriptions",
                          icon: Icons.trending_up,
                          value: "215",
                          increase: "-4",
                          duration: "expired this month",
                          isNegative: true,
                        ),
                      ],
                    ),

                    SizedBox(height: 3.h),

                    if (isDesktop || isTablet)
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: RevenueChart()),
                              SizedBox(width: 3.h),
                              Expanded(child: CompaniesBarChart()),
                            ],
                          ),
                          SizedBox(height: 3.h),
                          Row(
                            children: [
                              Expanded(child: IndustryDistributionTable()),
                              SizedBox(width: 3.h),
                              Expanded(child: RecentActivityCard()),
                            ],
                          ),
                        ],
                      )
                    else
                      Column(
                        children: [
                          RevenueChart(),
                          SizedBox(height: 2.h),
                          CompaniesBarChart(),
                          SizedBox(height: 2.h),
                          IndustryDistributionTable(),
                          SizedBox(height: 2.h),
                          RecentActivityCard(),
                        ],
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
  }
