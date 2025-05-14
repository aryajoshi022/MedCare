import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/chatdoctor/chat_doctor.dart';
import '../../util/constants/colors.dart';
import '../../widgets/bottom bar/custom_bottom_bar.dart';
import '../../widgets/categories/categories_widget.dart';
import '../home/home_screen.dart';
import '../hospital/detail_hospital.dart';
import '../hospital/hospital_maps.dart';
import '../services/services_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ListArticleScreen extends StatefulWidget {
  const ListArticleScreen({Key? key}) : super(key: key);


  @override
  State<ListArticleScreen> createState() => _ListArticleScreen();
}

class _ListArticleScreen extends State<ListArticleScreen> {

  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [

              //Search Bar
              Padding(
                padding: const EdgeInsets.only(left: 28, right: 28),
                child: Container(
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
                              icon: Image.asset('assets/icons/Search.png', height: 20.h),
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
                            // 🟢 Permanent green border styles
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(color: Color(0xffC2E7D9), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(color: Color(0xffC2E7D9), width: 1),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(color: Color(0xffC2E7D9), width: 1),
                            ),
                            filled: true,
                            fillColor: Color(0xffF9F9F9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Text(
                      'Hot Article',
                      style: GoogleFonts.khula(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        color: Color(0xff090909),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                    ),
                    items: [
                      _buildItem(),
                    ],
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Article/Slider/Center.png',
            width: 340.w,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 95,left: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '5 Tips for Boosting Your Immune System Naturally',
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    letterSpacing: 1,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: const EdgeInsets.only(top: 141,left: 16),
            child: Container(
              height: 23.h,
              width: 87.w,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => hospitals[index]['locationRoute'](context),
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  backgroundColor: AppColors.btnPrimary,
                  foregroundColor: AppColors.textWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        'Read Article',
                        style: GoogleFonts.khula(
                          fontWeight: FontWeight.w600,
                          fontSize: 10.sp,
                          letterSpacing: 1,
                          color: AppColors.textWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
