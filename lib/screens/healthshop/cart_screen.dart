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

        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: AppColors.textSecondary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: SafeArea(
          child: Column(
            children: [
              Divider(color: AppColors.borderBtn, height: 1),
              SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(28),
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
                  Spacer(),
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
              SizedBox(height: 16),
              Divider(color: AppColors.borderBtn, height: 1),
              SizedBox(height: 24),
              SizedBox(height: 124, child: _cartdata()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cartdata() {
    return Scaffold(
      body: Container(
        height: 100,
        width: 372,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderBtn),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/health_shop/Bufectstrip_img.png',
                  height: 72,
                  width: 68,
                ),
              ],
            ),
            Expanded(
              child: Text(
                'Bufect Strip of 4 Tablets -Heat and Pain Relief Medicine',
                style: TextStyle(
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Column(
              children: [
                Text('Per Strip',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.borderThirsty),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
