import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/Chat with doctor/chat_doctor_widget.dart';
import '../../widgets/bottom bar/custom_bottom_bar.dart';
import '../../widgets/categories/categories_widget.dart';
import '../../widgets/nearby hospitals/hospital_card_widget.dart';
import '../../widgets/selling products/product_card_widget.dart';

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

    final List<Map<String, String>> categories = [
      {'icon': 'assets/icons/categories/All.png', 'label': 'All'},
      {'icon': 'assets/icons/categories/General Practitioner.png', 'label': 'General\nPractitioner'},
      {'icon': 'assets/icons/categories/Dentistry.png', 'label': 'Dentistry'},
      {'icon': 'assets/icons/categories/Gynecology.png', 'label': 'Gynecology'},
      {'icon': 'assets/icons/categories/Ophthalmology.png', 'label': 'Ophthalmology'},
      {'icon': 'assets/icons/categories/Neurology.png', 'label': 'Neurology'},
      {'icon': 'assets/icons/categories/Otorhinolaryngology.png', 'label': 'Otorhinolaryng\nology'},
      {'icon': 'assets/icons/categories/Pulmonologist.png', 'label': 'Pulmonologist'},
    ];

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
      body: SingleChildScrollView(
        child: Column(
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
        
            //Search Button
            Padding(
              padding: EdgeInsets.only(left: 28.w,right: 28.w,top: 32.h),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 16, top: 14, bottom: 14, right: 67),
                  prefixIconColor: Color(0xff8F8F8F),
                  prefixIcon: IconButton(
                    icon: Image.asset('assets/icons/Search.png', height: 20.h),
                    onPressed: () {
                      // Bell action
                    },
                  ),
                  prefixIconConstraints: BoxConstraints(minWidth:3.05.w),
                  hintText: 'Find a doctor, medicine or health services',
                  hintStyle: GoogleFonts.khula(
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff8F8F8F),
                  ),
                  suffixIconConstraints: BoxConstraints(minWidth:31.w),
                  suffixIcon: IconButton(
                    icon: Image.asset('assets/icons/Filtter.png', height: 20.h),
                    onPressed: () {
                      // Bell action
                  },
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

            //GridView
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 28),
              child: Container(
                height: 183.h,
                width: 372.w,
                child: GridView.builder(
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 6,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      iconPath: categories[index]['icon']!,
                      label: categories[index]['label']!,
                    );
                  },
                ),
              ),
            ),

            //Consultaion Button
            Padding(
              padding: EdgeInsets.only(left: 28.w,right: 28.w,top: 32.h),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 16, top: 14, bottom: 14, right: 67),
                  prefixIconColor: Color(0xff8F8F8F),
                  hintText: 'Consultation with a specialist',
                  hintStyle: GoogleFonts.khula(
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff090909),
                  ),

                  labelText: 'Promote health via chat or call',
                  labelStyle: GoogleFonts.khula(
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff4D4D4D),
                  ),

                  suffixIconConstraints: BoxConstraints(minWidth:31.w),
                  suffixIcon: IconButton(
                    icon: Image.asset('assets/icons/Filtter.png', height: 20.h),
                    onPressed: () {
                      // Bell action
                    },
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

            ChatDoctorCard(name: 'Dr. Aisha', imagePath: 'assets/images/doctor1.png', specialization: 'Cardiologist'),

            ProductCard(imagePath: 'assets/images/product1.png', productName: 'Stethoscope', price: '\$40'),

            HospitalCard(name: 'City Hospital', imagePath: 'assets/images/hospital1.png', location: 'MG Road'),


          ],
        ),
      ),
    );
  }
}
