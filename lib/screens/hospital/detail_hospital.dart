import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/hospital/hospital_maps.dart';
import 'package:medcare/util/constants/colors.dart';
import '../../widgets/categories/categories_widget.dart';

class DetailHospital extends StatefulWidget {
  const DetailHospital({Key? key}) : super(key: key);

  @override
  State<DetailHospital> createState() => _DetailHospital();
}

class _DetailHospital extends State<DetailHospital> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, dynamic>> typeofroom = [
    {
      'Word': 'General Ward',
      'Space': '(4 persons per room)',
      'total beds':'120',
      'Availability':'10 beds',
      'Price':'\$100-\$150',
    },

    {
      'Word': 'Semi-Private Rooms',
      'Space': '(2 persons per room)',
      'total beds':'80',
      'Availability':'30 beds',
      'Price':'\$170-\$210',
    },

    {
      'Word': 'Private Rooms',
      'Space': '',
      'total beds':'40',
      'Availability':'20 beds',
      'Price':'\$350-\$450',
    },

    {
      'Word': 'Deluxe Suites',
      'Space': '',
      'total beds':'12',
      'Availability':'0 beds',
      'Price':'\$600-\$1,000',
    },

  ];

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> categories = [
      {'icon': 'assets/icons/categories/General Practitioner.png', 'label': 'General\nPractitioner'},
      {'icon': 'assets/icons/categories/Dentistry.png', 'label': 'Dentistry'},
      {'icon': 'assets/icons/categories/Gynecology.png', 'label': 'Gynecology'},
      {'icon': 'assets/icons/categories/Ophthalmology.png', 'label': 'Ophthalmology'},
      {'icon': 'assets/icons/categories/Neurology.png', 'label': 'Neurology'},
      {'icon': 'assets/icons/categories/Otorhinolaryngology.png', 'label': 'Otorhinolaryngo\nlogy'},
      {'icon': 'assets/icons/categories/Psychiatrist.png', 'label': 'Psychiatrist'},
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        height: 93.h + MediaQuery.of(context).padding.bottom,
        child: Padding(
          padding: EdgeInsets.only(left: 17.w,top: 14.h,bottom: 28.h + MediaQuery.of(context).padding.bottom,right: 17.w),
          child: Row(
            children: [
              Container(
                height: 51.h,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HospitalMaps()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    side: BorderSide(color: AppColors.borderSecondary, width: 1.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.w),
                    ),
                  ),
                  child: Text(
                    "Maps",
                    style: GoogleFonts.khula(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: AppColors.textBtn,
                        letterSpacing: 1.w,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                height: 51.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 78.5.w),
                    backgroundColor: AppColors.btnPrimary,
                    foregroundColor: AppColors.textWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.w),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Contact Now',
                        style: GoogleFonts.khula(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          letterSpacing: 1.w,
                          color: AppColors.textWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding:EdgeInsets.only(left: 28.w,right: 28.w,top: 60.h),
        child: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [

                //Banner
                Stack(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/Hospitals/Ospedale_full.png',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),

                //Hospital Details
                Container(
                  height: 68.h,
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ospedale San Raffaele',
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            letterSpacing: 1,
                            height: 1.h,
                            color: Color(0xff090909),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          'Via Olgettina, 60, 20132 Milano MI, Italy',
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            letterSpacing: 1.w,
                            color: Color(0xff4D4D4D),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/Phone.png',
                              height: 12.h,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              '(+22) 2361 6257 1726',
                              style: GoogleFonts.khula(
                                fontWeight: FontWeight.w400,
                                fontSize: 11.sp,
                                letterSpacing: 1,
                                height: 1.h,
                                color: Color(0xff4D4D4D),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                //Line
                SizedBox(height: 24.h),
                Divider(color: AppColors.borderBtn),
                SizedBox(height: 24.h),

                //Specialties
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Specialties',
                        style: GoogleFonts.khula(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff090909),
                          letterSpacing: 1.w
                        ),
                      ),
                      SizedBox(height: 16.h),
                      GridView.builder(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: categories.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 8,
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
                    ],
                  ),
                ),

                //Line
                SizedBox(height: 24.h),
                Divider(color: AppColors.borderBtn),
                SizedBox(height: 24.h),

                //Type Rooms
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Type Rooms',
                        style: GoogleFonts.khula(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff090909),
                            letterSpacing: 1.w
                        ),
                      ),
                      SizedBox(height: 16.h),
                      //List of Hospitals
                      _buildtypeofroom(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildtypeofroom() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(), // because inside SingleChildScrollView
      shrinkWrap: true,
      itemCount: typeofroom.length,
      itemBuilder: (context, index) {
        final hospital = typeofroom[index];
        return Container(
          margin: EdgeInsets.only(bottom: 18.h),
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Color(0xffC2E7D9))
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10.w,top: 10.h,bottom: 10.h,right: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          hospital['Word'],
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            letterSpacing: 1.w,
                            // height: 1.h,
                            color: Color(0xff26408B),
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          hospital['Space']!,
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            letterSpacing: 1.w,
                            // height: 1.h,
                            color: Color(0xff090909),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Total beds : ',
                                style: GoogleFonts.khula(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  letterSpacing: 1.w,
                                  // height: 1.h,
                                  color: Color(0xff4D4D4D),
                                ),
                              ),
                              Text(
                                hospital['total beds']!,
                                style: GoogleFonts.khula(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                  letterSpacing: 1.w,
                                  // height: 1.h,
                                  color: Color(0xff4D4D4D),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Remaining Availability : ',
                                style: GoogleFonts.khula(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  letterSpacing: 1.w,
                                  // height: 1.h,
                                  color: Color(0xff4D4D4D),
                                ),
                              ),
                              Text(
                                hospital['Availability']!,
                                style: GoogleFonts.khula(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                  letterSpacing: 1.w,
                                  // height: 1.h,
                                  color: Color(0xff4D4D4D),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Price per night : ',
                                style: GoogleFonts.khula(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  letterSpacing: 1.w,
                                  // height: 1.h,
                                  color: Color(0xff4D4D4D),
                                ),
                              ),
                              Text(
                                hospital['Price']!,
                                style: GoogleFonts.khula(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                  letterSpacing: 1.w,
                                  // height: 1.h,
                                  color: Color(0xff4D4D4D),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
