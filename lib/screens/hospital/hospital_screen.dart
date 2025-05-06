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
      'image': 'assets/images/hospital1.png',
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

              SizedBox(height: 24.h),
              _buildPracticeLocationDropdown(context),

              SizedBox(height: 24.h),
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
      physics: NeverScrollableScrollPhysics(), // because in SingleChildScrollView
      shrinkWrap: true,
      itemCount: hospitals.length,
      itemBuilder: (context, index) {
        final hospital = hospitals[index];
        return Container(
          width: 372.w,
          height: 175.h,
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.w),
            border: Border.all(color: const Color(0xffE0E0E0), width: 1),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.w),
                    child: Image.asset(
                      hospital['image']!,
                      width: 90.w,
                      height: 74.h,
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
                            color: const Color(0xff90909),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          hospital['address']!,
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            letterSpacing: 1,
                            color: const Color(0xff4D4D4D),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          hospital['phone']!,
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 10.sp,
                            color: const Color(0xff26408B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xff26408B)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Bed Detail',
                        style: GoogleFonts.inter(
                          color: const Color(0xff26408B),
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff26408B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Location',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
