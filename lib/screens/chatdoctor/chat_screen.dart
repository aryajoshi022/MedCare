import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/chatdoctor/doctor_details.dart';
import '../../util/constants/colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildChatHeader(context),
            SizedBox(height: 16.h),
            Expanded(
              child: _buildChatBody(context),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          top: 26.h,
          bottom: MediaQuery.of(context).viewInsets.bottom.h + 34.h,
          left: 28.w,
          right: 28.w,
        ),
        child: Container(
          height: 56.h,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: AppColors.bgWhite,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Type here...',
                    hintStyle: GoogleFonts.khula(
                      color: AppColors.textDisabled,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.sp,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              Container(
                height: double.infinity.h,
                width: 1.w,
                color: AppColors.borderThirsty,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
              ),
              Image.asset(
                'assets/icons/Ph_Sticker.png',
                height: 24.h,
                width: 24.w,
                color: AppColors.borderDisabled,
              ),
              SizedBox(width: 16.w),
              Image.asset(
                'assets/icons/Camera_Linear.png',
                height: 24.h,
                width: 24.w,
                color: AppColors.borderDisabled,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 16.h),
      child: Row(
        children: [
          IconButton(
            // padding: EdgeInsets.zero,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorDetails()));
            },
            icon: Icon(Icons.chevron_left,
              color: AppColors.btnSecondary,
              size: 24.sp,
            ),
          ),
          CircleAvatar(
            radius: 22.r,
            backgroundColor: AppColors.borderSecondary,
            child: CircleAvatar(
              radius: 20.r,
              backgroundImage: AssetImage('assets/images/Dr_Fabian_Weber.png'),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dr. Giovanni Bianchi',
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: AppColors.textNormal,
                    letterSpacing: 1.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12.h),
                Text('General Surgery',
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: AppColors.textSecondary,
                    letterSpacing: 1.sp,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Image.asset('assets/icons/VideoCall.png',
              height: 24.h,
              width: 24.w,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => buildVideoCallScreen(context)),
              );
            },
          ),
          IconButton(
            icon: Image.asset('assets/icons/Call.png',
              height: 24.h,
              width: 24.w,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => buildVoiceCallScreen(context)),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChatBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.bgWhite,
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 100.w),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.r),
                            topRight: Radius.circular(12.r),
                            bottomLeft: Radius.circular(12.r),
                          ),
                          color: AppColors.bgPrimary,
                        ),
                        child: Text('Hello Doctor! I\'d like to schedule an appointment for a medical consultation',
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: AppColors.textWhite,
                            letterSpacing: 1.sp
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
                          child: Text(
                            "09:32 PM",
                            style: GoogleFonts.khula(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textDisabled,
                              letterSpacing: 1.sp
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  margin: EdgeInsets.only(right: 100.w),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12.r),
                            bottomRight: Radius.circular(12.r),
                            bottomLeft: Radius.circular(12.r),
                          ),
                          color: AppColors.bgAlert,
                        ),
                        child: Text('Hello! Of course, I\'m glad to assist you. What health concerns are you experiencing?',
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: AppColors.textNormal,
                            letterSpacing: 1.sp
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
                          child: Text(
                            "09:32 PM",
                            style: GoogleFonts.khula(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textDisabled,
                                letterSpacing: 1.sp
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  margin: EdgeInsets.only(left: 100.w),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.r),
                            topRight: Radius.circular(12.r),
                            bottomLeft: Radius.circular(12.r),
                          ),
                          color: AppColors.bgPrimary,
                        ),
                        child: Text('I\'ve been experiencing constant headaches over the past few days',
                          style: GoogleFonts.khula(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: AppColors.textWhite,
                              letterSpacing: 1.sp
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
                          child: Text(
                            "09:32 PM",
                            style: GoogleFonts.khula(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textDisabled,
                                letterSpacing: 1.sp
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  margin: EdgeInsets.only(right: 100.w),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12.r),
                            bottomRight: Radius.circular(12.r),
                            bottomLeft: Radius.circular(12.r),
                          ),
                          color: AppColors.bgAlert,
                        ),
                        child: Text('I understand. Let\'s schedule your appointment. Do you have any specific time preferences?',
                          style: GoogleFonts.khula(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: AppColors.textNormal,
                              letterSpacing: 1.sp
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
                          child: Text(
                            "09:32 PM",
                            style: GoogleFonts.khula(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textDisabled,
                                letterSpacing: 1.sp
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  margin: EdgeInsets.only(left: 100.w),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.r),
                            topRight: Radius.circular(12.r),
                            bottomLeft: Radius.circular(12.r),
                          ),
                          color: AppColors.bgPrimary,
                        ),
                        child: Text('I prefer Monday mornings, if possible.',
                          style: GoogleFonts.khula(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: AppColors.textWhite,
                              letterSpacing: 1.sp
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
                          child: Text(
                            "09:32 PM",
                            style: GoogleFonts.khula(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textDisabled,
                                letterSpacing: 1.sp
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 24.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.bgAlert,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
                    child: Text(
                      'Today',
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        letterSpacing: 1.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildVideoCallScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff06010E),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Stack(
              children: [
                Image(
                  image: AssetImage('assets/images/VC_User.png'),
                  fit: BoxFit.cover,
                ),
                Image(
                  image: AssetImage('assets/images/VC_Blur.png'),
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 16.h,
            left: 16.w,
            child: IconButton(
              icon: Icon(Icons.chevron_left, color: AppColors.btnGrey, size: 24.sp),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            bottom: 40.h,
            left: 0.w,
            right: 0.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 36.w),
                  child: Image.asset('assets/images/VC_Doctor.png',
                    height: 160.h,
                    width: 120.w,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.center,
                  child: Text("10:30 mins",
                    style: GoogleFonts.khula(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textWhite,
                      letterSpacing: 1.sp
                    ),
                  ),
                ),
                SizedBox(height: 21.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset('assets/icons/Speaker.png',
                        height: 72.h,
                        width: 72.w,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: 36.w),
                    IconButton(
                      icon: Image.asset('assets/icons/Mic.png',
                        height: 72.h,
                        width: 72.w,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: 36.w),
                    IconButton(
                      icon: Image.asset('assets/icons/Close.png',
                        height: 72.h,
                        width: 72.w,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildVoiceCallScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff06010E),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top.h + 16.h,
              left: 16.w,
            ),
            child: IconButton(
              icon: Icon(Icons.chevron_left, color: AppColors.btnGrey,size: 24.sp),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SizedBox(height: 40.h),
          Center(
            child: Column(
              children: [
                Text('Dr. Giovanni Bianchi',
                  style: GoogleFonts.khula(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textWhite,
                    letterSpacing: 1.sp
                  ),
                ),
                SizedBox(height: 24.h),
                Text('10:30 mins',
                  style: GoogleFonts.khula(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.borderThirsty,
                    letterSpacing: 1.sp
                  ),
                ),
                SizedBox(height: 34.h),
                CircleAvatar(
                  radius: 90.r,
                  backgroundImage: AssetImage('assets/images/Call_Doctor.png'),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Image.asset('assets/icons/Speaker.png',
                  height: 72.h,
                  width: 72.w,
                  fit: BoxFit.contain,
                ),
                onPressed: () {},
              ),
              SizedBox(width: 36.w),
              IconButton(
                icon: Image.asset('assets/icons/Mic.png',
                  height: 72.h,
                  width: 72.w,
                  fit: BoxFit.contain,
                ),
                onPressed: () {},
              ),
              SizedBox(width: 36.w),
              IconButton(
                icon: Image.asset('assets/icons/Close.png',
                  height: 72.h,
                  width: 72.w,
                  fit: BoxFit.contain,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

}
