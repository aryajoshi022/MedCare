import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../util/constants/colors.dart';
import '../../widgets/bottom bar/custom_bottom_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3;
  final List<Map<String, dynamic>> menuList = [
    {
      'image': 'assets/icons/Book_Outline.png',
      'title': 'Prescription History',
      'subtitle': 'Check out the full prescription history here',
    },
    {
      'image': 'assets/icons/Health.png',
      'title': 'Health History',
      'subtitle': 'Check details regarding your medical history',
    },
    {
      'image': 'assets/icons/Transaction.png',
      'title': 'Transactions',
      'subtitle': 'Look back at your previous transactions',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgAlert,
      body: SafeArea(
        child: Column(
          children: [
            _buildCustomAppBar(context),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUserCard(context),
                  SizedBox(height: 32.h),
                  Text('Menu',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: 1,
                        color: AppColors.textSecondary
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 24.h),
                  Column(
                    children: menuList.map((menu) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 0.h),
                        child: _buildMenuCard(
                          image: menu['image'],
                          title: menu['title'],
                          subtitle: menu['subtitle'],
                          onTap: menu.containsKey('route')
                              ? () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => menu['route'](context)),
                          )
                              : null,
                        ),
                      );
                    }).toList(),
              ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 16.h),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.chevron_left,
              color: AppColors.btnSecondary,
              size: 24,
            ),
          ),
          Expanded(
            child:  Text('My Profile',
              style: GoogleFonts.khula(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.textNormal,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: AppColors.bgAlert
      ),
      padding: EdgeInsets.all(24.w),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 40.w,
                backgroundImage: AssetImage('assets/images/Profile_Lorenzo_Ricci.png'),
              ),
              CircleAvatar(
                radius: 12.w,
                backgroundImage: AssetImage('assets/images/Profile_Lorenzo_Ricci.png'),
              ),
            ],
          ),
          SizedBox(width: 24.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Lorenzo Ricci',
                  style: GoogleFonts.khula(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 1,
                      color: AppColors.textNormal
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                TextButton.icon(
                  style: ButtonStyle(
                    alignment: Alignment.topLeft,
                    padding: WidgetStatePropertyAll(EdgeInsets.zero)
                  ),
                  onPressed: (){},
                  label: Text('lorenzoricci@example.com',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: 1,
                        color: AppColors.textSecondary
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  icon: Image.asset('assets/icons/Mail.png',
                    width: 16.w,
                    height: 16.h,
                    fit: BoxFit.contain,
                    color: AppColors.textSecondary,
                  ),
                ),
                TextButton.icon(
                  style: ButtonStyle(
                    alignment: Alignment.topLeft,
                    padding: WidgetStatePropertyAll(EdgeInsets.zero)
                  ),
                  onPressed: (){},
                  label: Text('+39 1234567890',
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: 1,
                        color: AppColors.textSecondary
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  icon: Image.asset('assets/icons/Phone.png',
                    width: 16.w,
                    height: 16.h,
                    fit: BoxFit.contain,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard({
    required image,
    required title,
    required subtitle,
    Future Function()?
    onTap
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                image,
                height: 36.h,
                width: 36.w,
                // fit: BoxFit.contain,
                color: AppColors.bgPrimary,
              ),
              Column(
                children: [
                  Text(title,
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 1,
                        color: AppColors.textNormal
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(subtitle,
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: 1,
                        color: AppColors.textSecondary
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
  // Widget _buildMenuCard({required Map<String, dynamic> menu}) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text('Menu',
  //         style: GoogleFonts.khula(
  //             fontWeight: FontWeight.w400,
  //             fontSize: 16,
  //             letterSpacing: 1,
  //             color: AppColors.textSecondary
  //         ),
  //         maxLines: 1,
  //         overflow: TextOverflow.ellipsis,
  //       ),
  //       SizedBox(height: 24.h),
  //       Container(
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(12.w),
  //         ),
  //         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Row(
  //               children: [
  //                 Image.asset('assets/icons/Book_Outline.png',
  //                   height: 36.h,
  //                   width: 36.w,
  //                   fit: BoxFit.contain,
  //                   color: AppColors.bgPrimary,
  //                 ),
  //                 Column(
  //                   children: [
  //                     Text('data')
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

}


