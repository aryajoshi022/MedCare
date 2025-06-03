import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/chatdoctor/chat_doctor.dart';
import '../../util/constants/colors.dart';
import '../../widgets/bottom bar/custom_bottom_bar.dart';
import '../../widgets/categories/categories_widget.dart';
import '../List Article/list_article_screen.dart';
import '../MedicationReminder/medication_reminder.dart';
import '../healthshop/healthshopscreens.dart';
import '../home/home_screen.dart';
import '../hospital/hospital_screen.dart';
import '../specialist/specialist_screen.dart';

class ServicesScreenScreen extends StatefulWidget {
  const ServicesScreenScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreenScreen> createState() => _ServicesScreenScreen();
}

class _ServicesScreenScreen extends State<ServicesScreenScreen> {

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> categories = [
      {'icon': 'assets/images/Services/Chat Doctor.png', 'label': 'Chat Doctor', 'route': (BuildContext context) => const ChatDoctor()},
      {'icon': 'assets/images/Services/Hospitals.png', 'label': 'Hospitals' , 'route': (BuildContext context) => const HospitalScreen()},
      {'icon': 'assets/images/Services/Emergency Services.png', 'label': 'Health Shop', 'route': (BuildContext context) => const HealthShopScreen()},
      {'icon': 'assets/images/Services/Articel.png', 'label': 'Articel', 'route': (BuildContext context) => const ListArticleScreen()},
      {'icon': 'assets/images/Services/Medication Reminder.png', 'label': 'Medication\nReminder', 'route': (BuildContext context) => const MedicationReminder()},
      {'icon': 'assets/images/Services/Specialization.png', 'label': 'Specialization', 'route': (BuildContext context) => const SpecialistScreenScreen()},

    ];

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false,  // this removes all previous routes
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.bgAlert,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomeScreen()));
                },
                icon: Icon(Icons.chevron_left,
                  color: AppColors.btnSecondary,
                  size: 24.sp,
                ),
              ),
              Spacer(flex: 2),
                Text(
                   'Services ',
                  style: GoogleFonts.khula(
                    color: Color(0xff090909),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
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
                padding: EdgeInsets.symmetric(vertical: 30.w,horizontal: 28.h),
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
      ),
    );
  }
}
