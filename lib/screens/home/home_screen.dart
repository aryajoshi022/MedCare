import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/util/constants/colors.dart';
import '../../widgets/Chat with doctor/chat_doctor_widget.dart';
import '../../widgets/bottom bar/custom_bottom_bar.dart';
import '../../widgets/categories/categories_widget.dart';
import '../../widgets/health articles/health_article.dart';
import '../../widgets/nearby hospitals/hospital_card_widget.dart';
import '../../widgets/selling products/product_card_widget.dart';
import '../chatdoctor/chat_doctor.dart';
import '../chatdoctor/doctor_details.dart';
import '../healthshop/cart_screen.dart';
import '../healthshop/healthshopscreens.dart';
import '../hospital/detail_hospital.dart';
import '../profile/notification_screen.dart';
import '../profile/profile_screen.dart';
import '../specialist/specialist_screen.dart';

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

    final List<Map<String, dynamic>> categories = [
      {'icon': 'assets/icons/categories/All.png', 'label': 'All','route': (BuildContext context) => const SpecialistScreenScreen()},
      {'icon': 'assets/icons/categories/General Practitioner.png', 'label': 'General\nPractitioner'},
      {'icon': 'assets/icons/categories/Dentistry.png', 'label': 'Dentistry'},
      {'icon': 'assets/icons/categories/Gynecology.png', 'label': 'Gynecology'},
      {'icon': 'assets/icons/categories/Ophthalmology.png', 'label': 'Ophthalmology'},
      {'icon': 'assets/icons/categories/Neurology.png', 'label': 'Neurology'},
      {'icon': 'assets/icons/categories/Otorhinolaryngology.png', 'label': 'Otorhinolaryngo\nlogy'},
      {'icon': 'assets/icons/categories/Pulmonologist.png', 'label': 'Pulmonologist'},
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.bgAlert,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text.rich(
              TextSpan(
                text: 'Hi, ',
                style: GoogleFonts.khula(
                  color: Color(0xff090909),
                  fontSize: 20.sp,
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => CartApp()),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/icons/Notifications.png', height: 24.h),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => NotificationScreen()),
                    );
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
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
        
            //Banner
            Stack(
              children: [
                Container(
                  // height: 210.h,
                  child: Image.asset(
                    'assets/images/Home_Screen_Background.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top:56.h,
                    left: 264.w,
                  ),
                  child: Container(
                    height: 149.h,
                    child: Image.asset(
                      'assets/images/Home_screen_DocLogo.png',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.h,left:26.w),
                  child: Container(
                    // height: 80,
                    child: Text(
                      "Experience Seamless\nHealthcare Management\nwith MediConnect",
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        letterSpacing: 1,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 140.h, left: 26.w),
                  child: SizedBox(
                    height: 32.h,
                    width: 164.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff26408B),
                        foregroundColor: Color(0xffFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8.w), // Optional
                      ),
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => ProfileScreen()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Fill Your Profile Now!",
                            style: GoogleFonts.khula(
                              fontSize: 12.sp,
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
                  prefixIconConstraints: BoxConstraints(minWidth:15.05.w),
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
                        color: Color(0xffC2E7D9),
                        width: 1
                    ),
                  ),
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

            //GridView
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 28),
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

            //Consultation Button
            Container(
              // height: 82.h,
              width: 372.w,
              // margin: EdgeInsets.symmetric(horizontal: 28.w),
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0.r),
                border: Border.all(
                    color: Color(0xFFC2E7D9),
                    width: 1
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
                child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Consultation with a specialist",
                        style: GoogleFonts.khula(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          letterSpacing: 1,
                          color: Color(0xff090909),
                        ),
                      ),
                      Text(
                        "Promote health via chat or call",
                        style: GoogleFonts.khula(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          letterSpacing: 1,
                          color: Color(0xff4D4D4D),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(width: 16.w),
                // Icon(Icons.chevron_right),
                  IconButton(
                    icon: Image.asset('assets/icons/Arrow.png', height: 24.h),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => ChatDoctor()));
                    },
                  ),
              ],
            ),
          ),
        ),

            //Chat Doctor
            SizedBox(height: 32.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 28.w),
                  child: Text(
                    'Chat Doctor',
                    style: GoogleFonts.khula(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff090909),
                    ),
                  ),
                ),
                SizedBox(height: 14.h),
                Padding(
                  padding: EdgeInsets.only(left: 28.w),
                  child: SizedBox(
                    height: 160.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ChatDoctorCard(
                          name: 'Dr Leonard Campbell',
                          imagePath: 'assets/images/Doctor/Dr Leonard Campbell1.png',
                          specialization: 'Heart Specialist',
                          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => DoctorDetails())); },
                        ),
                        SizedBox(width: 10.w),
                        ChatDoctorCard(
                          name: 'Dr Leonard Campbell',
                          imagePath: 'assets/images/Doctor/Dr Leonard Campbell2.png',
                          specialization: 'Heart Specialist',
                          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => DoctorDetails())); },
                        ),
                        SizedBox(width: 10.w),
                        ChatDoctorCard(
                          name: 'Dr Leonard Campbell',
                          imagePath: 'assets/images/Doctor/Dr Leonard Campbell1.png',
                          specialization: 'Heart Specialist',
                          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => DoctorDetails())); },
                        ),
                        SizedBox(width: 10.w),
                        ChatDoctorCard(
                          name: 'Dr Leonard Campbell',
                          imagePath: 'assets/images/Doctor/Dr Leonard Campbell2.png',
                          specialization: 'Heart Specialist',
                          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => DoctorDetails())); },
                        ),
                        SizedBox(width: 10.w),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            //Best Selling Products
            SizedBox(height: 32.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 28.w),
                  child: Text(
                    'Best Selling Products',
                    style: GoogleFonts.khula(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff090909),
                    ),
                  ),
                ),
                SizedBox(height: 14.h),
                Padding(
                  padding: EdgeInsets.only(left: 28.w),
                  child: SizedBox(
                    height: 81.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ProductCard(
                            imagePath: 'assets/images/Selling Product/Vaccine.png',
                            productName: 'Vaccine',
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => HealthShopScreen())); }
                        ),
                        SizedBox(width: 10.w),
                        ProductCard(
                            imagePath: 'assets/images/Selling Product/Braces.png',
                            productName: 'Braces',
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => HealthShopScreen())); }

                        ),
                        SizedBox(width: 10.w),
                        ProductCard(
                            imagePath: 'assets/images/Selling Product/Wheelchair.png',
                            productName: 'Wheelchair',
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => HealthShopScreen())); }
                        ),
                        SizedBox(width: 10.w),
                        ProductCard(
                            imagePath: 'assets/images/Selling Product/Mask.png',
                            productName: 'Mask',
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => HealthShopScreen())); }
                        ),
                        SizedBox(width: 10.w),
                        ProductCard(
                            imagePath: 'assets/images/Selling Product/Braces.png',
                            productName: 'Braces',
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => HealthShopScreen())); }
                        ),
                        SizedBox(width: 10.w),

                      ],
                    ),
                  ),
                ),
              ],
            ),

            //Nearby Hospitals
            SizedBox(height: 32.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 28.w),
                  child: Text(
                    'Nearby Hospitals',
                    style: GoogleFonts.khula(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff090909),
                    ),
                  ),
                ),
                SizedBox(height: 14.h),
                Padding(
                  padding: EdgeInsets.only(left: 28.w),
                  child: SizedBox(
                    height: 160.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        HospitalCard(
                            HospitalLogo: 'assets/images/Hospitals/rscm.png',
                            Hospital: 'Cipto\nMangunkusumo\nHospital (RSCM)',
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => DetailHospital())); }
                        ),
                        SizedBox(width: 10),
                        HospitalCard(
                            HospitalLogo: 'assets/images/Hospitals/MKH.png',
                            Hospital: 'Mitra Keluarga\nHospital\n',
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => DetailHospital())); }
                        ),
                        SizedBox(width: 10),
                        HospitalCard(
                            HospitalLogo: 'assets/images/Hospitals/MH.png',
                            Hospital: 'Mayapada \nHospital\n',
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => DetailHospital())); }
                        ),
                        SizedBox(width: 10),
                        HospitalCard(
                            HospitalLogo: 'assets/images/Hospitals/rscm.png',
                            Hospital: 'Cipto\nMangunkusumo\nHospital (RSCM)',
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => DetailHospital())); }
                        ),
                        SizedBox(width: 10),


                      ],
                    ),
                  ),
                ),
              ],
            ),

            //Health Article
            SizedBox(height: 32.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 28.w),
                  child: Text(
                    'Health Article',
                    style: GoogleFonts.khula(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff090909),
                    ),
                  ),
                ),
                SizedBox(height: 14.h),
                Padding(
                  padding: EdgeInsets.only(left: 28.w),
                  child: Container(
                    alignment: Alignment.center,
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        HealthArticle(
                            imge: 'assets/images/Health Artical/Disease Prevention.png',
                            Artical: 'Disease Prevention',
                            ArticalDiscrptipon: 'Understanding Vaccination,The\nImportance of Preventative',
                            Date: '14 - Jun - 2023',
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => DetailHospital())); }
                        ),
                        SizedBox(height: 14.h),
                        HealthArticle(
                          imge: 'assets/images/Health Artical/Healthy Lifestyle.png',
                          Artical: 'Healthy Lifestyle',
                          ArticalDiscrptipon: 'Turning Bad Habits into Healthy\nHabits: Tips for Living Better',
                          Date: '14 - Jun - 2023',
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => DetailHospital())); }
                        ),
                        SizedBox(height: 14.h),
                        HealthArticle(
                          imge: 'assets/images/Health Artical/Healthy Lifestyle.png',
                          Artical: 'Healthy Lifestyle',
                          ArticalDiscrptipon: 'Turning Bad Habits into Healthy\nHabits: Tips for Living Better',
                          Date: '14 - Jun - 2023',
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => DetailHospital())); }
                        ),
                        SizedBox(height: 14.h),
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
  }
}
