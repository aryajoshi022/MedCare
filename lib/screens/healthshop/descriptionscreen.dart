import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/constants/colors.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
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
                Row(
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
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/share_icon.png',
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
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

                Text(
                  'Benifits',
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
                SizedBox(height: 32),
                Text(
                  'Review',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [Column()]),
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

class MedicationDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Medication Name'),
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
            Center(child: Text('Description Content')),
            // Details Tab
            DetailsTab(),
            // Reviews Tab
            Center(child: Text('Reviews Content')),
          ],
        ),
      ),
    );
  }
}

class DetailsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Active Ingredients:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '• Acetaminophen (500 mg)\n',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: '• Ibuprofen (200 mg)\n',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: '• Caffeine (50 mg)\n',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Dosage Information:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            '• Adults: Take 1 tablet every 4 to 6 hours as needed. '
            'Do not exceed 4 tablets in 24 hours.\n'
            '• Children (ages 6-12): Take half a tablet every 4 to 6 hours as needed. '
            'Do not exceed 2 tablets in 24 hours.\n'
            '• Children under 6 years: Consult a healthcare professional before use.',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 16),
          Text(
            'Storage Information:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'For optimal potency and safety, it is recommended to store this medication '
            'in a cool, dry place, away from direct sunlight. '
            'Exposure to excessive heat or moisture may compromise the quality of the product.',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
