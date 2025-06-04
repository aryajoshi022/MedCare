import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/healthshop/cart_screen.dart';
import 'package:medcare/screens/healthshop/shoppingfilterscreen.dart';
import 'package:medcare/util/constants/colors.dart';
import 'package:medcare/widgets/health%20shop/health_product_card.dart';

import '../home/home_screen.dart';

class CartWithNotif extends StatefulWidget {
  const CartWithNotif({super.key});

  @override
  State<CartWithNotif> createState() => _CartWithNotifState();
}

class _CartWithNotifState extends State<CartWithNotif> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false,  // this removes all previous routes
        );
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        //backgroundColor: AppColors.bgAlert,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                //Appbar
                Padding(
                  padding: const EdgeInsets.only(top: 24,right: 20,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 8,),

                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
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
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),

                              borderSide: BorderSide(
                                color: AppColors.borderThirsty,
                                width: 1,
                              ),
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
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CartScreen()),
                          );
                        },
                        icon: Image.asset(
                          'assets/images/health_shop/notify_cart.png',
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
                        padding: const EdgeInsets.only(left: 20),
                        child: SizedBox(
                          height: 40.h,
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

                              )
                              , // Border color
                            ),
                            child: Image.asset('assets/icons/shop_filter.png'),
                            backgroundColor: AppColors.bgAlert,
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 12,right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton2(text: 'Medicine & Treatment'),
                            SizedBox(width: 10), // Space between buttons
                            CustomButton(text: 'Milk'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 170,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
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
                              elevation: 0.0,
                            ),
                            onPressed: () {
                              // Action to perform on button press
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 12.0,
                              ),
                              child: Text(
                                'Sexual Health',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.khula(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.borderDisabled),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Scroller
                SizedBox(height: 16.h),

                //Out Brands
                Container(
                  width: 500.w,
                  height: 280.h,
                  //decoration: BoxDecoration(),
                  color: AppColors.borderThirsty,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 24.w,top: 24.h,left: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 372.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Official store',
                                style: GoogleFonts.khula(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(right: 24.w),
                                child: Text(
                                  'see all',
                                  style: GoogleFonts.khula(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.bgPrimary,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Special offers from various renowned brands',
                          style: GoogleFonts.khula(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 16.h),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                height: 140.h,
                                width: 140.w,
                                decoration: BoxDecoration(
                                  border: Border.fromBorderSide(
                                    BorderSide(
                                      color: AppColors.textDisabled,
                                      width: 20,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.asset(
                                  'assets/images/health_shop/brand.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Container(
                                height: 140.h,
                                width: 140.w,
                                decoration: BoxDecoration(
                                  border: Border.fromBorderSide(
                                    BorderSide(
                                      color: AppColors.textDisabled,
                                      width: 20,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.asset(
                                  'assets/images/health_shop/brandsec.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(width: 12),
                              Container(
                                height: 140.h,
                                width: 140.w,
                                decoration: BoxDecoration(
                                  border: Border.fromBorderSide(
                                    BorderSide(
                                      color: AppColors.textDisabled,
                                      width: 20,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.asset(
                                  'assets/images/health_shop/brandthird.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Hot Sales
                Padding(
                  padding: EdgeInsets.only(top: 24.h,bottom: 16.h,right: 28.w,left: 28.w),
                  child: SizedBox(
                    width: 372.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hot Sales',
                          style: GoogleFonts.khula(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Text(
                          'See all',
                          style: GoogleFonts.khula(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.bgPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.w,right: 12.w,bottom: 24.h),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(width: 1,color: AppColors.borderBtn.withOpacity(0.5))),
                          width: 185.w,
                          height: 298.h,
                          child: Padding(
                            padding: EdgeInsets.all(11),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/health_shop/productone.png',
                                  height: 123.h,
                                  width: 155.w,
                                ),
                                Text(
                                  'Promag 10 Tablets',
                                  style: GoogleFonts.khula(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Per Strip',
                                  style: GoogleFonts.khula(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textDisabled,
                                  ),
                                ),
                                SizedBox(height: 34.h),
                                Text(
                                  'Start from',
                                  style: GoogleFonts.khula(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textDisabled,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$2,00',
                                      style: GoogleFonts.khula(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textBtn,
                                      ),
                                    ),
                                    SizedBox(width: 5.w,),
                                    SizedBox(
                                      width: 90.w,
                                      height: 32.h,
                                      child: ElevatedButton(

                                        child: Text(
                                          'Add',
                                          style: GoogleFonts.khula(fontSize: 16),
                                        ),
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: AppColors.btnPrimary,
                                          elevation: 0.0,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24),
                                            side: BorderSide(
                                              color: AppColors.btnPrimary,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 12.w,bottom: 24.h),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(width: 1,color: AppColors.borderBtn.withOpacity(0.5))),
                          width: 185.w,
                          height: 298.h,
                          child: Padding(
                            padding: EdgeInsets.only(right: 11.w,left: 11.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/health_shop/productsec.png',
                                  height: 123.h,
                                  width: 155.w,
                                ),
                                Text(
                                  'STRIP NEURODEX 10 TABLET',
                                  style: GoogleFonts.khula(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Per Strip',
                                  style: GoogleFonts.khula(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textDisabled,
                                  ),
                                ),
                                SizedBox(height: 25.h),
                                Text(
                                  'Start from',
                                  style: GoogleFonts.khula(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textDisabled,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$2,00',
                                      style: GoogleFonts.khula(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textBtn,
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    SizedBox(
                                      width: 90.w,
                                      height: 32.h,
                                      child: ElevatedButton(

                                        child: Text(
                                          'Add',
                                          style: GoogleFonts.khula(fontSize: 16),
                                        ),
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: AppColors.btnPrimary,
                                          elevation: 0.0,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24),
                                            side: BorderSide(
                                              color: AppColors.btnPrimary,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(right: 12.w,bottom: 24.h),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(width: 1,color: AppColors.borderBtn.withOpacity(0.5))),
                          width: 185.w,
                          height: 298.h,
                          child: Padding(
                            padding:  EdgeInsets.only(right: 11.w,left: 11.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/health_shop/productsec.png',
                                  height: 123.h,
                                  width: 155.w,
                                ),
                                Text(
                                  'STRIP NEURODEX 10 TABLET',
                                  style: GoogleFonts.khula(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Per Strip',
                                  style: GoogleFonts.khula(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textDisabled,
                                  ),
                                ),
                                SizedBox(height: 25.h),
                                Text(
                                  'Start from',
                                  style: GoogleFonts.khula(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textDisabled,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$2,00',
                                      style: GoogleFonts.khula(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textBtn,
                                      ),
                                    ),
                                    SizedBox(width: 5.w,),
                                    SizedBox(
                                      width: 90.w,
                                      height: 32.h,
                                      child: ElevatedButton(

                                        child: Text(
                                          'Add',
                                          style: GoogleFonts.khula(fontSize: 16),
                                        ),
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: AppColors.btnPrimary,
                                          elevation: 0.0,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24),
                                            side: BorderSide(
                                              color: AppColors.btnPrimary,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                //Recently viewed
                Padding(
                  padding:  EdgeInsets.only(top: 8.h,bottom: 16.h,right: 28.w,left: 28.w),
                  child: SizedBox(
                    width: 372.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recently Viewed',
                          style: GoogleFonts.khula(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Text(
                          'See all',
                          style: GoogleFonts.khula(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.bgPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 24.w,right: 12.w,bottom: 24.h),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(width: 1,color: AppColors.borderBtn.withOpacity(0.5))),
                          width: 185.w,
                          height: 298.h,
                          child: Padding(
                            padding: const EdgeInsets.all(11),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/health_shop/productone.png',
                                  height: 123.h,
                                  width: 155.w,
                                ),
                                Text(
                                  'Promag 10 Tablets',
                                  style: GoogleFonts.khula(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Per Strip',
                                  style: GoogleFonts.khula(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textDisabled,
                                  ),
                                ),
                                SizedBox(height: 34.h),
                                Text(
                                  'Start from',
                                  style: GoogleFonts.khula(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textDisabled,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$2,00',
                                      style: GoogleFonts.khula(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textBtn,
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    SizedBox(
                                      width: 90.w,
                                      height: 32.h,
                                      child: ElevatedButton(

                                        child: Text(
                                          'Add',
                                          style: GoogleFonts.khula(fontSize: 16),
                                        ),
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: AppColors.btnPrimary,
                                          elevation: 0.0,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24),
                                            side: BorderSide(
                                              color: AppColors.btnPrimary,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 12.w,bottom: 24.h),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(width: 1,color: AppColors.borderBtn.withOpacity(0.5))),
                          width: 185.w,
                          height: 298.h,
                          child: Padding(
                            padding:  EdgeInsets.only(right: 11.w,left: 11.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/health_shop/productsec.png',
                                  height: 123.h,
                                  width: 155.w,
                                ),
                                Text(
                                  'STRIP NEURODEX 10 TABLET',
                                  style: GoogleFonts.khula(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Per Strip',
                                  style: GoogleFonts.khula(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textDisabled,
                                  ),
                                ),
                                SizedBox(height: 25.h),
                                Text(
                                  'Start from',
                                  style: GoogleFonts.khula(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textDisabled,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$2,00',
                                      style: GoogleFonts.khula(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textBtn,
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    SizedBox(
                                      width: 90.w,
                                      height: 32.h,
                                      child: ElevatedButton(

                                        child: Text(
                                          'Add',
                                          style: GoogleFonts.khula(fontSize: 16),
                                        ),
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: AppColors.btnPrimary,
                                          elevation: 0.0,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24),
                                            side: BorderSide(
                                              color: AppColors.btnPrimary,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 12.w,bottom: 24.h),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(width: 1,color: AppColors.borderBtn.withOpacity(0.5))),
                          width: 185.w,
                          height: 298.h,
                          child: Padding(
                            padding:  EdgeInsets.only(right: 11.w,left: 11.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/health_shop/productsec.png',
                                  height: 123.h,
                                  width: 155.w,
                                ),
                                Text(
                                  'STRIP NEURODEX 10 TABLET',
                                  style: GoogleFonts.khula(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Per Strip',
                                  style: GoogleFonts.khula(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textDisabled,
                                  ),
                                ),
                                SizedBox(height: 25.h),
                                Text(
                                  'Start from',
                                  style: GoogleFonts.khula(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textDisabled,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$2,00',
                                      style: GoogleFonts.khula(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textBtn,
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    SizedBox(
                                      width: 90.w,
                                      height: 32.h,
                                      child: ElevatedButton(

                                        child: Text(
                                          'Add',
                                          style: GoogleFonts.khula(fontSize: 16),
                                        ),
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: AppColors.btnPrimary,
                                          elevation: 0.0,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24),
                                            side: BorderSide(
                                              color: AppColors.btnPrimary,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8,right: 28,left: 28),
                  child: SizedBox(
                    width: 372,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Layanan Kesehatan',
                          style: GoogleFonts.khula(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w,bottom: 50.h,top: 16.h),
                      child: Container(
                        height: 178.h,
                        width: 405.w,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            HealthProductCard(
                              imagePath:
                              'assets/images/Selling Product/Vaccine.png',
                              productName: 'Vaccine',
                            ),
                            SizedBox(width: 10.w),
                            HealthProductCard(
                              imagePath:
                              'assets/images/Selling Product/Braces.png',
                              productName: 'Braces',
                            ),
                            SizedBox(width: 10.w),
                            HealthProductCard(
                              imagePath:
                              'assets/images/Selling Product/Wheelchair.png',
                              productName: 'Wheelchair',
                            ),
                            SizedBox(width: 10.w),
                            HealthProductCard(
                              imagePath: 'assets/images/Selling Product/Mask.png',
                              productName: 'Mask',
                            ),
                            SizedBox(width: 10.w),
                            HealthProductCard(
                              imagePath:
                              'assets/images/Selling Product/Braces.png',
                              productName: 'Braces',
                            ),
                            SizedBox(width: 10.w),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),


          ),
        ),

      ),
    );

  }
}
class CustomButton extends StatelessWidget {
  final String text;

  CustomButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 40,
        width: 90,

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6), // Rounded corners
              side: BorderSide(
                color: AppColors.borderBtn,
                width: 1,
              ), // Border color
            ),
            elevation: 0.0,
          ),
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0,),
            child: Text(text, textAlign: TextAlign.center, style: GoogleFonts.khula(fontSize: 14,color: AppColors.borderDisabled,fontWeight: FontWeight.w400)),
          ),
        ),
      ),
    );
  }
}
class CustomButton2 extends StatelessWidget {
  final String text;

  CustomButton2({required this.text});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 40,
        width: 210,

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6), // Rounded corners
              side: BorderSide(
                color: AppColors.borderBtn,
                width: 1,
              ), // Border color
            ),
            elevation: 0.0,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShoppingFilterScreen()),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, ),
            child: Text(text,textAlign: TextAlign.center, style: GoogleFonts.khula(fontSize: 14, fontWeight: FontWeight.w400,color: AppColors.borderDisabled)),
          ),
        ),
      ),
    );
  }
}

