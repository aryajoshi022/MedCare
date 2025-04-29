import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/Chat with doctor/chat_doctor_widget.dart';
import '../../widgets/bottom bar/custom_bottom_bar.dart';
import '../../widgets/categories/categories_widget.dart';
import '../../widgets/health articles/health_article.dart';
import '../../widgets/nearby hospitals/hospital_card_widget.dart';
import '../../widgets/selling products/product_card_widget.dart';
import '../chatdoctor/doctor_details.dart';
import '../home/home_screen.dart';

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

    final List<Map<String, String>> categories = [
      {'icon': 'assets/images/Services/Chat Doctor.png', 'label': 'Chat Doctor'},
      {'icon': 'assets/images/Services/Hospitals.png', 'label': 'Hospitals'},
      {'icon': 'assets/images/Services/Emergency Services.png', 'label': 'Emergency\nServices'},
      {'icon': 'assets/images/Services/Articel.png', 'label': 'Articel'},
      {'icon': 'assets/images/Services/Medication Reminder.png', 'label': 'Medication\nReminder'},
      {'icon': 'assets/images/Services/Specialization.png', 'label': 'Specialization'},

    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Image.asset('assets/icons/Back Arrow.png', height: 24.h),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
              SizedBox(width: 115),
              Text(
                 'Services ',
                style: GoogleFonts.khula(
                  color: Color(0xff090909),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
              padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 28),
              child: Container(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
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

          ],
        ),
      ),
    );
  }
}
