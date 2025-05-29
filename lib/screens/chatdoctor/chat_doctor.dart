import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/chatdoctor/doctor_details.dart';
import 'package:medcare/screens/services/services_screen.dart';
import 'package:medcare/util/constants/colors.dart';

import '../../widgets/bottom bar/custom_bottom_bar.dart';

class ChatDoctor extends StatefulWidget {
  const ChatDoctor({super.key});

  @override
  State<ChatDoctor> createState() => _ChatDoctorState();
}

class _ChatDoctorState extends State<ChatDoctor> {
  final List<Map<String, dynamic>> doctorList =   [
    {
      'name': 'Dr. Luca Rossi',
      'specialty': 'Cardiology Specialist',
      'experience': '3 Years',
      'availability': 'Available on Wed - Sat',
      'image': 'assets/images/Dr_Luca_Rossi.png',
    },
    {
      'name': 'Dr. Marco Ferrari',
      'specialty': 'Orthopedics Specialist',
      'experience': '3 Years',
      'availability': 'Available on Wed - Tue',
      'image': 'assets/images/Dr_Marco_Ferrari.png',
    },
    {
      'name': 'Dr. Sofia Müller',
      'specialty': 'Dermatology Specialist',
      'experience': '6 Years',
      'availability': 'Available on Wed - Sat',
      'image': 'assets/images/Dr_Sofia_Müller.png',
    },
    {
      'name': 'Dr. Rajesh Patel',
      'specialty': 'General Surgery',
      'experience': '2 Years',
      'availability': 'Available on Wed - Sat',
      'image': 'assets/images/Dr_Rajesh_Patel.png',
    },
    {
      'name': 'Dr. Anna Schmidt',
      'specialty': 'General Practitioner',
      'experience': '10 Years',
      'availability': 'Available on Wed - Sat',
      'image': 'assets/images/Dr_Anna_Schmidt.png',
    },
    {
      'name': 'Dr. Emma Andersen',
      'specialty': 'Specialis Neurologi',
      'experience': '4 Years',
      'availability': 'Available on Wed - Sat',
      'image': 'assets/images/Dr_Emma_Andersen.png',
    },
    {
      'name': 'Dr. Fabian Weber',
      'specialty': 'General Surgery',
      'experience': '6 Years',
      'availability': 'Available on Wed - Sat',
      'image': 'assets/images/Dr_Fabian_Weber.png',
    },
  ];
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgAlert,
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildCustomAppBar(context),
            _buildSearchField(context),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: doctorList.length,
                itemBuilder: (context, index) {
                  final doctor = doctorList[index];
                  return _buildDoctorItem(doctor: doctor);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 16.h),
      child: Row(
        children: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesScreenScreen(),));
            },
            icon: Icon(Icons.chevron_left,
              color: AppColors.btnSecondary,
              size: 24.sp,
            ),
          ),
          Expanded(
            child:  Text('Chat Doctor',
              style: GoogleFonts.khula(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.textNormal,
                letterSpacing: 1.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: TextField(
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.only(left: 16.w, top: 14.h, bottom: 14.h, right: 16.w),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          prefixIconColor: AppColors.borderDisabled,
          prefixIcon: Icon(
            Icons.search_sharp,
            size: 20.sp,
          ),
          hintText: 'Find a doctor',
          hintStyle: GoogleFonts.khula(
            letterSpacing: 1.sp,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: AppColors.textDisabled,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0.r),
            borderSide: BorderSide(
                color: AppColors.borderThirsty,
                width: 1.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0.r),
            borderSide: BorderSide(
                color: AppColors.borderThirsty,
                width: 1.w,
            ),
          ),
          filled: true,
          fillColor: AppColors.btnInputField,
        ),
      ),
    );
  }

  Widget _buildDoctorItem({required Map<String, dynamic> doctor}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 6.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.w),
              child: Image.asset(
                doctor['image']!,
                width: 64.w,
                height: 64.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor['name']!,
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      letterSpacing: 1.sp,
                      color: AppColors.textNormal,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // SizedBox(height: 4.h),
                  Text(
                    '${doctor['specialty']!} • ${doctor['experience']!}',
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      letterSpacing: 1.sp,
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // SizedBox(height: 6.h),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.r),
                      color: Color(0xffDCFFDD),
                    ),
                    child: Text(
                      doctor['availability']!,
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        letterSpacing: 1.sp,
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorDetails()));
              },
              icon: Icon(Icons.chevron_right,
                color: AppColors.btnSecondary,
                size: 24.sp,
              ),
              constraints: BoxConstraints.loose(Size.fromWidth(2.w)),
            ),
          ],
        ),
      ),
    );
  }

}
