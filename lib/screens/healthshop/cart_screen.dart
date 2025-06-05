import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/util/constants/colors.dart';

import '../home/home_screen.dart';

void main() {
  runApp(CartApp());
}

class CartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CartScreen(), debugShowCheckedModeBanner: false);
  }
}

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController couponController = TextEditingController(
    text: "2024CODE",
  );
  bool _isExpanded = true;

  final List<Map<String, String>> _cartItems = [
    {
      'image': 'assets/images/health_shop/Bufectstrip_img.png',
      'title': 'Bufect Strip of 4 Tablets -Heat and Pain',
      'description': 'Per Strip',
      'price': '\$2.00',
    },
    {
      'image': 'assets/images/health_shop/productsec.png',
      'title': 'STRIP NEURODEX 10 TABLET',
      'description': 'Per Strip',
      'price': '\$2.00',
    },
    {
      'image': 'assets/images/health_shop/Bufectstrip_img.png',
      'title': 'Bufect Strip of 4 Tablets -Heat and Pain',
      'description': 'Per Strip',
      'price': '\$2.00',
    },
  ];

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
        backgroundColor: AppColors.bgAlert,
        appBar: AppBar(
          centerTitle: true,
          scrolledUnderElevation: 0.0,
          backgroundColor: AppColors.bgAlert,
          leading: IconButton(
            icon: Icon(Icons.chevron_left, color: AppColors.textSecondary),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Cart',
            textAlign: TextAlign.center,
            style: GoogleFonts.khula(
              fontSize: 16.sp,
              wordSpacing: 1,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding:  EdgeInsets.all(16.0.w),
          child: Container(
            decoration: BoxDecoration(
              color: _isExpanded ? Colors.white : null,
              image:
                  _isExpanded
                      ? null
                      : DecorationImage(
                        alignment: Alignment.center,
                        image: AssetImage(
                          "assets/images/health_shop/empty_cart_full.png",
                        ),

                        //fit: BoxFit.fill,
                      ),

              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [],
            ),
            padding:  EdgeInsets.all(16.w),
            child: Column(
              children: [
                Divider(
                  height: 1.h,
                  color: AppColors.borderBtn,
                ),
                SizedBox(height: 8.h,),
                // Dropdown header
                Padding(
                  padding:  EdgeInsets.only(top: 4.h,bottom: 4.h),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/images/health_shop/girl_cart_img.png',
                          ), // Replace with actual image
                        ),
                        SizedBox(width: 10.w),
                        Text('Delivery to Amy'),
                        Spacer(),
                        Text(
                          'Milan, Italy',
                          style: GoogleFonts.khula(color: AppColors.textBtn),
                        ),
                        Icon(
                          _isExpanded ? Icons.expand_more : Icons.chevron_right,
                          color: AppColors.textBtn,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8.h,),
                Divider(
                  height: 1.h,
                  color: AppColors.borderBtn,
                ),

                // Expanded content
                if (_isExpanded) ...[
                  SizedBox(height: 20.h),
                  ..._cartItems.map(
                    (item) => _cartItem(
                      imagePath: item['image']!,
                      title: item['title']!,
                      description: item['description']!,
                      price: item['price']!,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Have a coupon code? enter here'),
                  ),
                  SizedBox(height: 8.h),
                  TextField(
                    controller: couponController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.check_circle,
                        color: AppColors.textBtn,
                      ),
                      suffixText: 'Available',
                      suffixStyle: GoogleFonts.khula(color: AppColors.textBtn),
                      border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.borderThirsty)),
                    ),
                  ),
                  SizedBox(height: 110.h),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FindPharmacyScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.textBtn,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: GoogleFonts.khula(
                        fontSize: 16.sp,
                        color: AppColors.textWhite,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _cartItem({
    required String imagePath,
    required String title,
    required String price,
    required String description,
  }) {
    return Card(
      elevation: 0,
      color: AppColors.bgAlert,
      shape: RoundedRectangleBorder(side: BorderSide(color: AppColors.borderBtn),borderRadius: BorderRadius.circular(10.r)),

      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Row(
          children: [
            Image.asset(imagePath, width: 60.w),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),
                  SizedBox(height: 5.h),
                  Text(
                    description,
                    style: GoogleFonts.khula(fontSize: 13.sp, color: Colors.black54),
                  ),
                  Text(
                    'Start form: $price',
                    style: GoogleFonts.khula(color: AppColors.textBtn),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: 28.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.bgPrimary),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(Icons.remove, size: 16, color: AppColors.bgPrimary),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('1'),
                ),
                Container(
                  width: 28.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.bgPrimary),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(Icons.add, size: 16, color: AppColors.bgPrimary),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//Find Pharmacy Screen
class FindPharmacyScreen extends StatelessWidget {
  const FindPharmacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/images/health_shop/pharmacy_cart.png'),
            ),
            SizedBox(height: 24.h),
            Text(
              'Finding Nearest Pharmacy...',
              style: GoogleFonts.khula(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textNormal,
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    color: AppColors.textSecondary,
                  ),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Text(
                      'Pricing, product availability, and shipping methods may differ.',
                      style: GoogleFonts.khula(
                        color: AppColors.textSecondary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    color: AppColors.textSecondary,
                  ),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Text(
                      'Select the delivery method that fits your requirements. Same-Day Delivery and Next-Day Delivery',
                      style: GoogleFonts.khula(
                        color: AppColors.textSecondary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
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
}
