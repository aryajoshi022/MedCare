import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../util/constants/colors.dart';
import 'list_article_screen.dart';

class ArticleDetailsScreen extends StatefulWidget {
  const ArticleDetailsScreen({Key? key}) : super(key: key);


  @override
  State<ArticleDetailsScreen> createState() => _ArticleDetailsScreen();
}

class _ArticleDetailsScreen extends State<ArticleDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.bgAlert,
        elevation: 0,
        automaticallyImplyLeading: false,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Image.asset('assets/icons/Back Arrow.png', height: 24.h),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ListArticleScreen()),
                );
              },
            ),
            // Spacer(), // Automatically pushes the icons to the right
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 28.w,right: 28.w,bottom: 60.h + MediaQuery.of(context).padding.bottom),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                'Getting to know Hanta Virus Disease from Rodents',
                style: GoogleFonts.khula(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  letterSpacing: 1.w,
                  color: Color(0xff090909),
                ),
              ),
              SizedBox(height: 24.h),

              Text(
                'Written by Lonard on January 10, 2024',
                style: GoogleFonts.khula(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  letterSpacing: 1.w,
                  height: 1.h,
                  color: Color(0xff8F8F8F),
                ),
              ),
              SizedBox(height: 14.h),

              //Banner
              Stack(
                children: [
                  Container(
                    height: 180.h,
                    child: Image.asset(
                      'assets/images/Article/Article Details/Hanta Virus.png',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              //Details
              Container(
                child: Column(
                  children: [

                    //Title
                    Text(
                      'Title: Understanding Hanta Virus Disease: Risks, Symptoms, and Prevention Measures from Rodents',
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        letterSpacing: 1.w,
                        color: Color(0xff4D4D4D),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    //Introduction
                    Text(
                      'Introduction:\nHanta virus disease, transmitted primarily through contact with rodent urine, droppings, or saliva, poses a significant health threat to humans worldwide. This article aims to provide an overview of Hanta virus disease, its potential risks, common symptoms, and essential prevention measures.',
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        letterSpacing: 1.w,
                        color: Color(0xff4D4D4D),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    //About
                    Text(
                      'What is Hanta Virus Disease?\nHanta virus disease is a rare but potentially deadly viral infection caused by several strains of hantaviruses. These viruses are typically carried by rodents, such as mice, rats, and voles, and can be transmitted to humans through inhalation of airborne particles contaminated with rodent excreta.',
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        letterSpacing: 1.w,
                        color: Color(0xff4D4D4D),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    //Risk
                    Text(
                      'Understanding the Risks:\nIndividuals who live or work in areas with high rodent populations, such as rural or semi-rural environments, are at an increased risk of contracting Hanta virus disease. Activities that involve disturbing rodent habitats, such as cleaning barns, sheds, or attics, can also elevate the risk of exposure.',
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        letterSpacing: 1.w,
                        color: Color(0xff4D4D4D),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    //Common Symptoms
                    Text(
                      'Common Symptoms:\nThe symptoms of Hanta virus disease can vary widely but often include flu-like symptoms such as fever, muscle aches, headaches, and fatigue. As the disease progresses, individuals may experience respiratory symptoms such as coughing and shortness of breath, which can rapidly escalate to severe respiratory distress and potentially fatal complications.',
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        letterSpacing: 1.w,
                        color: Color(0xff4D4D4D),
                      ),
                    ),
                    SizedBox(height: 24.h),

                  ],
                ),
              ),

              //Tags
              Container(
                height: 62.h,  // you might want to remove this fixed height if wrap may exceed it
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tag :',
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        letterSpacing: 1.w,
                        color: Color(0xff4D4D4D),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(  // better than fixed width Container for responsiveness
                      child: _buildWorkingHoursGrid(context),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWorkingHoursGrid(BuildContext context) {
    final tags = <String>[
      'Content-healthy',
      'Healthcare',
      'healthy-environment',
    ];

    return Wrap(
      spacing: 12.w,   // horizontal space between tags
      runSpacing: 12.h, // vertical space between lines
      children: tags.map((tag) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.w),
            border: Border.all(
              width: 1.w,
              color: Color(0xff7266D7),
            ),
          ),
          child: Text(
            tag,
            style: GoogleFonts.khula(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              letterSpacing: 1.w,
              color: Color(0xff26408B),
            ),
          ),
        );
      }).toList(),
    );
  }


}
