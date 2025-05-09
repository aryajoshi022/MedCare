import 'package:flutter/material.dart';

import '../../util/constants/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: AppColors.bgAlert,

        leading: Icon(Icons.chevron_left, color: AppColors.textSecondary),
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Divider(color: AppColors.borderBtn, height: 1),
            SizedBox(height: 16,),
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(48),
                  child: Image.asset(
                    'assets/images/health_shop/girl_cart_img.png',
                    height: 36,
                    width: 36,
                  ),
                ),
                Text(
                  'Delivery to Amy',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                Text(
                  'Milan, Italy',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.bgPrimary,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: AppColors.bgPrimary),
              ],
            ),
            SizedBox(height: 16,),
            Divider(color: AppColors.borderBtn, height: 1),
            SizedBox(height: 24,),

          ],
        ),
      ),
    );
  }
}
