import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../util/constants/colors.dart';
import '../services/services_screen.dart';
import 'detail_hospital.dart';
import 'hospital_maps.dart';

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({super.key});

  @override
  State<HospitalScreen> createState() => _HospitalScreen();
}

class _HospitalScreen extends State<HospitalScreen> {
  int index = 1;

  final List<Map<String, dynamic>> hospitals = [
    {
      'img': 'assets/images/Hospitals/ospedale.png',
      'name': 'Ospedale San Raffaele',
      'address': 'Via Olgettina, 60, 20132 Milano MI, Italy',
      'phone': '(+22) 2361 6257 1726',
      'bedDetailRoute': (BuildContext context) => const DetailHospital(),
      'locationRoute': (BuildContext context) => const HospitalMaps(),
    },

    {
      'img': 'assets/images/Hospitals/Ospedale1.png',
      'name': 'Ospedale San Raffaele',
      'address': 'Via Olgettina, 60, 20132 Milano MI, Italy',
      'phone': '(+22) 2361 6257 1726',
      'bedDetailRoute': (BuildContext context) => const DetailHospital(),
      'locationRoute': (BuildContext context) => const ServicesScreenScreen(),
    },

    {
      'img': 'assets/images/Hospitals/IRCCS.png',
      'name': 'Ospedale San Raffaele',
      'address': 'Via Olgettina, 60, 20132 Milano MI, Italy',
      'phone': '(+22) 2361 6257 1726',
      'bedDetailRoute': (BuildContext context) => DetailHospital(),
      'locationRoute': (BuildContext context) => const ServicesScreenScreen(),
    },

    {
      'img': 'assets/images/Hospitals/ospedale.png',
      'name': 'Ospedale San Raffaele',
      'address': 'Via Olgettina, 60, 20132 Milano MI, Italy',
      'phone': '(+22) 2361 6257 1726',
      'bedDetailRoute': (BuildContext context) => DetailHospital(),
      'locationRoute': (BuildContext context) => const ServicesScreenScreen(),
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 60.h, left: 28.w, right: 28.w),
          child: Column(
            children: [

              //Search Bar
              SizedBox(
                width: 372.w,
                height: 48.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24.w,
                      child: IconButton(
                        padding: EdgeInsets.zero, // remove internal padding
                        constraints: BoxConstraints(), // remove min constraints
                        alignment: Alignment.centerLeft,
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => ServicesScreenScreen()));
                        },
                        icon: Icon(Icons.chevron_left,
                          color: AppColors.btnSecondary,
                          size: 24.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      // width: 330.w,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 16.w, top: 14.h),
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
                            fontSize: 14.sp,
                            color: Color(0xff8F8F8F),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0.r),
                            borderSide:
                            BorderSide(color: Color(0xffC2E7D9), width: 1.w),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: Color(0xffC2E7D9), width: 1.w),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: Color(0xffC2E7D9), width: 1.w),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: Color(0xffC2E7D9), width: 1.w),
                          ),
                          filled: true,
                          fillColor: Color(0xffF9F9F9),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              //Search Provinces
              _buildPracticeLocationDropdown(context),
              SizedBox(height: 24.h),

              //List of Hospitals
              _buildHospitalList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPracticeLocationDropdown(BuildContext context) {
    return Container(
      // height: 48.h,
      padding: EdgeInsets.zero,
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
                fontSize: 16.sp,
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
                size: 24.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHospitalList() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(), // because inside SingleChildScrollView
      shrinkWrap: true,
      itemCount: hospitals.length,
      itemBuilder: (context, index) {
        final hospital = hospitals[index];
        return Container(
          margin: EdgeInsets.only(bottom: 24.h),
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Color(0xffC2E7D9))
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      hospital['img']!,
                      height: 74.h,
                      width: 90.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // SizedBox(width: 20.w),
                  Container(
                    width: 230.w,
                    padding: EdgeInsets.only(left: 20.w),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hospital['name']!,
                            style: GoogleFonts.khula(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              letterSpacing: 1.w,
                              height: 1.h,
                              color: Color(0xff090909),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            hospital['address']!,
                            style: GoogleFonts.khula(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              letterSpacing: 1.w,
                              // height: 1.h,
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
                                  letterSpacing: 1.w,
                                  height: 1.h,
                                  color: Color(0xff4D4D4D),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => hospitals[index]['bedDetailRoute'](context),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 47.5.w, vertical: 14.h),
                      side: BorderSide(color: AppColors.borderSecondary, width: 1.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.w),
                      ),
                    ),
                    child: Text(
                      "Bed Detail",
                      style: GoogleFonts.khula(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: AppColors.textBtn
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => hospitals[index]['locationRoute'](context),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 14.h),
                      backgroundColor: AppColors.btnPrimary,
                      foregroundColor: AppColors.textWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.w),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            'Location',
                            style: GoogleFonts.khula(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              letterSpacing: 1.w,
                              color: AppColors.textWhite,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Icon(Icons.arrow_forward_ios,color: Color(0xffFFFFFF),size: 12.sp)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

}
