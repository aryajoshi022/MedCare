import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medcare/screens/healthshop/cart_screen.dart';
import 'package:medcare/util/constants/colors.dart';

class MedicationDetailsScreen extends StatelessWidget {
  @override
  //ShowBottomSheet
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
                Image.asset(
                  'assets/images/health_shop/Bufectstrip_img.png',
                  height: 80,
                ),
                const Text(
                  'Bufect Strip 4 tablets',
                  style: TextStyle(fontSize: 18),
                ),
                const Text('Per Strip'),
                const SizedBox(height: 8),
                const Text(
                  'Start from: \$2.00',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
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
                    Text(
                      quantity.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => setState(() => quantity++),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: AppColors.bgPrimary,
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(color: AppColors.textWhite),
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: AppColors.bgAlert,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.chevron_left, color: AppColors.textSecondary),
          ),
          title: Text(
            'Bufect Strip of 4 Tablets -Heat \nand Pain Relief Medicine',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Image.asset(
                'assets/icons/share_icon.png',
                color: AppColors.textSecondary,
              ),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Description'),
              Tab(text: 'Details'),
              Tab(text: 'Reviews'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Description Tab
            DescriptionTab(),
            //Details Tab
            DetailsTab(),

            //Reviews Tab
            ReviewsTab(),
          ],
        ),      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          right: 10,
          left: 10,
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.transparent),

          width: 380,
          height: 51,
          child: ElevatedButton(
            child: Text('Add to cart', style: TextStyle(fontSize: 16)),
            onPressed: () {
              showBottomSheet(context);
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.textWhite,
              backgroundColor: AppColors.btnPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ),
      ),

      ),
    );
  }
}

//Description Tab
class DescriptionTab extends StatelessWidget {
  const DescriptionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.h),
                SizedBox(
                  width: 372.w,
                  height: 230.h,

                  child: Image.asset(
                    'assets/images/health_shop/Bufectstrip_img.png',
                  ),
                ),
                SizedBox(height: 32.h),
                Text(
                  'Bufect Strip of 4 Tablets -Heat and Pain Relief Medicine',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textNormal,
                  ),
                ),
                Text(
                  'Per Stripe',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  'Start from',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textDisabled,
                  ),
                ),
                Text(
                  '\$2,00',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBtn,
                  ),
                ),
                SizedBox(height: 64),

                //Product description
                Text(
                  'Product Description',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),
                Text(
                  'Bufect is a reliable and effective medication presented in a convenient strip containing four tablets. Each tablet is meticulously formulated to provide targeted relief from various ailments. With its user-friendly packaging and easy-to-carry design, Bufect ensures quick access to relief whenever and wherever needed. Trust Bufect for fast-acting and dependable relief from discomfort.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 32),

                //Benefits
                Text(
                  'Benefits',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),

                Row(
                  children: [
                    Image.asset('assets/icons/dot_img.png'),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        '\nProvides fast and effective relief from pain and discomfort',
                        style: TextStyle(
                          color: AppColors.textNormal,
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/icons/dot_img.png'),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        '\n\nSuitable for a wide range of ailments, including headaches, muscle aches, fever, and menstrual cramps',
                        style: TextStyle(
                          color: AppColors.textNormal,
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/icons/dot_img.png'),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        '\nEach tablet is individually sealed for freshness and potency.',
                        style: TextStyle(
                          color: AppColors.textNormal,
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Text(
                  'Composition',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),

                _buildBulletPoint('Acetaminophen (500 mg)'),
                _buildBulletPoint('Ibuprofen (200 mg)'),
                _buildBulletPoint('Caffeine (50 mg)'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/icons/dot_img.png'),
        SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.textNormal,
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

//Details Tab
class DetailsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Composition',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),

                _buildBulletPoint('Acetaminophen (500 mg)'),
                _buildBulletPoint('Ibuprofen (200 mg)'),
                _buildBulletPoint('Caffeine (50 mg)'),

                SizedBox(height: 32),

                Text(
                  'Dosage',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),

                Row(
                  children: [
                    Image.asset('assets/icons/dot_img.png'),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        '\n\nAdults: Take 1 tablet every 4 to 6 hours as needed. Do not exceed 4 tablets in 24 hours.',
                        style: TextStyle(
                          color: AppColors.textNormal,
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/icons/dot_img.png'),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        '\n\nChildren (ages 6-12): Take half a tablet every 4 to 6 hours as needed. Do not exceed 2 tablets in 24 hours',
                        style: TextStyle(
                          color: AppColors.textNormal,
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/icons/dot_img.png'),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        '\nChildren under 6 years: Consult a healthcare professional before us',
                        style: TextStyle(
                          color: AppColors.textNormal,
                          height: 1.5,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Text(
                  'Storage Instructions',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'For optimal potency and safety, it is recommended to store this medication in a cool, dry place, away from direct sunlight. Exposure to excessive heat or moisture may compromise the quality of the product.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textNormal,
                  ),
                ),

                SizedBox(height: 32),
                Text(
                  'Storage Instructions',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'For optimal potency and safety, it is recommended to store this medication in a cool, dry place, away from direct sunlight. Exposure to excessive heat or moisture may compromise the quality of the product. Additionally, it is important to keep this medication out of reach of children and pets to prevent accidental ingestion and ensure their safety',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textNormal,
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  'Special Precautions',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),
                Row(
                  children: [
                    Image.asset('assets/icons/dot_img.png'),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        '\nDo not exceed the recommended dosage.',
                        style: TextStyle(
                          color: AppColors.textNormal,
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/icons/dot_img.png'),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        '\n\nConsult a healthcare professional before use if pregnant, breastfeeding, or taking other medications',
                        style: TextStyle(
                          color: AppColors.textNormal,
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/icons/dot_img.png'),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        '\nDiscontinue use and seek medical advice if adverse reactions occur.',
                        style: TextStyle(
                          color: AppColors.textNormal,
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
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

  Widget _buildBulletPoint(String text) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/icons/dot_img.png'),
        SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.textNormal,
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

//Reviews Tab

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                const Text(
                  'Special Precautions',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),
                Row(
                  children: [
                    Image.asset('assets/icons/dot_img.png'),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        '\nDo not exceed the recommended dosage.',
                        style: TextStyle(
                          color: AppColors.textNormal,
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/icons/dot_img.png'),
                    const SizedBox(width: 5),
                    const Expanded(
                      child: Text(
                        '\n\nConsult a healthcare professional before use if pregnant, breastfeeding, or taking other medications',
                        style: TextStyle(
                          color: AppColors.textNormal,
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/icons/dot_img.png'),
                    const SizedBox(width: 5),
                    const Expanded(
                      child: Text(
                        '\nDiscontinue use and seek medical advice if adverse reactions occur.',
                        style: TextStyle(
                          color: AppColors.textNormal,
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const Text(
                  'Review',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,

                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    'assets/images/health_shop/girl_review.jpg',
                                    height: 56,
                                    width: 56,
                                  ),
                                  borderRadius: BorderRadius.circular(48),
                                ),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Emily johnson',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        wordSpacing: 1.5,
                                      ),
                                    ),
                                    SizedBox(height: 13),
                                    Text(
                                      '1 day ago',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                    SizedBox(height: 13),

                                    Image.asset('assets/icons/star_icon.png'),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'My consultation with Dr. Luca Rossi\n was excellent. He`s knowledgeable,\n attentive, and provid...',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'More view',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textBtn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,

                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    'assets/images/health_shop/boy_review.jpg',
                                    height: 56,
                                    width: 56,
                                  ),
                                  borderRadius: BorderRadius.circular(48),
                                ),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Daniel Anderson',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        wordSpacing: 1.5,
                                      ),
                                    ),
                                    SizedBox(height: 13),
                                    Text(
                                      '1 day ago',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                    SizedBox(height: 13),

                                    Image.asset('assets/icons/star_icon.png'),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'My consultation with Dr. Luca Rossi\n was excellent. He`s knowledgeable,\n attentive, and provid...',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'More view',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textBtn,
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
                SizedBox(height: 32),

                //Related Products
                Text(
                  'Related products',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),
                SizedBox(height: 16),

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
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
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
                    ],
                  ),
                ),
                SizedBox(height: 33),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
