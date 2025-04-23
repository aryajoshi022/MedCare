import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/bottom bar/custom_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text.rich(
              TextSpan(
                text: 'Hi, ',
                style: GoogleFonts.khula(
                  color: Color(0xff090909),
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
                children: [
                  TextSpan(
                    text: 'Alexander', // bold text
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(), // Automatically pushes the icons to the right
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Image.asset('assets/icons/bell.png', height: 24.h),
                  onPressed: () {
                    // Bell action
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/icons/cart.png', height: 24.h),
                  onPressed: () {
                    // Cart action
                  },
                ),
              ],
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
      body: Column(
        children: [

          //Banner
          Stack(
            children: [
              Container(
                height: 210.h,
                child: Image.asset(
                  'assets/images/Home_Screen_Background.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top:59,
                  left: 264,
                ),
                child: Container(
                  height: 151.h,
                  child: Image.asset(
                    'assets/images/Home_screen_DocLogo.png',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:26,top: 40),
                child: Container(
                  height: 80,
                  child: Text(
                    "Experience Seamless\nHealthcare Management\nwith MediConnect",
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      letterSpacing: 1,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 140, left: 26),
                child: SizedBox(
                  height: 32.h,
                  width: 164.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff26408B),
                      foregroundColor: Color(0xffFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.w), // Optional
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Fill Your Profile Now!",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Khula',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.w), // Optional spacing
                        Image.asset(
                          'assets/icons/Vector.png',
                          height: 8.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          //Search bar
          Padding(
            padding: EdgeInsets.only(left: 28.w,right: 28.w,top: 32.h),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 16, top: 14, bottom: 14, right: 67),
                prefixIconColor: Color(0xff8F8F8F),
                prefixIcon: Icon(Icons.search_sharp,
                  size: 20,
                ),
                // prefixIconConstraints: BoxConstraints(minHeight: 7),
                hintText: 'Find a doctor, medicine or health services',
                hintStyle: GoogleFonts.khula(
                  letterSpacing: 1,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff8F8F8F),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                      color: Color(0xFFC2E7D9),
                      width: 1
                  ),
                ),
                filled: true,
                fillColor: Color(0xffF9F9F9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
