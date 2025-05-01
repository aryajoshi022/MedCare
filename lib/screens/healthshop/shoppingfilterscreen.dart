import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/constants/colors.dart';
import '../../widgets/health shop/scroller.dart';

class ShoppingFilterScreen extends StatefulWidget {
  const ShoppingFilterScreen({super.key});

  @override
  State<ShoppingFilterScreen> createState() => _ShoppingFilterScreenState();
}

class _ShoppingFilterScreenState extends State<ShoppingFilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            // AppBar
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
            //Filter Scroller
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 50.h,
                      width: 44.w,
                      child: FloatingActionButton(
                        onPressed: () {},
                        elevation: 0,
                        //highlightElevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            6,
                          ), // Rounded corners
                          side: BorderSide(
                            color: AppColors.borderBtn,
                            width: 1,
                          ), // Border color
                        ),
                        child: Image.asset('assets/icons/shop_filter.png'),
                        backgroundColor: AppColors.bgAlert,
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(text: 'Medicine & Treatment'),
                        SizedBox(width: 10), // Space between buttons
                        CustomButton(text: 'Milk'),
                        SizedBox(width: 10), // Space between buttons
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 199,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              6,
                            ), // Rounded corners
                            side: BorderSide(
                              color: AppColors.borderBtn,
                              width: 1,
                            ), // Border color
                          ),
                        ),
                        onPressed: () {
                          // Action to perform on button press
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 20.0,
                          ),
                          child: Text(
                            'Sexual Health',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      )),
    );
  }
}
