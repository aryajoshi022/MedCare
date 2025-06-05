import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/healthshop/cart_with_notif.dart';
import 'package:medcare/util/constants/colors.dart';


class DescriptionScreen extends StatefulWidget {
  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _descKey = GlobalKey();
  final GlobalKey _detailsKey = GlobalKey();
  final GlobalKey _reviewsKey = GlobalKey();

  bool _isTabClicked = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }
  void _handleScroll() {
    if (_isTabClicked) return;

    RenderBox? descBox = _descKey.currentContext?.findRenderObject() as RenderBox?;
    RenderBox? detailsBox = _detailsKey.currentContext?.findRenderObject() as RenderBox?;
    RenderBox? reviewsBox = _reviewsKey.currentContext?.findRenderObject() as RenderBox?;

    if (descBox == null || detailsBox == null || reviewsBox == null) return;

    final descOffset = descBox.localToGlobal(Offset.zero).dy;
    final detailsOffset = detailsBox.localToGlobal(Offset.zero).dy;
    final reviewsOffset = reviewsBox.localToGlobal(Offset.zero).dy;

    // Viewport threshold (top of screen + toolbar height)
    const double toolbarOffset = 100.0;

    // Calculate the closest section to top
    final distances = {
      0: (descOffset - toolbarOffset).abs(),
      1: (detailsOffset - toolbarOffset).abs(),
      2: (reviewsOffset - toolbarOffset).abs(),
    };

    final closestTab = distances.entries.reduce((a, b) => a.value < b.value ? a : b).key;

    if (_tabController.index != closestTab) {
      _tabController.animateTo(closestTab);
    }
  }


  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      _isTabClicked = true;
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      ).then((_) => _isTabClicked = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.bgAlert,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left, color: AppColors.textSecondary),
        ),
        title: Text(
          'Bufect Strip of 4 Tablets -Heat \nand Pain Relief Medicine',
          style: GoogleFonts.khula(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: Image.asset(
              'assets/icons/share_icon.png',
              color: AppColors.textSecondary,
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          onTap: (index) {
            if (index == 1) _scrollTo(_descKey);
            else if (index == 2) _scrollTo(_detailsKey);
            else if (index == 3) _scrollTo(_reviewsKey);
          },
          tabs: const [
            Tab(text: 'Description'),
            Tab(text: 'Details'),
            Tab(text: 'Reviews'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(key: _descKey, child: DescriptionTab()),
            Container(key: _detailsKey, child: DetailsTab()),
            Container(key: _reviewsKey, child: ReviewsTab()),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          top: 20.h,
          bottom: 20.h,
          right: 10.w,
          left: 10.w,
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.transparent),

          width: 380.w,
          height: 51.h,
          child: ElevatedButton(
            child: Text('Add to cart', style: GoogleFonts.khula(fontSize: 16.sp)),
            onPressed: () {
              showBottomSheet(context);
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.textWhite,
              backgroundColor: AppColors.btnPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
            ),
          ),
        ),
      ),
    );
  }
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
                      Image.asset('assets/images/health_shop/Bufectstrip_img.png', height: 100),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text('Bufect Strip of 4 Tablets -Heat and Pain Relief Medicine'
                                  , style: GoogleFonts.khula(fontSize: 16, fontWeight: FontWeight.w600)),
                            ),
                            Text('Per Strip', style: GoogleFonts.khula(color: Colors.black54)),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text('Start form :', style: GoogleFonts.khula(fontWeight: FontWeight.w400, color: AppColors.borderDisabled)),
                                Text('\$2.00', style: GoogleFonts.khula(fontWeight: FontWeight.w700, color: AppColors.bgPrimary)),

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
                                      border: Border.all(color: AppColors.bgPrimary),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Icon(Icons.remove, size: 16, color: AppColors.bgPrimary),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Text(quantity.toString(), style: GoogleFonts.khula(fontSize: 16)),
                                ),
                                GestureDetector(
                                  onTap: () => setState(() => quantity++),
                                  child: Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.bgPrimary),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Icon(Icons.add, size: 16, color: AppColors.bgPrimary),
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
                      MaterialPageRoute(
                        builder: (context) => CartWithNotif(),
                      ),
                    );                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: AppColors.bgPrimary,
                  ),
                  child: Text('Add to Cart', style: GoogleFonts.khula(fontSize: 16, color: AppColors.textWhite)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}

class DescriptionTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(24.0.w),
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
                SizedBox(height: 64.h),

                //Product description
                Text(
                  'Product Description',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),
                SizedBox(height: 5.h),

                Text(
                  'Bufect is a reliable and effective medication presented in a convenient strip containing four tablets. Each tablet is meticulously formulated to provide targeted relief from various ailments. With its user-friendly packaging and easy-to-carry design, Bufect ensures quick access to relief whenever and wherever needed. Trust Bufect for fast-acting and dependable relief from discomfort.',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 44.h),

                //Benefits
                Text(
                  'Benefits',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),
                SizedBox(height: 5.h),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Image.asset('assets/icons/dot_img.png'),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Text(
                        'Provides fast and effective relief from pain and discomfort',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Image.asset('assets/icons/dot_img.png'),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Text(
                        'Suitable for a wide range of ailments, including headaches, muscle aches, fever, and menstrual cramps',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Image.asset('assets/icons/dot_img.png'),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Each tablet is individually sealed for freshness and potency.',
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
                SizedBox(height: 44.h),

                Text(
                  'Composition',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),
                SizedBox(height: 5),

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

class DetailsTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
     child:SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(24.0.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                SizedBox(height: 20.h),

                Text(
                  'Dosage',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5, width: 5),

                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Image.asset('assets/icons/dot_img.png'),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Text(
                        'Adults: Take 1 tablet every 4 to 6 hours as needed. Do not exceed 4 tablets in 24 hours.',
                        style: TextStyle(
                          color: AppColors.textNormal,
                          fontSize: 16.sp,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Image.asset('assets/icons/dot_img.png'),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Children (ages 6-12): Take half a tablet every 4 to 6 hours as needed. Do not exceed 2 tablets in 24 hours',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Image.asset('assets/icons/dot_img.png'),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Children under 6 years: Consult a healthcare professional before us',
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
                SizedBox(height: 44.h),
                Text(
                  'Storage Instructions',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'For optimal potency and safety, it is recommended to store this medication in a cool, dry place, away from direct sunlight. Exposure to excessive heat or moisture may compromise the quality of the product.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textNormal,
                  ),
                ),

                SizedBox(height: 32.h),
                Text(
                  'Storage Instructions',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),
                SizedBox(height: 5),

                Text(
                  'For optimal potency and safety, it is recommended to store this medication in a cool, dry place, away from direct sunlight. Exposure to excessive heat or moisture may compromise the quality of the product. Additionally, it is important to keep this medication out of reach of children and pets to prevent accidental ingestion and ensure their safety',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textNormal,
                  ),
                ),
                SizedBox(height: 32.h),
                Text(
                  'Special Precautions',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Image.asset('assets/icons/dot_img.png'),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Do not exceed the recommended dosage.',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Image.asset('assets/icons/dot_img.png'),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Consult a healthcare professional before use if pregnant, breastfeeding, or taking other medications',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:EdgeInsets.only(top: 8.h),
                      child: Image.asset('assets/icons/dot_img.png'),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Discontinue use and seek medical advice if adverse reactions occur.',
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

class ReviewsTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(24.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                 SizedBox(height: 20.h),
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
                                  borderRadius: BorderRadius.circular(48.r),
                                ),
                                SizedBox(width: 12.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Emily johnson',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        wordSpacing: 1.5,
                                      ),
                                    ),
                                    SizedBox(height: 13.h),
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
                            SizedBox(height: 16.h),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                    'My consultation with Dr. Luca Rossi \nwas excellent. He`s knowledgeable, \nattentive, and provid...',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'More View',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textBtn,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.w),
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
                                    height: 56.h,
                                    width: 56.w,
                                  ),
                                  borderRadius: BorderRadius.circular(48.r),
                                ),
                                SizedBox(width: 12.w),
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
                                    SizedBox(height: 13.h),
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
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                    'My consultation with Dr. Luca Rossi \nwas excellent. He`s knowledgeable, \nattentive, and provid...',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'More View',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textBtn,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 44.h),

                //Related Products
                Text(
                  'Related products',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),

                SizedBox(height: 16.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(

                          right: 12.w,
                          bottom: 24.h,
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
                          height: 265.h,
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
                                Spacer(),
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
                                    SizedBox(width: 5.w),
                                    SizedBox(
                                      width: 90.w,
                                      height: 32.h,
                                      child: ElevatedButton(
                                        child: Text(
                                          'Add',
                                          style: TextStyle(fontSize: 16),
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
                        padding: EdgeInsets.only(right: 12.w, bottom: 24.h),
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
                          height: 265.h,
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
                                Spacer(),
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
                                    SizedBox(width: 5),
                                    SizedBox(
                                      width: 90.w,
                                      height: 32.h,
                                      child: ElevatedButton(
                                        child: Text(
                                          'Add',
                                          style: TextStyle(fontSize: 16),
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
                        padding: EdgeInsets.only(right: 12.w, bottom: 24.h,),
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
                          height: 265.h,
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
                                Spacer(),
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
                                    SizedBox(width: 5.w),
                                    SizedBox(
                                      width: 90.w,
                                      height: 32.h,
                                      child: ElevatedButton(
                                        child: Text(
                                          'Add',
                                          style: TextStyle(fontSize: 16),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
