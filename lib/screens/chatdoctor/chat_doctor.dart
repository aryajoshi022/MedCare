import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatDoctor extends StatefulWidget {
  const ChatDoctor({super.key});

  @override
  State<ChatDoctor> createState() => _ChatDoctorState();
}

class _ChatDoctorState extends State<ChatDoctor> {
  final List<Map<String, dynamic>> doctorList = [
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
      'image': 'assets/images/Dr_Luca_Rossi.png',
    },
    {
      'name': 'Dr. Anna Schmidt',
      'specialty': 'General Practitioner',
      'experience': '10 Years',
      'availability': 'Available on Wed - Sat',
      'image': 'assets/images/Dr_Luca_Rossi.png',
    },
    {
      'name': 'Dr. Emma Andersen',
      'specialty': 'Specialis Neurologi',
      'experience': '4 Years',
      'availability': 'Available on Wed - Sat',
      'image': 'assets/images/Dr_Luca_Rossi.png',
    },
    {
      'name': 'Dr. Fabian Weber',
      'specialty': 'General Surgery',
      'experience': '6 Years',
      'availability': 'Available on Wed - Sat',
      'image': 'assets/images/Dr_Luca_Rossi.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.chevron_left,
            color: Color(0xff4D4D4D),
            // size: 16,
          ),
        ),
        leadingWidth: 67,
        titleSpacing: 0,
        title: Text('Chat Doctor',
          style: GoogleFonts.khula(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xff090909),
            letterSpacing: 1,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 28.w, right: 28.w),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 16, top: 14, bottom: 14, right: 16),
                prefixIconColor: Color(0xff8F8F8F),
                prefixIcon: Icon(Icons.search_sharp,
                  size: 20,
                ),
                // prefixIconConstraints: BoxConstraints(minHeight: 7),
                hintText: 'Find a doctor',
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
          SizedBox(height: 24.h),
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
    );
  }

  Widget _buildDoctorItem({required Map<String, dynamic> doctor}) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 14.w),
      margin: EdgeInsets.symmetric(horizontal: 28.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 14.w),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.asset('assets/images/Dr_Luca_Rossi.png',
                height: 64.h,
                width: 64.h,
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
                      fontSize: 14,
                      letterSpacing: 1,
                      color: Color(0xff090909),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    '${doctor['specialty']!} • ${doctor['experience']!}',
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      letterSpacing: 1,
                      color: Color(0xff4D4D4D),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Color(0xffDCFFDD),
                    ),
                    child: Text(
                      doctor['availability']!,
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        letterSpacing: 1,
                        color: Color(0xff4D4D4D),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right),
            // IconButton(
            //   onPressed: (){},
            //   icon: Icon(Icons.chevron_right,
            //     color: Color(0xff4D4D4D),
            //   ),
            //   constraints: BoxConstraints.loose(Size.fromWidth(2)),
            // ),
          ],
        ),
      ),
    );
  }
}
