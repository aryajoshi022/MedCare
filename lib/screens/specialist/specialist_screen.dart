import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/chatdoctor/chat_doctor.dart';
import '../../util/constants/colors.dart';
import '../../widgets/bottom bar/custom_bottom_bar.dart';
import '../../widgets/categories/categories_widget.dart';
import '../home/home_screen.dart';
import '../hospital/hospital_screen.dart';
import '../services/services_screen.dart';

class SpecialistScreenScreen extends StatefulWidget {
  const SpecialistScreenScreen({Key? key}) : super(key: key);

  @override
  State<SpecialistScreenScreen> createState() => _SpecialistScreenScreen();
}

class _SpecialistScreenScreen extends State<SpecialistScreenScreen> {

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> categories = [
      {'icon': 'assets/icons/categories/All.png', 'label': 'All','route': (BuildContext context) => const ChatDoctor()},
      {'icon': 'assets/icons/categories/General Practitioner.png', 'label': 'General\nPractitioner'},
      {'icon': 'assets/icons/categories/Dentistry.png', 'label': 'Dentistry'},
      {'icon': 'assets/icons/categories/Gynecology.png', 'label': 'Gynecology'},
      {'icon': 'assets/icons/categories/Ophthalmology.png', 'label': 'Ophthalmology'},
      {'icon': 'assets/icons/categories/Neurology.png', 'label': 'Neurology'},
      {'icon': 'assets/icons/categories/Otorhinolaryngology.png', 'label': 'Otorhinolaryngo\nlogy'},
      {'icon': 'assets/icons/categories/Pulmonologist.png', 'label': 'Pulmonologist'},
      {'icon': 'assets/icons/categories/Pediatrician.png', 'label': 'Pediatrician'},
      {'icon': 'assets/icons/categories/Neurology2.png', 'label': 'Neurology'},
      {'icon': 'assets/icons/categories/Psychiatrist.png', 'label': 'Psychiatrist'},
      {'icon': 'assets/icons/categories/Cardiologist.png', 'label': 'Cardiologist'},
      {'icon': 'assets/icons/categories/Gastoenterologi.png', 'label': 'Gastoenterol\nogi'},
      {'icon': 'assets/icons/categories/Virus.png', 'label': 'Virus'},
      {'icon': 'assets/icons/categories/Orthopedi.png', 'label': 'Orthopedi'},
      {'icon': 'assets/icons/categories/Endocrin.png', 'label': 'Endocrin'},
      {'icon': 'assets/icons/categories/Dermatologist.png', 'label': 'Dermatologist'},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgAlert,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ServicesScreenScreen()));
              },
              icon: Icon(Icons.chevron_left,
                color: AppColors.btnSecondary,
                size: 24.sp,
              ),
            ),
            Spacer(flex: 2),
            Text(
              'Specialist ',
              style: GoogleFonts.khula(
                color: Color(0xff090909),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.w
              ),
            ),
            Spacer(flex: 3),
            // Spacer(), // Automatically pushes the icons to the right
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

            //GridView
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h,horizontal: 28.w),
              child: Container(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      iconPath: categories[index]['icon']!,
                      label: categories[index]['label']!,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: categories[index]['route']!, // Call the function to create the screen
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
