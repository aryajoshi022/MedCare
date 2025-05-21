import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/profile/profile_screen.dart';
import '../../util/constants/colors.dart';


class HealthHistoryScreen extends StatefulWidget {
  const HealthHistoryScreen({Key? key}) : super(key: key);

  @override
  State<HealthHistoryScreen> createState() => _HealthHistoryScreen();
}

class _HealthHistoryScreen extends State<HealthHistoryScreen> {
  int index = 3;
  bool _isLocationExpanded = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 28, right: 28),
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
                        icon:
                        Image.asset('assets/icons/Back Arrow.png', height: 24.h),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const ProfileScreen()),
                          );
                        },
                      ),
                    ),
                    Spacer(flex: 2,),
                    Text(
                      'Health History',
                      style: GoogleFonts.khula(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: 1,
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
              _buildHealthHistroylist(),

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
        border: Border.all(color:Color(0xffE3E3E3), width: 1)
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
                    fontSize: 16,
                    color: const Color(0xff26408B),
                  ),
                ),
                AnimatedRotation(
                  turns: _isLocationExpanded ? 0.5 : 0,
                  duration: Duration(milliseconds: 200),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.btnSecondary,
                    size: 24,
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
                      fontSize: 16,
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
                fontSize: 16,
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
                fontSize: 16,
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

  Widget _buildHealthHistroylist() {
    return Container(
      height: 129.h,
      color: Color(0xff121212),
    );
  }

}

