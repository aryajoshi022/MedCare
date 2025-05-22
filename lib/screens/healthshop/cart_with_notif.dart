import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/healthshop/cart_screen.dart';
import 'package:medcare/screens/healthshop/shoppingfilterscreen.dart';
import 'package:medcare/util/constants/colors.dart';
import 'package:medcare/widgets/health%20shop/health_product_card.dart';

class CartWithNotif extends StatefulWidget {
  const CartWithNotif({super.key});

  @override
  State<CartWithNotif> createState() => _CartWithNotifState();
}

class _CartWithNotifState extends State<CartWithNotif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      //backgroundColor: AppColors.bgAlert,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //Appbar
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                      width: 318.w,
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
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
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
                          CustomButton2(text: 'Medicine & Treatment'),
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
                              ),elevation: 0.0
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

              //Scroller
              SizedBox(height: 20.h),

              //Out Brands
              Container(
                width: 500.w,
                height: 280.h,
                //decoration: BoxDecoration(),
                color: AppColors.borderThirsty,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 372,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Official store',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            Text(
                              'see all',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.bgPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Special offers from various renowned brands',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
                padding: const EdgeInsets.all(24),
                child: SizedBox(
                  width: 372,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hot Sales',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Text(
                        'see all',
                        style: TextStyle(
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
                      padding: const EdgeInsets.all(24),
                      child: Container(
                        width: 178.w,
                        height: 272.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/health_shop/productone.png',
                            ),
                            Text(
                              'Promag 10 Tablets',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Per Strip',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textDisabled,
                              ),
                            ),
                            SizedBox(height: 34),
                            Text(
                              'Start from',
                              style: TextStyle(
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
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textBtn,
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                  height: 32,
                                  child: ElevatedButton(
                                    child: Text(
                                      'Add',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: AppColors.btnPrimary,
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
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Container(
                        width: 178.w,
                        height: 272.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/health_shop/productsec.png',
                            ),
                            Text(
                              'STRIP NEURODEX 10 TABLET',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Per Strip',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textDisabled,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Start from',
                              style: TextStyle(
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
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textBtn,
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                  height: 32,
                                  child: ElevatedButton(
                                    child: Text(
                                      'Add',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: AppColors.btnPrimary,
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
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Container(
                        width: 178.w,
                        height: 272.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/health_shop/productsec.png',
                            ),
                            Text(
                              'STRIP NEURODEX 10 TABLET',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Per Strip',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textDisabled,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Start from',
                              style: TextStyle(
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
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textBtn,
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                  height: 32,
                                  child: ElevatedButton(
                                    child: Text(
                                      'Add',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: AppColors.btnPrimary,
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
                  ],
                ),
              ),

              //Recently viewed
              Padding(
                padding: const EdgeInsets.all(14),
                child: SizedBox(
                  width: 372,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recently Viewed',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Text(
                        'see all',
                        style: TextStyle(
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
                      padding: const EdgeInsets.all(24),
                      child: Container(
                        width: 178.w,
                        height: 272.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/health_shop/productone.png',
                            ),
                            Text(
                              'Promag 10 Tablets',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Per Strip',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textDisabled,
                              ),
                            ),
                            SizedBox(height: 34),
                            Text(
                              'Start from',
                              style: TextStyle(
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
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textBtn,
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                  height: 32,
                                  child: ElevatedButton(
                                    child: Text(
                                      'Add',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: AppColors.btnPrimary,
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
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Container(
                        width: 178.w,
                        height: 272.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/health_shop/productsec.png',
                            ),
                            Text(
                              'STRIP NEURODEX 10 TABLET',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Per Strip',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textDisabled,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Start from',
                              style: TextStyle(
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
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textBtn,
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                  height: 32,
                                  child: ElevatedButton(
                                    child: Text(
                                      'Add',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: AppColors.btnPrimary,
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
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Container(
                        width: 178.w,
                        height: 272.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/health_shop/productsec.png',
                            ),
                            Text(
                              'STRIP NEURODEX 10 TABLET',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Per Strip',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textDisabled,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Start from',
                              style: TextStyle(
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
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textBtn,
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                  height: 32,
                                  child: ElevatedButton(
                                    child: Text(
                                      'Add',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: AppColors.btnPrimary,
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
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(14),
                child: SizedBox(
                  width: 372,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Layanan Kesehatan',
                        style: TextStyle(
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
                    padding: const EdgeInsets.all(10),
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
                          SizedBox(width: 10),
                          HealthProductCard(
                            imagePath:
                            'assets/images/Selling Product/Braces.png',
                            productName: 'Braces',
                          ),
                          SizedBox(width: 10),
                          HealthProductCard(
                            imagePath:
                            'assets/images/Selling Product/Wheelchair.png',
                            productName: 'Wheelchair',
                          ),
                          SizedBox(width: 10),
                          HealthProductCard(
                            imagePath: 'assets/images/Selling Product/Mask.png',
                            productName: 'Mask',
                          ),
                          SizedBox(width: 10),
                          HealthProductCard(
                            imagePath:
                            'assets/images/Selling Product/Braces.png',
                            productName: 'Braces',
                          ),
                          SizedBox(width: 10),
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
        height: 50,
        width: 162,

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
              ),elevation: 0.0
          ),
          onPressed: () {
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            child: Text(text, style: TextStyle(fontSize: 16)),
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
        height: 50,
        width: 162,

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
              ),elevation: 0.0
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShoppingFilterScreen()),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            child: Text(text, style: TextStyle(fontSize: 16)),
          ),
        ),
      ),
    );
  }
}
