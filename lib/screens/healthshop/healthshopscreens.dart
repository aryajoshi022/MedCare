import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/util/constants/colors.dart';

class HealthShopScreen extends StatefulWidget {
  const HealthShopScreen({super.key});

  @override
  State<HealthShopScreen> createState() => _HealthShopScreenState();
}

class _HealthShopScreenState extends State<HealthShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.bgAlert,
      body: SafeArea(
        child: Column(
          children: [
            //Appbar
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chevron_left,
                      color: Color(0xff4D4D4D),
                      // size: 16,
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                    width: 288.w,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 16,
                          top: 14,
                          bottom: 14,
                          right: 16,
                        ),
                        prefixIconColor: Color(0xff8F8F8F),
                        prefixIcon: Icon(
                          Icons.search_sharp,
                          size: 20,
                          color: AppColors.textPrimary,
                        ),
                        // prefixIconConstraints: BoxConstraints(minHeight: 7),
                        hintText: 'Search product or store',
                        hintStyle: GoogleFonts.khula(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff8F8F8F),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: AppColors.borderThirsty,
                            width: 1,
                          ),
                        ),
                        filled: true,
                        fillColor: Color(0xffF9F9F9),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icons/add_cart.png',
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

          ],
        ),
      ),
    );
  }
}

Widget _scroller(){
  return Scaffold(
    body:             Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 40.h,
          width: 44.w,
          child: FloatingActionButton(
            onPressed: () {},
            child: Image.asset('assets/icons/shop_filter.png',),
            backgroundColor: AppColors.bgAlert,
          ),
        ),
        SizedBox(
          height: 40.h,
          width: 162.w,
          child: FloatingActionButton(
            onPressed: () {},
            child: Text('Medicine & Treatment'),
            backgroundColor: AppColors.bgAlert,
          ),
        ),
        SizedBox(
          height: 40.h,
          width: 50.w,
          child: FloatingActionButton(
            onPressed: () {},
            child: Text('Milk'),
            backgroundColor: AppColors.bgAlert,
          ),
        ),

      ],
    ),

  );
}