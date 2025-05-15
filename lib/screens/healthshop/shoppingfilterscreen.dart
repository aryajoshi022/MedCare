import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/healthshop/descriptionscreen.dart';

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
          builder: (context, setState) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/health_shop/productone.png', height: 80),
                const Text('Promag 10 Tablets', style: TextStyle(fontSize: 18)),
                const Text('Per Strip'),
                const SizedBox(height: 8),
                const Text('Start from: \$2.00', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() => quantity--);
                        }
                      },
                    ),
                    Text(quantity.toString(), style: const TextStyle(fontSize: 16)),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => setState(() => quantity++),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: AppColors.bgPrimary,
                  ),
                  child: const Text('Add to Cart',style: TextStyle(color: AppColors.textWhite),),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppBar
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

            //Vertical Products
            Row(mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Column(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Container(
                        width: 178.w,
                        height: 298.h,
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
                                    onPressed: () {showBottomSheet(context);},
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
                      padding: const EdgeInsets.all(14),
                      child: Container(
                        width: 178.w,
                        height: 298.h,
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
                      padding: const EdgeInsets.all(14),
                      child: Container(
                        width: 178.w,
                        height: 298.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/health_shop/Mylantastrip_img.png',
                            ),
                            Text(
                              'Mylanta Strip ',
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
                Column(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Container(
                        width: 178.w,
                        height: 298.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/health_shop/Bufectstrip_img.png',
                            ),
                            Text(
                              'Bufect Strip',
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
                                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => DescriptionScreen(),));},
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
                      padding: const EdgeInsets.all(14),
                      child: Container(
                        width: 178.w,
                        height: 298.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/health_shop/BODREX_img.png',
                            ),
                            Text(
                              'BODREX MEDICINE 10S PER STRIP',
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
                      padding: const EdgeInsets.all(14),
                      child: Container(
                        width: 178.w,
                        height: 298.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/health_shop/Paratusin_img.png',
                            ),
                            Text(
                              'Paratusin 10 Tablets',
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

              ],
            ),


          ],
        ),
      )),
    );
  }
}
