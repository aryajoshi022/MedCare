import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/home/home_screen.dart';
import 'package:medcare/screens/profile/health_history_screen.dart';
import 'package:medcare/screens/profile/notification_screen.dart';
import 'package:medcare/screens/profile/prescription_history.dart';
import 'package:medcare/screens/profile/transaction_screen.dart';
import '../../util/constants/colors.dart';
import '../../widgets/bottom bar/custom_bottom_bar.dart';
import 'account_setting.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3;
  bool _notificationsEnabled = false;
  final List<Map<String, dynamic>> menuList = [
    {
      'image': 'assets/icons/Prescription_History.png',
      'title': 'Prescription History',
      'subtitle': 'Check out the full prescription history here',
      'route': (context) => PrescriptionHistory(),
    },
    {
      'image': 'assets/icons/Health_History.png',
      'title': 'Health History',
      'subtitle': 'Check details regarding your medical history',
      'route': (context) => HealthHistoryScreen(),
    },
    {
      'image': 'assets/icons/Transactions.png',
      'title': 'Transactions',
      'subtitle': 'Look back at your previous transactions',
      'route': (context) => TransactionScreen(),
    },
  ];
  final List<Map<String, dynamic>> generalInfo = [
    {
      'image': 'assets/icons/Account_Settings.png',
      'name': 'Account Settings',
      'isSwitch': false,
      'route': (context) => AccountSetting(), // ✅ Add this
    },
    {
      'image': 'assets/icons/Notifications.png',
      'name': 'Notifications',
      'isSwitch': false,
      'route': (context) => NotificationScreen(), // ✅ Add this
    },
    {
      'image': 'assets/icons/Reference_Settings.png',
      'name': 'Reference Settings',
      'isSwitch': false,
      // 'route': (context) => ReferenceSettingsScreen(), // ✅ Add this
    },
    {
      'image': 'assets/icons/Dark_Mode.png',
      'name': 'Dark Mode',
      'isSwitch': true,

    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgAlert,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildCustomAppBar(context),
              // SizedBox(height: 20.h),
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
                        return _buildMenuCard(
                          image: menu['image'],
                          title: menu['title'],
                          subtitle: menu['subtitle'],
                          onTap: menu['route'] != null
                              ? () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => menu['route'](context)),
                          )
                              : null,
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 32.h),
                    Text('General Information',
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
                      children: generalInfo.map((info) {
                        bool isDarkMode = info['isSwitch'] == true;
                        final routeBuilder = info['route'] as Widget Function(BuildContext)?;

                        return _buildGeneralInfoCard(
                          image: info['image'],
                          name: info['name'],
                          isSwitch: isDarkMode,
                          switchValue: _notificationsEnabled,
                          onSwitchChanged: (value) {
                            setState(() {
                              _notificationsEnabled = value;
                            });
                          },
                          onTap: isDarkMode || routeBuilder == null
                              ? null
                              : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => routeBuilder(context)),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 32.h),
                    _buildLogOut(context),
                  ],
                ),
              ),
            ],
          ),
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
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
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
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 12.w,
                  backgroundImage: AssetImage('assets/icons/Edit_Option.png'),
                ),
              ),
            ],
          ),
          SizedBox(width: 24.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lorenzo Ricci',
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    letterSpacing: 1,
                    color: AppColors.textNormal,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h), // Smaller spacing
                TextButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/Mail.png',
                    width: 16.w,
                    height: 16.h,
                    fit: BoxFit.contain,
                    color: AppColors.textSecondary,
                  ),
                  label: Text(
                    'lorenzoricci@example.com',
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      letterSpacing: 1,
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: WidgetStatePropertyAll(Size.zero),
                  ),
                ),
                SizedBox(height: 2.h),
                TextButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/Phone.png',
                    width: 16.w,
                    height: 16.h,
                    fit: BoxFit.contain,
                    color: AppColors.textSecondary,
                  ),
                  label: Text(
                    '+39 1234567890',
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      letterSpacing: 1,
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: WidgetStatePropertyAll(Size.zero),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenuCard({
    required String image,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
          color: AppColors.bgAlert,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 36.h,
              width: 36.w,
              color: AppColors.bgPrimary,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 1,
                      color: AppColors.textNormal,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      letterSpacing: 1,
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGeneralInfoCard({
    required String image,
    required String name,
    bool isSwitch = false,
    bool switchValue = false,
    VoidCallback? onTap,
    ValueChanged<bool>? onSwitchChanged,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
          color: AppColors.bgAlert,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  height: 36.h,
                  width: 36.w,
                  color: AppColors.bgPrimary,
                ),
                SizedBox(width: 16.w),
                Text(
                  name,
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    letterSpacing: 1,
                    color: AppColors.textNormal,
                  ),
                ),
              ],
            ),
            if (isSwitch)
              Switch(
                value: switchValue,
                onChanged: onSwitchChanged,
                activeColor: AppColors.btnPrimary,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogOut(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.w)),
          backgroundColor: AppColors.bgAlert,
          side: BorderSide(width: 1, color: AppColors.borderThirsty),
        ),
        onPressed: () {},
        child: Text(
          'Log Out',
          style: GoogleFonts.khula(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 1,
            color: AppColors.textRed,
          ),
        ),
      ),
    );
  }

}