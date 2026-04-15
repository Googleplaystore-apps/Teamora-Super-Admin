// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:teamora/components/app_colors.dart';
// import 'package:teamora/components/app_text.dart';
// import 'package:teamora/controller/companies_clr.dart';
// import 'package:teamora/models/company_model.dart';
// import 'package:teamora/view/home/companies_detail_view.dart';
// import 'package:teamora/view/home/widgets/sidebar.dart';

// class CompaniesScreen extends StatelessWidget {
//   CompaniesScreen({super.key});
//   final CompaniesController controller = Get.put(CompaniesController());

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final isDesktop = constraints.maxWidth >= 1200;
//         final isTablet =
//             constraints.maxWidth >= 700 && constraints.maxWidth < 1200;
//         final isMobile = constraints.maxWidth < 700;
//         return Scaffold(
//           backgroundColor: AppColors.background,
//           drawer: isMobile || isTablet ? SideBar() : null,
//           appBar: AppBar(
//             backgroundColor: AppColors.boxbg,
//             elevation: 0,
//             // ✅ Show hamburger only on mobile, hide on tablet/desktop
//             automaticallyImplyLeading: isMobile,
//             title: CustomText(
//               text: "Companies",
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//             ),
//             actions: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: AppColors.primary.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(5),
//                   border: Border.all(color: AppColors.primary.withOpacity(0.5)),
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 10,
//                   vertical: 4,
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.shield_outlined,
//                       size: 14,
//                       color: AppColors.primary,
//                     ),
//                     const SizedBox(width: 6),
//                     const CustomText(
//                       text: "Super Admin Access",
//                       style: TextStyle(fontSize: 10, color: AppColors.primary),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(width: 3.w),
//             ],
//           ),
//           body: LayoutBuilder(
//             builder: (context, constraints) {
//               return Padding(
//                 padding: EdgeInsets.all(2.h),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     /// Summary Cards
//                     if (isDesktop || isTablet)
//                       GridView.count(
//                         crossAxisCount: 3,
//                         crossAxisSpacing: 2.h,
//                         mainAxisSpacing: 2.h,
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         childAspectRatio: 3,
//                         children: const [
//                           SummaryCard(
//                             title: "Total Companies",
//                             value: "8",
//                             icon: Icons.apartment,
//                           ),
//                           SummaryCard(
//                             title: "Total Workers",
//                             value: "785",
//                             icon: Icons.people_outline,
//                           ),
//                           SummaryCard(
//                             title: "Monthly Revenue",
//                             value: "\$23,493",
//                             icon: Icons.attach_money,
//                           ),
//                         ],
//                       )
//                     else
//                       GridView.count(
//                         crossAxisCount: isDesktop ? 3 : 2,
//                         crossAxisSpacing: 2.h,
//                         mainAxisSpacing: 2.h,
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         childAspectRatio: isDesktop ? 3.6 : 2.9,
//                         children: const [
//                           SummaryCard(
//                             title: "Total Companies",
//                             value: "8",
//                             icon: Icons.apartment,
//                           ),
//                           SummaryCard(
//                             title: "Total Workers",
//                             value: "785",
//                             icon: Icons.people_outline,
//                           ),
//                           SummaryCard(
//                             title: "Monthly Revenue",
//                             value: "\$23,493",
//                             icon: Icons.attach_money,
//                           ),
//                         ],
//                       ),
//                     const SizedBox(height: 24),

//                     /// Search + Filters
//                     Container(
//                       padding: EdgeInsets.all(2.h),
//                       decoration: BoxDecoration(
//                         color: AppColors.boxbg,
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(
//                           color: AppColors.grey.withOpacity(0.5),
//                         ),
//                       ),
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [
//                             /// Search
//                             SizedBox(
//                               width: isMobile ? 80.w : 50.w,
//                               height: 6.h,
//                               child: TextField(
//                                 onChanged: controller.searchCompany,
//                                 decoration: InputDecoration(
//                                   hintText: "Search companies...",
//                                   prefixIcon: const Icon(Icons.search),
//                                   filled: true,
//                                   fillColor: const Color(0xfff2f4f7),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                     borderSide: BorderSide.none,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 2.h),
//                             const FilterDropdown(title: "All Industries"),
//                             SizedBox(width: 1.5.h),
//                             const FilterDropdown(title: "All Plans"),
//                             SizedBox(width: 1.5.h),
//                             const FilterDropdown(title: "All Statuses"),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),

//                     /// Table
//                     Expanded(child: CompaniesTable()),
//                   ],
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

// class SummaryCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final IconData icon;

//   const SummaryCard({
//     super.key,
//     required this.title,
//     required this.value,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final isDesktop = constraints.maxWidth >= 1200;
//         final isTablet =
//             constraints.maxWidth >= 600 && constraints.maxWidth < 1200;
//         final isMobile = constraints.maxWidth < 600;
//         return Container(
//           padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.5.h),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: AppColors.grey.withOpacity(0.3)),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Spacer(),
//                   CustomText(
//                     text: title,
//                     style: TextStyle(fontSize: 12.sp, color: Colors.grey),
//                   ),
//                   Spacer(),
//                   CustomText(
//                     text: value,
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Spacer(),
//                 ],
//               ),
//               Icon(icon, size: 18.sp, color: Colors.grey.shade400),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class CompaniesTable extends StatelessWidget {
//   CompaniesTable({super.key});
//   final CompaniesController controller = Get.put(CompaniesController());
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final isDesktop = constraints.maxWidth >= 1200;
//         final isTablet =
//             constraints.maxWidth >= 600 && constraints.maxWidth < 1200;
//         final isMobile = constraints.maxWidth < 600;
//         return Container(
//           padding: EdgeInsets.all(2.h),

//           decoration: BoxDecoration(
//             color: AppColors.boxbg,
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: AppColors.grey.withOpacity(0.5)),
//           ),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Obx(() {
//                 return DataTable(
//                   decoration: BoxDecoration(
//                     color: AppColors.boxbg,
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: AppColors.grey),
//                   ),
//                   headingRowHeight: 30,
//                   columnSpacing: isMobile ? 30 : 4.25.w,
//                   headingRowColor: MaterialStateProperty.all(AppColors.boxbg),
//                   columns: const [
//                     DataColumn(
//                       label: CustomText(
//                         text: "Company Name",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     DataColumn(
//                       label: CustomText(
//                         text: "Industry",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     DataColumn(
//                       label: CustomText(
//                         text: "Workers",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     DataColumn(
//                       label: CustomText(
//                         text: "Plan",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     DataColumn(
//                       label: CustomText(
//                         text: "Billing Status",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     DataColumn(
//                       label: CustomText(
//                         text: "Account Status",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     DataColumn(
//                       label: CustomText(
//                         text: "Revenue",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     DataColumn(
//                       label: CustomText(
//                         text: "Actions",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                   rows: controller.filteredCompanies
//                       .map((company) => _buildRow(context, company))
//                       .toList(),
//                 );
//               }),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   DataRow _buildRow(BuildContext context, Company company) {
//     return DataRow(
//       cells: [
//         DataCell(
//           InkWell(
//             onTap: () => _goToDetails(context, company),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomText(
//                   text: company.name,
//                   style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//                 ),
//                 CustomText(
//                   text: "Joined: ${company.joinedDate}",
//                   style: TextStyle(fontSize: 10, color: AppColors.grey),
//                 ),
//               ],
//             ),
//           ),
//         ),

//         DataCell(
//           InkWell(
//             onTap: () => _goToDetails(context, company),
//             child: CustomText(text: company.industry),
//           ),
//         ),

//         DataCell(CustomText(text: company.workers)),
//         DataCell(StatusBadge(text: company.plan)),
//         DataCell(StatusBadge(text: company.billing)),
//         DataCell(StatusBadge(text: company.account)),
//         DataCell(CustomText(text: company.revenue)),

//         DataCell(
//           InkWell(
//             onTap: () => _goToDetails(context, company),
//             child: Row(
//               children: const [
//                 Icon(Icons.remove_red_eye_outlined, size: 18),
//                 CustomText(text: "   View", style: TextStyle(fontSize: 12)),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   void _goToDetails(BuildContext context, Company company) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => CompanyDetailsScreen(company: company)),
//     );
//   }
// }

// class StatusBadge extends StatelessWidget {
//   final String text;

//   const StatusBadge({super.key, required this.text});

//   Color _getColor() {
//     switch (text.toLowerCase()) {
//       case "paid":
//       case "active":
//         return Colors.green;
//       case "professional":
//         return Colors.blue;
//       case "enterprise":
//         return Colors.teal;
//       case "basic":
//         return Colors.grey;
//       case "expiring":
//         return Colors.orange;
//       case "overdue":
//       case "suspended":
//         return Colors.red;
//       default:
//         return Colors.grey;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final color = _getColor();

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(4),
//         border: Border.all(color: color.withOpacity(0.5), width: 0.5),
//       ),
//       child: CustomText(
//         text: text,
//         style: TextStyle(
//           fontSize: 10,
//           color: color,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }
// }

// class FilterDropdown extends StatelessWidget {
//   final String title;

//   const FilterDropdown({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       height: 6.h,
//       decoration: BoxDecoration(
//         color: const Color(0xfff2f4f7),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         children: [
//           CustomText(text: title),
//           const SizedBox(width: 12),
//           const Icon(Icons.keyboard_arrow_down),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:teamora/components/app_buttons.dart';
import 'package:teamora/components/app_colors.dart';
import 'package:teamora/components/app_text.dart';
import 'package:teamora/components/status_badge.dart';
import 'package:teamora/controller/companies_clr.dart';
import 'package:teamora/models/company_model.dart';
import 'package:teamora/view/home/companies_detail_view.dart';
import 'package:teamora/view/home/widgets/sidebar.dart';

class CompaniesScreen extends StatelessWidget {
  final bool showDrawer;
  CompaniesScreen({super.key , this.showDrawer = true});
  final CompaniesController controller = Get.put(CompaniesController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1200;
        final isTablet =
            constraints.maxWidth >= 700 && constraints.maxWidth < 1200;
        final isMobile = constraints.maxWidth < 700;
        return Scaffold(
          backgroundColor: AppColors.background,
          drawer: showDrawer ? SideBar() : null,
          appBar: AppBar(
            backgroundColor: AppColors.boxbg,
            elevation: 0,
            automaticallyImplyLeading: showDrawer,
            title: const CustomText(
              text: "Companies",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.primary.withOpacity(0.5)),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.shield_outlined,
                      size: 14,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 6),
                      const CustomText(
                        text: "Super Admin Access",
                        style:
                            TextStyle(fontSize: 10, color: AppColors.primary),
                      ),
                  ],
                ),
              ),
              SizedBox(width: 3.w),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(isMobile? 12:16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Summary Cards
                  GridView.count(
                    crossAxisCount: isMobile ? 1 : 3,
                    crossAxisSpacing: 2.h,
                    mainAxisSpacing: 2.h,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: isMobile ? 4 : (isTablet ? 3.2 : 3.6),
                    children: const [
                      SummaryCard(
                        title: "Total Companies",
                        value: "8",
                        icon: Icons.apartment,
                      ),
                      SummaryCard(
                        title: "Total Workers",
                        value: "785",
                        icon: Icons.people_outline,
                      ),
                      SummaryCard(
                        title: "Monthly Revenue",
                        value: "\$23,493",
                        icon: Icons.attach_money,
                      ),
                    ],
                  ),
              
                  const SizedBox(height: 20),
              
                  /// Search + Filters
                  Container(
                    padding: EdgeInsets.all(1.5.h),
                    decoration: BoxDecoration(
                      color: AppColors.boxbg,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.grey.withOpacity(0.5),
                      ),
                    ),
                    child: isMobile
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSearchField(controller, isMobile),
                              const SizedBox(height: 10),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    FilterDropdown(
                                      onpressed: (){},
                                      title: "All Industries"),
                                    SizedBox(width: 8),
                                    FilterDropdown(
                                      onpressed: (){},
                                      title: "All Plans"),
                                    SizedBox(width: 8),
                                    FilterDropdown(
                                      onpressed: (){},
                                      title: "All Statuses"),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _buildSearchField(controller, isMobile),
                                SizedBox(width: 2.h),
                                FilterDropdown(
                                  hight: 44,
                                  onpressed: () {},
                                  title: "All Industries"),
                                SizedBox(width: 1.5.h),
                                FilterDropdown(
                                  hight: 44,
                                  onpressed: (){},
                                  title: "All Plans"),
                                SizedBox(width: 1.5.h),
                                FilterDropdown(
                                  hight: 44,
                                  onpressed: (){},
                                  title: "All Statuses"),
                              ],
                            ),
                          ),
                  ),
              
                  const SizedBox(height: 20),
              
                  /// Table
                  SizedBox(
                    height: 58.h,
                    child: CompaniesTable()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchField(
      CompaniesController controller, bool isMobile) {
    return SizedBox(
      width: isMobile ? double.infinity : 55.w,
      height: 44,
      child: TextField(
        onChanged: controller.searchCompany,
        decoration: InputDecoration(
          hintText: "Search companies...",
          prefixIcon: const Icon(Icons.search, size: 18),
          filled: true,
          fillColor: const Color(0xfff2f4f7),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        ),
      ),
    );
  }
}

// ─── Summary Card ─────────────────────────────────────────────────────────────

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grey.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: title,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Spacer(),
              CustomText(
                text: value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Icon(icon, size: 24, color: Colors.grey.shade400),
        ],
      ),
    );
  }
}

// ─── Companies Table ──────────────────────────────────────────────────────────

class CompaniesTable extends StatelessWidget {
  CompaniesTable({super.key});
  final CompaniesController controller = Get.put(CompaniesController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
      return Container(
        padding: EdgeInsets.all(2.h),
        decoration: BoxDecoration(
          color: AppColors.boxbg,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.grey.withOpacity(0.5)),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: constraints.maxHeight*0.7,
            minWidth: constraints.maxWidth),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Obx(() {
                return DataTable(
                  decoration: BoxDecoration(
                    color: AppColors.boxbg,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.grey),
                  ),
                  headingRowHeight: 36,
                  columnSpacing: 24,
                  headingRowColor:
                      MaterialStateProperty.all(AppColors.boxbg),
                  columns: const [
                    DataColumn(
                      label: CustomText(
                        text: "Company Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: CustomText(
                        text: "Industry",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: CustomText(
                        text: "Workers",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: CustomText(
                        text: "Plan",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: CustomText(
                        text: "Billing Status",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: CustomText(
                        text: "Account Status",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: CustomText(
                        text: "Revenue",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: CustomText(
                        text: "Actions",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  rows: controller.filteredCompanies
                      .map((company) => _buildRow(context, company))
                      .toList(),
                );
              }),
            ),
          ),
        ),
      );
      }
    );
  }

  DataRow _buildRow(BuildContext context, Company company) {
    return DataRow(
      cells: [
        DataCell(
          InkWell(
            onTap: () => _goToDetails(context, company),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: company.name,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                CustomText(
                  text: "Joined: ${company.joinedDate}",
                  style:
                      const TextStyle(fontSize: 10, color: AppColors.grey),
                ),
              ],
            ),
          ),
        ),
        DataCell(
          InkWell(
            onTap: () => _goToDetails(context, company),
            child: CustomText(text: company.industry),
          ),
        ),
        DataCell(CustomText(text: company.workers)),
        DataCell(StatusBadge(text: company.plan)),
        DataCell(StatusBadge(text: company.billing)),
        DataCell(StatusBadge(text: company.account)),
        DataCell(CustomText(text: company.revenue)),
        DataCell(
          InkWell(
            onTap: () => _goToDetails(context, company),
            child: Row(
              children: const [
                Icon(Icons.remove_red_eye_outlined, size: 16),
                SizedBox(width: 4),
                CustomText(
                    text: "View", style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _goToDetails(BuildContext context, Company company) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => CompanyDetailsScreen(company: company)),
    );
  }
}
