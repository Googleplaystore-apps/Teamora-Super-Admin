import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:teamora/controller/navigation_clr.dart';
import 'package:teamora/view/home/billing_&_plans.dart';
import 'package:teamora/view/home/companies_screen.dart';
import 'package:teamora/view/home/dashboard.dart';
import 'package:teamora/view/home/industry_insight_screen.dart';
import 'package:teamora/view/home/widgets/sidebar.dart';

// home_screen.dart
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final NavigationController navController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= 1200;

          final pages = [
            DashboardScreen(showDrawer: !isDesktop),
            CompaniesScreen(showDrawer: !isDesktop),
            BillingPlans(showDrawer: !isDesktop), // 👈 dynamic
            IndustryInsightScreen(showDrawer: !isDesktop,)
          ];

          if (isDesktop) {
            return Row(
              children: [
                SideBar(),
                Expanded(
                  child: Container(
                    color: const Color(0xFFF9FAFB),
                    child: Obx(() => pages[navController.selectedIndex.value]),
                  ),
                ),
              ],
            );
          }

          return Container(
            color: const Color(0xFFF9FAFB),
            child: Obx(() => pages[navController.selectedIndex.value]),
          );
        },
      ),
    );
  }
}