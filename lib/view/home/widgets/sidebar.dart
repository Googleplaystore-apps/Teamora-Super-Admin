import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:teamora/components/app_colors.dart';
import 'package:teamora/components/app_text.dart';
import 'package:teamora/controller/navigation_clr.dart';

class SideBar extends StatelessWidget {
  SideBar({super.key});

  final NavigationController navController = Get.find<NavigationController>();

  final List<Map<String, dynamic>> menuItems = [
    {"icon": Icons.dashboard_outlined, "title": "Dashboard"},
    {"icon": Icons.apartment, "title": "Companies"},
    {"icon": Icons.attach_money, "title": "Billing & Plans"},
    {"icon": Icons.trending_up, "title": "Industry Insights"},
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1200;
        final isTablet =constraints.maxWidth >= 700 && constraints.maxWidth < 1200;
        final isMobile = constraints.maxWidth < 700;
        return Container(
          width: isDesktop || isTablet ? 250 : 200,
          color: AppColors.boxbg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: isMobile ? 5.h : 2.h),
        
              /// LOGO
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0),
                child: Image.asset(
                  'assets/images/Logo 2.png',
                  height: isMobile ? 8.h : 5.h,
                  // width: 170,
                  fit: BoxFit.cover,
                ),
              ),
              Divider(thickness: 0.5),
        
              /// MENU ITEMS
              ...List.generate(menuItems.length, (index) {
                return Obx(() {
                  bool isSelected = navController.selectedIndex.value == index;
                  return InkWell(
                    onTap: () => navController.changeIndex(index),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: .8.w,
                        vertical: 0.8.h,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 1.h,
                        horizontal: 1.w,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary.withOpacity(0.1)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            menuItems[index]["icon"],
                            color: isSelected
                                ? AppColors.primary
                                : Colors.grey.shade700,
                            size: 18,
                          ),
                          SizedBox(width: 1.w),
                          CustomText(
                            text: menuItems[index]["title"],
                            style: TextStyle(
                              fontSize: 12,
                              color: isSelected
                                  ? AppColors.primary
                                  : Colors.grey.shade800,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              }),
        
              /// LOGOUT
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: .8.w,
                    vertical: 0.8.h,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                  child: Row(
                    children: const [
                      Icon(Icons.logout, color: Colors.red, size: 18),
                      SizedBox(width: 8),
                      CustomText(
                        text: "Log out",
                        style: TextStyle(fontSize: 12, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
        
              Spacer(),
              Divider(thickness: 0.5),
        
              /// PROFILE SECTION
              Container(
                margin: EdgeInsets.symmetric(horizontal: .8.w, vertical: 0.8.h),
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.primary,
                      radius: 14,
                      child: CustomText(
                        text: "SA",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Super Admin",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          CustomText(
                            text: "System Admin",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        
              SizedBox(height: 2.h),
            ],
          ),
        );
      },
    );
  }
}
