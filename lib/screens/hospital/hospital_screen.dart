import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/chatdoctor/chat_doctor.dart';
import '../../util/constants/colors.dart';
import '../../widgets/bottom bar/custom_bottom_bar.dart';
import '../../widgets/categories/categories_widget.dart';
import '../home/home_screen.dart';
import '../services/services_screen.dart';

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({Key? key}) : super(key: key);

  @override
  State<HospitalScreen> createState() => _HospitalScreen();
}

class _HospitalScreen extends State<HospitalScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, String>> hospitals = [
    {
      'img': 'assets/images/Hospitals/ospedale.png',
      'name': 'Ospedale San Raffaele',
      'address': 'Via Olgettina, 60, 20132 Milano MI, Italy',
      'phone': '(+22) 2361 6257 1726',
    },
  ];

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
                                const ServicesScreenScreen()),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      width: 330.w,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 16, top: 14),
                          prefixIconColor: Color(0xff8F8F8F),
                          prefixIcon: IconButton(
                            icon: Image.asset('assets/icons/Search.png',
                                height: 20.h),
                            onPressed: () {},
                          ),
                          prefixIconConstraints: BoxConstraints(minWidth: 15.05.w),
                          hintText: 'Search product or store',
                          hintStyle: GoogleFonts.khula(
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff8F8F8F),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide:
                            BorderSide(color: Color(0xffC2E7D9), width: 1),
                          ),
                          filled: true,
                          fillColor: Color(0xffF9F9F9),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Search Provinces
              SizedBox(height: 24.h),
              _buildPracticeLocationDropdown(context),

              //List of Hospitals
              _buildHospitalList(), // List here
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPracticeLocationDropdown(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.w),
        border: Border.all(color: Color(0xffE3E3E3), width: 1),
        color: Color(0xffFFFFFF),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 24.w),
            child: Text(
              'Search Provinces',
              style: GoogleFonts.khula(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 1,
                color: Color(0xff26408B),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 12.5.w),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xff26408B),
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHospitalList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(), // because inside SingleChildScrollView
      shrinkWrap: true,
      itemCount: hospitals.length,
      itemBuilder: (context, index) {
        final hospital = hospitals[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xffE3E3E3))
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        hospital['img']!,
                        height: 74.h,
                        width: 74.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hospital['name']!,
                            style: GoogleFonts.khula(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              letterSpacing: 1,
                              color: Color(0xff090909),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            hospital['address']!,
                            style: GoogleFonts.khula(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              letterSpacing: 0.5,
                              color: Color(0xff4D4D4D),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/Phone.png',
                                height: 12.h,
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                hospital['phone']!,
                                style: GoogleFonts.khula(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.sp,
                                  color: Color(0xff4D4D4D),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],

                ),
                SizedBox(height: 16.h),
                Divider(color: AppColors.borderBtn),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 47.5.w, vertical: 14.h),
                        side: BorderSide(color: AppColors.borderSecondary, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.w),
                        ),
                      ),
                      child: Text(
                        "Bed Detail",
                        style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: AppColors.textBtn
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 41.5.w, vertical: 14.h),
                          backgroundColor: AppColors.btnPrimary,
                          foregroundColor: AppColors.textWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.w),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Location',
                              style: GoogleFonts.khula(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                letterSpacing: 1,
                                color: AppColors.textWhite,
                              ),
                            ),
                            SizedBox(width: 2.5.w),
                            Icon(Icons.arrow_forward_ios,color: Colors.white,size: 12)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
