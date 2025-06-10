import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/healthshop/descriptionsreen.dart';
import '../../util/constants/colors.dart';
import '../../widgets/health shop/scroller.dart';
import 'cart_screen.dart';

class ShoppingFilterScreen extends StatefulWidget {
  const ShoppingFilterScreen({super.key});

  @override
  State<ShoppingFilterScreen> createState() => _ShoppingFilterScreenState();
}

class _ShoppingFilterScreenState extends State<ShoppingFilterScreen> {
  @override
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        int quantity = 1;
        return StatefulBuilder(
          builder:
              (context, setState) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 1,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/health_shop/productone.png',
                            height: 100,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Promag 10 Tablets',
                                  style: GoogleFonts.khula(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Per Strip',
                                  style: GoogleFonts.khula(
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      'Start form :',
                                      style: GoogleFonts.khula(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.borderDisabled,
                                      ),
                                    ),
                                    Text(
                                      '\$2.00',
                                      style: GoogleFonts.khula(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.bgPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (quantity > 1) {
                                          setState(() => quantity--);
                                        }
                                      },
                                      child: Container(
                                        width: 28,
                                        height: 28,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.bgPrimary,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          size: 16,
                                          color: AppColors.bgPrimary,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                      ),
                                      child: Text(
                                        quantity.toString(),
                                        style: GoogleFonts.khula(fontSize: 16),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => setState(() => quantity++),
                                      child: Container(
                                        width: 28,
                                        height: 28,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.bgPrimary,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: 16,
                                          color: AppColors.bgPrimary,
                                        ),
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
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: AppColors.bgPrimary,
                      ),
                      child: Text(
                        'Add to Cart',
                        style: GoogleFonts.khula(
                          fontSize: 16,
                          color: AppColors.textWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppBar
              Padding(
                padding: EdgeInsets.only(top: 24.h, right: 20.w, bottom: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 8.w),

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
                            ), // Border color
                          ),
                          child: Image.asset('assets/icons/shop_filter.png'),
                          backgroundColor: AppColors.bgAlert,
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton2(text: 'Medicine & Treatment'),
                          SizedBox(width: 10), // Space between buttons
                          CustomButton(text: 'Milk'),
                          SizedBox(width: 10), // Space between buttons
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
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              'Sexual Health',

                              style: GoogleFonts.khula(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.borderDisabled,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              //Vertical Products
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 28.w,
                          right: 16.w,
                          bottom: 16.h,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.bgAlert,

                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 1,
                              color: AppColors.borderBtn.withOpacity(0.5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(
                                  0x0D000000,
                                ),
                                offset: Offset(2, 2),
                                blurRadius: 10,
                                spreadRadius: 0,
                              ),
                            ],

                          ),
                          width: 178.w,
                          height: 270.h,
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.h,bottom: 12.h,left: 12.w,right: 11.w),
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
                                Spacer(),
                                Text(
                                  'Start from',
                                  style: GoogleFonts.khula(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textDisabled,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    SizedBox(width: 5),
                                    SizedBox(
                                      width: 90.w,
                                      height: 32.h,
                                      child: ElevatedButton(
                                        child: Text(
                                          'Add',
                                          style: GoogleFonts.khula(
                                            fontSize: 16,
                                          ),
                                        ),
                                        onPressed: () {
                                          showBottomSheet(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: AppColors.btnPrimary,
                                          elevation: 0.0,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              24,
                                            ),
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
                        padding: EdgeInsets.only(
                          left: 28.w,
                          right: 16.w,
                          bottom: 16.h,
                        ),
                        child: Container(

                          decoration: BoxDecoration(
                            color: AppColors.bgAlert,

                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 1,
                              color: AppColors.borderBtn.withOpacity(0.5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(
                                  0x0D000000,
                                ),
                                offset: Offset(2, 2),
                                blurRadius: 10,
                                spreadRadius: 0,
                              ),
                            ],

                          ),
                          width: 178.w,
                          height: 270.h,
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.h,bottom: 12.h,left: 12.w,right: 11.w),
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
                                Spacer(),
                                Text(
                                  'Start from',
                                  style: GoogleFonts.khula(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textDisabled,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    SizedBox(width: 5),
                                    SizedBox(
                                      width: 90.w,
                                      height: 32.h,
                                      child: ElevatedButton(
                                        child: Text(
                                          'Add',
                                          style: GoogleFonts.khula(
                                            fontSize: 16,
                                          ),
                                        ),
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: AppColors.btnPrimary,
                                          elevation: 0.0,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              24,
                                            ),
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
                        padding: EdgeInsets.only(
                          left: 28.w,
                          right: 16.w,
                          bottom: 16.h,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.bgAlert,

                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 1,
                              color: AppColors.borderBtn.withOpacity(0.5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(
                                  0x0D000000,
                                ),
                                offset: Offset(2, 2),
                                blurRadius: 10,
                                spreadRadius: 0,
                              ),
                            ],

                          ),

                          width: 178.w,
                          height: 270.h,
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.h,bottom: 12.h,left: 12.w,right: 11.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/health_shop/Mylantastrip_img.png',
                                  height: 123.h,
                                  width: 155.w,
                                ),
                                Text(
                                  'Mylanta Strip',
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
                                Spacer(),
                                Text(
                                  'Start from',
                                  style: GoogleFonts.khula(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textDisabled,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    SizedBox(width: 5.w),
                                    SizedBox(
                                      width: 90.w,
                                      height: 32.h,
                                      child: ElevatedButton(
                                        child: Text(
                                          'Add',
                                          style: GoogleFonts.khula(
                                            fontSize: 16,
                                          ),
                                        ),
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: AppColors.btnPrimary,
                                          elevation: 0.0,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              24,
                                            ),
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
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 28.w, bottom: 16.w),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.bgAlert,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 1,
                              color: AppColors.borderBtn.withOpacity(0.5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(
                                  0x0D000000,
                                ),
                                offset: Offset(2, 2),
                                blurRadius: 10,
                                spreadRadius: 0,
                              ),
                            ],

                          ),
                          width: 178.w,
                          height: 270.h,
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.h,bottom: 12.h,left: 12.w,right: 11.w),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                        DescriptionScreen(),
                                  ),
                                );

                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/health_shop/Bufectstrip_img.png',
                                    height: 123.h,
                                    width: 155.w,
                                  ),
                                  Text(
                                    'Bufect Strip',
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
                                  Spacer(),
                                  Text(
                                    'Start from',
                                    style: GoogleFonts.khula(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textDisabled,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                      SizedBox(width: 5),
                                      SizedBox(
                                        width: 90.w,
                                        height: 32.h,
                                        child: ElevatedButton(
                                          child: Text(
                                            'Add',
                                            style: GoogleFonts.khula(
                                              fontSize: 16,
                                            ),
                                          ),
                                          onPressed: () {
                                          },

                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: AppColors.btnPrimary,
                                            elevation: 0.0,
                                            backgroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                24,
                                              ),
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
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 28.w, bottom: 16.w),

                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.bgAlert,

                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 1,
                              color: AppColors.borderBtn.withOpacity(0.5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(
                                  0x0D000000,
                                ),
                                offset: Offset(2, 2),
                                blurRadius: 10,
                                spreadRadius: 0,
                              ),
                            ],

                          ),
                          width: 178.w,
                          height: 270.h,
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.h,bottom: 12.h,left: 12.w,right: 11.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/health_shop/BODREX_img.png',
                                  height: 123.h,
                                  width: 155.w,
                                ),
                                Text(
                                  'BODREX MEDICINE 10S PER STRIP',
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
                                Spacer(),
                                Text(
                                  'Start from',
                                  style: GoogleFonts.khula(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textDisabled,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    SizedBox(width: 5.w),
                                    SizedBox(
                                      width: 90.w,
                                      height: 32.h,
                                      child: ElevatedButton(
                                        child: Text(
                                          'Add',
                                          style: GoogleFonts.khula(
                                            fontSize: 16,
                                          ),
                                        ),
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: AppColors.btnPrimary,
                                          elevation: 0.0,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              24,
                                            ),
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
                        padding: EdgeInsets.only(right: 28.w, bottom: 16.w),
                        child: Container(

                          decoration: BoxDecoration(
                            color: AppColors.bgAlert,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 1,
                              color: AppColors.borderBtn.withOpacity(0.5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(
                                  0x0D000000,
                                ),
                                offset: Offset(2, 2),
                                blurRadius: 10,
                                spreadRadius: 0,
                              ),
                            ],

                          ),
                          width: 178.w,
                          height: 270.h,
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.h,bottom: 12.h,left: 12.w,right: 11.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/health_shop/Paratusin_img.png',
                                  height: 123.h,
                                  width: 155.w,
                                ),
                                Text(
                                  'Paratusin 10 Tablets',
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
                                Spacer(),
                                Text(
                                  'Start from',
                                  style: GoogleFonts.khula(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textDisabled,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    SizedBox(width: 5),
                                    SizedBox(
                                      width: 90.w,
                                      height: 32.h,
                                      child: ElevatedButton(
                                        child: Text(
                                          'Add',
                                          style: GoogleFonts.khula(
                                            fontSize: 16,
                                          ),
                                        ),
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: AppColors.btnPrimary,
                                          elevation: 0.0,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              24,
                                            ),
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
                ],
              ),
            ],
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
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              text,
              style: GoogleFonts.khula(
                fontSize: 14,
                color: AppColors.borderDisabled,
                fontWeight: FontWeight.w400,
              ),
            ),
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
                color: AppColors.bgPrimary,
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
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              text,
              style: GoogleFonts.khula(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.bgPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
