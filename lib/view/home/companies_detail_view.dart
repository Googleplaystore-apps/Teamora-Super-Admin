// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:teamora/components/app_colors.dart';
// import 'package:teamora/components/app_text.dart';
// import 'package:teamora/models/company_model.dart';
// import 'package:teamora/view/home/companies_screen.dart';
// import 'package:teamora/view/home/widgets/company_charts.dart';
// import 'package:teamora/view/home/widgets/company_detail_screen_card.dart';
// import 'package:teamora/view/home/widgets/sidebar.dart';

// class CompanyDetailsScreen extends StatelessWidget {
//   final Company company;

//   const CompanyDetailsScreen({super.key, required this.company});
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final isDesktop = constraints.maxWidth >= 1200;
//         final isTablet =
//             constraints.maxWidth >= 600 && constraints.maxWidth < 1200;
//         final isMobile = constraints.maxWidth < 600;
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
//           body: Padding(
//             padding: EdgeInsets.all(2.h),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   /// Header Section
//                   Row(
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: const Icon(Icons.arrow_back),
//                       ),
//                       const SizedBox(width: 12),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           CustomText(
//                             text: company.name,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           CustomText(
//                             text: "Company ID: ${company.id}",
//                             style: TextStyle(fontSize: 12, color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                       const Spacer(),
              
//                       /// Buttons
//                       GestureDetector(
//                         onTap: () {
//                           // TODO: Edit Services Action
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                             vertical: 2,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.transparent,
//                             borderRadius: BorderRadius.circular(6),
//                             border: Border.all(
//                               color: AppColors.grey.withOpacity(0.5),
//                             ),
//                           ),
//                           child: Row(
//                             children: const [
//                               Icon(Icons.settings, size: 18),
//                               SizedBox(width: 8),
//                               CustomText(
//                                 text: "Edit Services",
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
              
//                       const SizedBox(width: 12),
              
//                       /// Suspend Account
//                       GestureDetector(
//                         onTap: () {
//                           // TODO: Suspend Account Action
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                             vertical: 2,
//                           ),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(6),
//                             border: Border.all(
//                               color: Colors.grey.withOpacity(0.5),
//                             ),
//                           ),
//                           child: Row(
//                             children: const [
//                               Icon(
//                                 Icons.warning_amber_rounded,
//                                 size: 18,
//                                 color: Colors.red,
//                               ),
//                               SizedBox(width: 8),
//                               CustomText(
//                                 text: "Suspend Account",
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.red,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
              
//                   const SizedBox(height: 24),
              
//                   /// Profile + Subscription
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       /// Company Profile Card
//                       Expanded(
//                         flex: 2,
//                         child: _card(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const CustomText(
//                                 text: "Company Profile",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               const SizedBox(height: 20),
              
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const CustomText(
//                                           text: "Company Name",
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 4),
//                                         CustomText(
//                                           text: company.name,
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const CustomText(
//                                           text: "Industry",
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 4),
//                                         Container(
//                                           padding: EdgeInsets.symmetric(
//                                             horizontal: 7,
//                                             vertical: 1,
//                                           ),
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(
//                                               4,
//                                             ),
//                                             border: Border.all(
//                                               color: AppColors.grey,
//                                               width: 0.5,
//                                             ),
//                                           ),
//                                           child: CustomText(
//                                             text: company.industry,
//                                             style: TextStyle(
//                                               fontSize: 10,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 16),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const CustomText(
//                                           text: "Contact Email",
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 4),
//                                         CustomText(
//                                           text: company.email,
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const CustomText(
//                                           text: "Contact phone",
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 4),
//                                         CustomText(
//                                           text: company.phone,
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 16),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const CustomText(
//                                     text: "Address",
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   const CustomText(
//                                     text:
//                                         "123 Medical Center Dr, Suite 500, San Francisco, CA 94102",
//                                   ),
//                                 ],
//                               ),
              
//                               const SizedBox(height: 16),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const CustomText(
//                                           text: "joined Date",
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 4),
//                                         CustomText(text: company.joinedDate),
//                                       ],
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const CustomText(
//                                           text: "Account Status",
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 4),
//                                         StatusBadge(text: company.account),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 20),
//                             ],
//                           ),
//                         ),
//                       ),
              
//                       const SizedBox(width: 20),
              
//                       /// Subscription Card
//                       Expanded(
//                         child: _card(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 "Subscription & Pricing",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               const SizedBox(height: 20),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const CustomText(
//                                     text: "Current Plan",
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   StatusBadge(text: company.plan),
//                                 ],
//                               ),
//                               const SizedBox(height: 8),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const CustomText(
//                                     text: "Billing Cycle",
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   CustomText(
//                                     text: "Monthly",
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 8),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const CustomText(
//                                     text: "Amount",
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   CustomText(
//                                     text: company.revenue,
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                   // const SizedBox(height: 4),
//                                   // const CustomText(
//                                   //   text: "per month",
//                                   //   style: TextStyle(
//                                   //     color: Colors.grey,
//                                   //     fontSize: 12,
//                                   //   ),
//                                   // ),
//                                 ],
//                               ),
//                               const SizedBox(height: 8),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const CustomText(
//                                     text: "Company Name",
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   CustomText(
//                                     text: company.name,
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 16),
              
//                               Container(
//                                 height: 33,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   color: AppColors.primary,
//                                   borderRadius: BorderRadius.circular(4),
//                                 ),
//                                 child: Center(
//                                   child: CustomText(
//                                     text: 'Upgrade Plan',
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
              
//                   const SizedBox(height: 24),
              
//                   /// Services Enabled
//                   _card(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const CustomText(
//                           text: "Services Enabled",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         const SizedBox(height: 20),
              
//                         GridView.count(
//                           crossAxisCount: 4, // number of columns
//                           crossAxisSpacing: 16,
//                           mainAxisSpacing: 16,
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           childAspectRatio: 7,
//                           children: const [
//                             _serviceItem("Live Tracking"),
//                             _serviceItem("Rostering"),
//                             _serviceItem("Timesheets"),
//                             _serviceItem("Appointments"),
//                             _serviceItem("Shift Management"),
//                             _serviceItem("Billing"),
//                             _serviceItem("Analytics"),
//                             _serviceItem("Mobile App"),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   GridView.count(
//                           crossAxisCount: 4, // number of columns
//                           crossAxisSpacing: 16,
//                           mainAxisSpacing: 16,
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           childAspectRatio: 3,
//                           children: [
//                             CompanyDetailScreenCard(title: 'Active Workers', value: company.workers, icon: Icons.people_outline,),
//                             CompanyDetailScreenCard(title: 'Shifts Created', value: '123', icon: Icons.calendar_today_outlined,),
//                             CompanyDetailScreenCard(title: 'Appointments', value: '1234', icon: Icons.check_circle_outline,),
//                             CompanyDetailScreenCard(title: 'Tracking Usage', value: '98%', icon: Icons.location_on_outlined,),
//                           ],
//                         ),
//                         SizedBox(height: 20,),
//                   Row(children: [
//                     Expanded(child: SizedBox(
//                       height: 322,
//                       child: UsageTrendChart())),
//                     SizedBox(width: 3.h,),
//                     Expanded(child: SizedBox(
//                       height: 322,
//                       child: WorkerActivityChart()))
//                   ],)
                  
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   /// Reusable Card
//   static Widget _card({required Widget child}) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: AppColors.boxbg,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: AppColors.grey.withOpacity(0.5)),
//       ),
//       child: child,
//     );
//   }
// }

// /// Service Chip
// class _serviceItem extends StatelessWidget {
//   final String title;
//   const _serviceItem(this.title);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
//       decoration: BoxDecoration(
//         color: AppColors.grey.shade100,
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Icon(Icons.check_circle_outline, color: Colors.green, size: 20),
//           const SizedBox(width: 10),
//           Text(title),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:teamora/components/app_card.dart';
import 'package:teamora/components/app_colors.dart';
import 'package:teamora/components/app_text.dart';
import 'package:teamora/components/status_badge.dart';
import 'package:teamora/models/company_model.dart';
import 'package:teamora/view/home/companies_screen.dart';
import 'package:teamora/view/home/widgets/company_charts.dart';
import 'package:teamora/view/home/widgets/company_detail_screen_card.dart';
import 'package:teamora/view/home/widgets/sidebar.dart';

class CompanyDetailsScreen extends StatelessWidget {
  final Company company;

  const CompanyDetailsScreen({super.key, required this.company});

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
          drawer: isMobile || isTablet ? SideBar() : null,
          appBar: _buildAppBar(context, isMobile, isTablet, constraints),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 12 : 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header Row
                    _buildHeader(context, isMobile, isTablet),

                    const SizedBox(height: 20),

                    /// Profile + Subscription
                    isMobile
                        ? Column(
                            children: [
                              _buildCompanyProfileCard(company),
                              const SizedBox(height: 16),
                              _buildSubscriptionCard(company),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: _buildCompanyProfileCard(company),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildSubscriptionCard(company),
                              ),
                            ],
                          ),

                    const SizedBox(height: 20),

                    /// Services Enabled
                    _buildServicesCard(isMobile, isTablet),

                    const SizedBox(height: 20),

                    /// Stats Grid
                    _buildStatsGrid(company, isMobile, isTablet),

                    const SizedBox(height: 20),

                    /// Charts
                    _buildChartsSection(isMobile),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // ─── AppBar ───────────────────────────────────────────────────────────────

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    bool isMobile,
    bool isTablet,
    BoxConstraints constraints,
  ) {
    return AppBar(
      backgroundColor: AppColors.boxbg,
      elevation: 0,
      automaticallyImplyLeading: isMobile || isTablet,
      title: const CustomText(
        text: "Companies",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      actions: [
        // if (!isMobile)
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
                  style: TextStyle(fontSize: 10, color: AppColors.primary),
                ),
              ],
            ),
          ),
        // else
        //   Icon(Icons.shield_outlined, size: 18, color: AppColors.primary),
        SizedBox(width: isMobile ? 8 : 16),
      ],
    );
  }

  // ─── Header ───────────────────────────────────────────────────────────────

  Widget _buildHeader(
    BuildContext context,
    bool isMobile,
    bool isTablet,
  ) {
    final actionButtons = isMobile
        ? null
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _outlineButton(
                icon: Icons.settings,
                label: "Edit Services",
                onTap: () {},
              ),
              const SizedBox(width: 10),
              _outlineButton(
                icon: Icons.warning_amber_rounded,
                label: "Suspend Account",
                onTap: () {},
                iconColor: Colors.red,
                textColor: Colors.red,
              ),
            ],
          );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: company.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  CustomText(
                    text: "Company ID: ${company.id}",
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
            if (!isMobile) ...[
              const SizedBox(width: 10),
              actionButtons!,
            ],
          ],
        ),
        if (isMobile) ...[
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _outlineButton(
                  icon: Icons.settings,
                  label: "Edit Services",
                  onTap: () {},
                  fullWidth: true,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _outlineButton(
                  icon: Icons.warning_amber_rounded,
                  label: "Suspend",
                  onTap: () {},
                  iconColor: Colors.red,
                  textColor: Colors.red,
                  fullWidth: true,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  // ─── Profile Card ─────────────────────────────────────────────────────────

  Widget _buildCompanyProfileCard(

    Company company) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Company Profile",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          _infoRow([
            _infoItem("Company Name", company.name),
            _infoItem(
              "Industry",
              company.industry,
              isBadge: true,
            ),
          ]),
          const SizedBox(height: 14),
          _infoRow([
            _infoItem("Contact Email", company.email),
            _infoItem("Contact Phone", company.phone),
          ]),
          const SizedBox(height: 14),
          _labelValue(
            "Address",
            "123 Medical Center Dr, Suite 500, San Francisco, CA 94102",
          ),
          const SizedBox(height: 14),
          _infoRow([
            _infoItem("Joined Date", company.joinedDate),
            _infoItemWithBadge("Account Status", company.account),
          ]),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // ─── Subscription Card ────────────────────────────────────────────────────

  Widget _buildSubscriptionCard(Company company) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Subscription & Pricing",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          _labelWidget("Current Plan", StatusBadge(text: company.plan)),
          const SizedBox(height: 10),
          _labelValue("Billing Cycle", "Monthly"),
          const SizedBox(height: 10),
          _labelValue("Amount", company.revenue,
              valueStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const SizedBox(height: 10),
          _labelValue("Company Name", company.name),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 36,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 0,
              ),
              child: const CustomText(
                text: 'Upgrade Plan',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Services Card ────────────────────────────────────────────────────────

  Widget _buildServicesCard(bool isMobile, bool isTablet) {
    const services = [
      "Live Tracking",
      "Rostering",
      "Timesheets",
      "Appointments",
      "Shift Management",
      "Billing",
      "Analytics",
      "Mobile App",
    ];

    final crossAxisCount = isMobile ? 2 : (isTablet ? 3 : 4);

    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Services Enabled",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: isMobile ? 4 : 6,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) => _ServiceItem(services[index]),
          ),
        ],
      ),
    );
  }

  // ─── Stats Grid ───────────────────────────────────────────────────────────

  Widget _buildStatsGrid(Company company, bool isMobile, bool isTablet) {
    final items = [
      _StatData('Active Workers', company.workers, Icons.people_outline),
      _StatData('Shifts Created', '123', Icons.calendar_today_outlined),
      _StatData('Appointments', '1234', Icons.check_circle_outline),
      _StatData('Tracking Usage', '98%', Icons.location_on_outlined),
    ];

    final crossAxisCount = isMobile ? 2 : 4;
    final double childAspectRatio = isMobile? 2.2 :isTablet? 2.3:3;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) => CompanyDetailScreenCard(
        title: items[index].title,
        value: items[index].value,
        icon: items[index].icon,
      ),
    );
  }

  // ─── Charts Section ───────────────────────────────────────────────────────

  Widget _buildChartsSection(bool isMobile) {
    if (isMobile) {
      return Column(
        children: [
          UsageTrendChart(),
          const SizedBox(height: 16),
          WorkerActivityChart(),
        ],
      );
    }
    return Row(
      children: [
        Expanded(child: SizedBox(height: 332, child: UsageTrendChart())),
        const SizedBox(width: 16),
        Expanded(child: SizedBox(height: 332, child: WorkerActivityChart())),
      ],
    );
  }

  static Widget _infoRow(List<Widget> children) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children
          .map((w) => Expanded(child: w))
          .toList()
          .expand((w) => [w, const SizedBox(width: 12)])
          .toList()
        ..removeLast(),
    );
  }

  static Widget _infoItem(String label, String value,
      {bool isBadge = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: label,
          style: const TextStyle(color: Colors.grey, fontSize: 11),
        ),
        const SizedBox(height: 4),
        isBadge
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.grey, width: 0.5),
                ),
                child: CustomText(
                  text: value,
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.bold),
                ),
              )
            : CustomText(
                text: value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w500),
              ),
      ],
    );
  }

  static Widget _infoItemWithBadge(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: label,
          style: const TextStyle(color: Colors.grey, fontSize: 11),
        ),
        const SizedBox(height: 4),
        StatusBadge(text: value),
      ],
    );
  }

  static Widget _labelValue(
    String label,
    String value, {
    TextStyle? valueStyle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: label,
          style: const TextStyle(color: Colors.grey, fontSize: 11),
        ),
        const SizedBox(height: 4),
        CustomText(
          text: value,
          style: valueStyle ??
              const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  static Widget _labelWidget(String label, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: label,
          style: const TextStyle(color: Colors.grey, fontSize: 11),
        ),
        const SizedBox(height: 4),
        child,
      ],
    );
  }

  static Widget _outlineButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
    bool fullWidth = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: fullWidth ? double.infinity : null,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.grey.withOpacity(0.5)),
        ),
        child: Row(
          mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: fullWidth
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Icon(icon, size: 16, color: iconColor),
            const SizedBox(width: 6),
            CustomText(
              text: label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Service Item ─────────────────────────────────────────────────────────────

class _ServiceItem extends StatelessWidget {
  final String title;
  const _ServiceItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.grey.shade100,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle_outline,
              color: Colors.green, size: 16),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Stat Data Model ──────────────────────────────────────────────────────────

class _StatData {
  final String title;
  final String value;
  final IconData icon;
  _StatData(this.title, this.value, this.icon);
}