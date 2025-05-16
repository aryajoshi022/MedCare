import 'package:flutter/material.dart';
import 'package:medcare/util/constants/colors.dart';

void main() {
  runApp(CartApp());
}

class CartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CartScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController couponController = TextEditingController(text: "2024CODE");
  bool _isExpanded = false;

  final List<Map<String, String>> _cartItems = [
    {
      'image': 'assets/images/health_shop/Bufectstrip_img.png',
      'title': 'Bufect Strip of 4 Tablets -Heat and Pain',
      'desc':"2 per Strips",
      'price': '\$2.00'
    },
    {
      'image': 'assets/images/health_shop/Bufectstrip_img.png',
      'title': 'STRIP NEURODEX 10 TABLET',
      'desc':'2per Stripe',
      'price': '\$2.00'
    },
    {
      'image': 'assets/images/health_shop/Bufectstrip_img.png',
      'title': 'Bufect Strip of 4 Tablets -Heat and Pain',
      'desc':'2per Stripe',
      'price': '\$2.00'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Cart',textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, wordSpacing: 1,fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: _isExpanded ? Colors.white : Colors.white,

              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                // Dropdown header
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/health_shop/girl_cart_img.png'), // Replace with actual image
                      ),
                      SizedBox(width: 10),
                      Text('Delivery to Amy'),
                      Spacer(),
                      Text('Milan, Italy', style: TextStyle(color: AppColors.textBtn)),
                      Icon(
                        _isExpanded ? Icons.expand_more : Icons.chevron_right,
                        color: AppColors.textBtn,
                      ),
                    ],
                  ),
                ),

                // Expanded content
                if (_isExpanded) ...[
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  ..._cartItems.map((item) => _cartItem(
                    imagePath: item['image']!,
                    title: item['title']!,
                    desc:item['desc']!,
                    price: item['price']!,
                  )),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Have a coupon code? enter here'),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: couponController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.check_circle, color: AppColors.textBtn),
                      suffixText: 'Available',
                      suffixStyle: TextStyle(color: AppColors.textBtn),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 140),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FindPharmacyScreen(),));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.textBtn,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Continue', style: TextStyle(fontSize: 16,color: AppColors.textWhite)),
                  ),
                ],
                SizedBox(height: 180,),
                Image.asset('assets/images/health_shop/empty_cart.png'),
                Text('Oops! Your shopping cart is still empty',style: TextStyle(color: AppColors.textSecondary,fontSize: 14,fontWeight: FontWeight.w400),)

              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget _cartItem({required String imagePath, required String title, required String price, required String desc}) {
    return Card(elevation: 0,
      color: AppColors.bgAlert,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(imagePath, width: 60),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),
                  SizedBox(height: 5),
                  Text('Start form: $price', style: TextStyle(color: AppColors.textBtn)),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(icon: Icon(Icons.remove), onPressed: () {}),
                Text('1'),
                IconButton(icon: Icon(Icons.add), onPressed: () {}),
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
      body: SafeArea(child:
      Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/health_shop/pharmacy_cart.png'))
        ],
      )),
    );
  }
}
