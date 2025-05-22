import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/profile/profile_screen.dart';
import '../../util/constants/colors.dart';
import '../../widgets/bottom bar/custom_bottom_bar.dart';


class HealthHistoryScreen extends StatefulWidget {
  const HealthHistoryScreen({Key? key}) : super(key: key);

  @override
  State<HealthHistoryScreen> createState() => _HealthHistoryScreen();
}

class _HealthHistoryScreen extends State<HealthHistoryScreen> {
  int index = 3;
  int _selectedIndex = 3;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  bool _isLocationExpanded = false;

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> _healthHistoryItems = [
      {
        'title': 'Type 2 Diabetes',
        'diagnosisDate': 'January 10, 2022',
        'buttonLabel': 'Disease History',
        'route': () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen())),
      },
      {
        'title': 'Hypertension',
        'diagnosisDate': 'May 15, 2023',
        'buttonLabel': 'Disease History',
        'route': () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen())),
      },
      {
        'title': 'Allergy to Legumes',
        'diagnosisDate': 'Severe, Precautions\n\nAvoid foods containing nuts',
        'buttonLabel': 'Disease History',
        'route': () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen())),
      },
    ];


    return Scaffold(
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 60.h, left: 28.w, right: 28.w),
          child: Column(
            children: [

              //Search Bar
              Container(
                width: 372.w,
                height: 48.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 24.w,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => ProfileScreen()));
                        },
                        icon: Icon(Icons.chevron_left,
                          color: AppColors.btnSecondary,
                          size: 24.sp,
                        ),
                      ),
                    ),
                    Spacer(flex: 2),
                    Text(
                      'Health History',
                      style: GoogleFonts.khula(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          letterSpacing: 1.w,
                          color: AppColors.textNormal
                      ),
                    ),
                    Spacer(flex: 3,)
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              //Search Provinces
              _buildPracticeLocationDropdown(context),
              SizedBox(height: 24.h),

              //Listview
              Column(
                children: _healthHistoryItems.map((item) =>
                    Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: _buildHealthHistoryList(item)
                    )
                ).toList(),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPracticeLocationDropdown(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.w),
        color: const Color(0xffffffff),
        border: Border.all(color:Color(0xffE3E3E3), width: 1.w)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isLocationExpanded = !_isLocationExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Disease History',
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: const Color(0xff26408B),
                  ),
                ),
                AnimatedRotation(
                  turns: _isLocationExpanded ? 0.5 : 0,
                  duration: Duration(milliseconds: 200),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.btnSecondary,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
          ),
          if (_isLocationExpanded) ...[
            SizedBox(height: 20.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Allergy History',
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              'Allergy History',
              style: GoogleFonts.khula(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.textSecondary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 20.h),
            Text(
              'History of Drugs Consumed',
              style: GoogleFonts.khula(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.textSecondary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildHealthHistoryList(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.w),
        color: const Color(0xff121212),
        border: Border.all(color: const Color(0xff121212), width: 1.w),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item['title'],
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: const Color(0xff8F8F8F),
                  ),
                ),
                Container(
                  height: 17.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff4D4D4D),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                    ),
                    onPressed: () {},
                    child: Text(
                      item['buttonLabel'],
                      style: GoogleFonts.khula(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: 1.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.h),
            Text(
              'Diagnosis : ${item['diagnosisDate']}',
              style: GoogleFonts.khula(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: const Color(0xff8F8F8F),
              ),
            ),
            SizedBox(height: 24.h),
            GestureDetector(
              onTap: item['route'],
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xff26408B),
                    ),
                  ),
                ),
                padding: EdgeInsets.only(bottom: 2.h),
                child: Text(
                  'Check Details',
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: const Color(0xff26408B),
                    letterSpacing: 1.w,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}

