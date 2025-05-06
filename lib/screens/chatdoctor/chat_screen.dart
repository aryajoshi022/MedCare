import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
            _buildCustomAppBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w).copyWith(top: 24.h),
      child: Row(
        children: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.chevron_left,
              color: Color(0xff4D4D4D),
              // size: 16,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22.w,
                  backgroundColor: AppColors.borderSecondary,
                  child: CircleAvatar(
                    radius: 20.w,
                    backgroundImage: AssetImage('assets/images/Dr_Luca_Rossi.png'),
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Dr. Giovanni Bianchi',
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.textNormal,
                        // letterSpacing: 1,
                      ),
                    ),
                    // SizedBox(height: 12.h),
                    Text('General Surgery',
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.textSecondary,
                        // letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: Image.asset('assets/icons/VideoCall.png',
              height: 24.h,
              width: 24.w,
              fit: BoxFit.contain,
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: Image.asset('assets/icons/Call.png',
              height: 24.h,
              width: 24.w,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

}
