import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../util/constants/colors.dart';
import '../../widgets/bottom bar/custom_bottom_bar.dart';
import '../services/services_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'article_details_screen.dart';

class ListArticleScreen extends StatefulWidget {
  const ListArticleScreen({Key? key}) : super(key: key);


  @override
  State<ListArticleScreen> createState() => _ListArticleScreen();
}

class _ListArticleScreen extends State<ListArticleScreen> {

  int _selectedIndex = 3;
  bool isSelected = false;
  String selectedDay = 'All Article';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, dynamic>> articles = [
    {
      'img': 'assets/images/Article/Slider/firest.png',
      'title': 'Understanding Diabetes: Symptoms, Risk Factors, and Prevention Tips',
    },
    {
      'img': 'assets/images/Article/Slider/Center.png',
      'title': '5 Tips for Boosting Your Immune System Naturally',
    },
    {
      'img': 'assets/images/Article/Slider/last.png',
      'title': 'The Importance of Mental Health: Strategies for Stress Management',
    },
  ];

  final List<Map<String, dynamic>> hottopic = [

    {
      'imgPath': 'assets/images/Article/Hot Topic/Mental Health.png',
      'title': 'Mental Health',
    },

    {
      'imgPath': 'assets/images/Article/Hot Topic/Lifestyle.png',
      'title': 'Mental Health',
    },

    {
      'imgPath': 'assets/images/Article/Hot Topic/Mental Health.png',
      'title': 'Mental Health',
    },

  ];

  final List<Map<String, dynamic>> articleList = [
    {
      'imgPath': 'assets/images/Article/Article List/Adults1.png',
      'type': 'Adults',
      'description': 'Getting to know Hanta Virus Disease from Rodents',
      'route': (BuildContext context) => const ArticleDetailsScreen()
    },
    {
      'imgPath': 'assets/images/Article/Article List/Adults2.png',
      'type': 'Adults',
      'description': 'Getting to know Hanta Virus Disease from Rodents',
      'route': (BuildContext context) => const ArticleDetailsScreen()
    },
    {
      'imgPath': 'assets/images/Article/Article List/Adults3.png',
      'type': 'Adults',
      'description': 'Getting to know Hanta Virus Disease from Rodents',
      'route': (BuildContext context) => const ArticleDetailsScreen()
    },
    {
      'imgPath': 'assets/images/Article/Article List/Adults1.png',
      'type': 'Adults',
      'description': 'Getting to know Hanta Virus Disease from Rodents',
      'route': (BuildContext context) => const ArticleDetailsScreen()
    },
    {
      'imgPath': 'assets/images/Article/Article List/Adults2.png',
      'type': 'Adults',
      'description': 'Getting to know Hanta Virus Disease from Rodents',
      'route': (BuildContext context) => const ArticleDetailsScreen()
    },
    {
      'imgPath': 'assets/images/Article/Article List/Adults3.png',
      'type': 'Adults',
      'description': 'Getting to know Hanta Virus Disease from Rodents',
      'route': (BuildContext context) => const ArticleDetailsScreen()
    },
    {
      'imgPath': 'assets/images/Article/Article List/Adults1.png',
      'type': 'Adults',
      'description': 'Getting to know Hanta Virus Disease from Rodents',
      'route': (BuildContext context) => const ArticleDetailsScreen()
    },
    {
      'imgPath': 'assets/images/Article/Article List/Adults2.png',
      'type': 'Adults',
      'description': 'Getting to know Hanta Virus Disease from Rodents',
      'route': (BuildContext context) => const ArticleDetailsScreen()
    },
    {
      'imgPath': 'assets/images/Article/Article List/Adults3.png',
      'type': 'Adults',
      'description': 'Getting to know Hanta Virus Disease from Rodents',
      'route': (BuildContext context) => const ArticleDetailsScreen()
    },
  ];


  List<Map<String, String>> filteredArticles = [];

  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredArticles = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterArticles);
  }

  void _filterArticles() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredArticles = articleList.where((article) {
        return article['type'].toLowerCase().contains(query) ||
            article['description'].toLowerCase().contains(query);
      }).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    bool isSearching = _searchController.text.isNotEmpty;

    return Scaffold(
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 60.h),
          child: Column(
            children: [

              //Search Bar
              Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w),
                child: Container(
                  width: 372.w,
                  height: 48.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 24.w,
                        child: IconButton(
                          padding: EdgeInsets.zero, // remove internal padding
                          constraints: BoxConstraints(), // remove min constraints
                          alignment: Alignment.centerLeft,
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) => ServicesScreenScreen()));
                          },
                          icon: Icon(Icons.chevron_left,
                            color: AppColors.btnSecondary,
                            size: 25.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Container(
                        width: 330.w,
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 16.w, top: 14.h),
                            prefixIconColor: Color(0xff8F8F8F),
                            prefixIcon: IconButton(
                              icon: Image.asset('assets/icons/Search.png', height: 20.h),
                              onPressed: () {},
                            ),
                            prefixIconConstraints: BoxConstraints(minWidth: 15.05.w),
                            hintText: 'Search product or store',
                            hintStyle: GoogleFonts.khula(
                              letterSpacing: 1.w,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: Color(0xff8F8F8F),
                            ),
                            // 🟢 Permanent green border styles
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(color: Color(0xffC2E7D9), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(color: Color(0xffC2E7D9), width: 1),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(color: Color(0xffC2E7D9), width: 1),
                            ),
                            filled: true,
                            fillColor: Color(0xffF9F9F9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Show this only when searching
              if (isSearching)
                Padding(
                  padding: EdgeInsets.only(left: 28.w,right: 28.w,top: 24.h),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _filteredArticles.length,
                    itemBuilder: (context, index) {
                      final article = _filteredArticles[index];
                      return _buildArticleList(
                        imagePath: article['imgPath'],
                        articleType: article['type'],
                        articleDescription: article['description'],
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => article['route']!(context),
                          ),
                          );
                        },
                      );
                    },
                  ),
                )

              else
              Column(
                children: [

                  //Hot Article
                  SizedBox(height: 24.h),
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 28.w),
                            child: Text(
                              'Hot Article',
                              style: GoogleFonts.khula(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.w,
                                color: Color(0xff090909),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: true,
                            ),
                            items: articles.map((item) {
                              return _buildItem(item['img'], item['title']);
                            }).toList(),
                          ),

                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  //Hot Topic
                  Padding(
                    padding: EdgeInsets.only(left: 28.w,right: 28.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hot Topic',
                          style: GoogleFonts.khula(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.w,
                            color: Color(0xff090909),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: hottopic.map((topic) {
                              return Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: _buildHotTopicBanner(topic['imgPath'], topic['title']),
                              );
                            }).toList(),
                          ),
                        )

                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),

                  //Latest Article
                  Padding(
                    padding: EdgeInsets.only(left: 28.w,right: 28.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Latest Article',
                          style: GoogleFonts.khula(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.w,
                            color: Color(0xff090909),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        _buildScheduleDays(context),

                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),

                  //List View
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.h),
                    child: Column(
                      children: articleList.map((article) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: _buildArticleList(
                            imagePath: article['imgPath'],
                            articleType: article['type'],
                            articleDescription: article['description'],
                            onTap: article.containsKey('route')
                                ? () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => article['route'](context)),
                            )
                                : null,
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String imgPath, String title) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(color: Color(0xffC2E7D9),width:1.w)
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Image.asset(
            imgPath,
            width: 340.w,
            fit: BoxFit.cover,
          ),
          Positioned(
            // bottom: 0,
            // left: 0,
            // right: 0,
            // height: 200.h,  // adjust height as needed
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 95.h, left: 16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    letterSpacing: 1.w,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 141.h, left: 16.w),
            child: Container(
              height: 23.h,
              width: 90.w,
              child: ElevatedButton(
                onPressed: () {
                  // Add your navigation or action here
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  backgroundColor: Color(0xff26408B),
                  foregroundColor: AppColors.textWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Read Article',
                    style: GoogleFonts.khula(
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                      letterSpacing: 1.w,
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHotTopicBanner(String imagePath, String productName) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r),
      side: BorderSide(color: Color(0xffC2E7D9),width: 1.w)
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            width: 160.w,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 100.h, // adjust height as needed
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 35.w),
                child: Text(
                  productName,
                  style: GoogleFonts.khula(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    letterSpacing: 1.w,
                    color: Color(0xffFFFFFF),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleDays(BuildContext context) {
    final days = ['All Article', 'Adults', 'Infants and Toddlers', 'Children'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: days.map((day) {
          bool isSelected = day == selectedDay;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDay = day;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 8.w),
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.w),
                border: Border.all(width: 1, color: Color(0xffC2E7D9)),
                color: isSelected ? AppColors.btnPrimary : AppColors.bgAlert,
              ),
              child: Text(
                day,
                textAlign: TextAlign.center,
                style: GoogleFonts.khula(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: isSelected ? AppColors.textWhite : AppColors.textSecondary,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildArticleList({
    required String imagePath,
    required String articleType,
    required String articleDescription,
    required VoidCallback? onTap,

  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(color: Color(0xFFC2E7D9), width: 1),
          // borderRadius: BorderRadius.circular(6),
        ),
        padding: EdgeInsets.all(8.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Image.asset(
                imagePath,
                width: 80.w,
                // height: 60.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      articleType,
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        letterSpacing: 1.w,
                        color: Color(0xff8F8F8F),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      articleDescription,
                      style: GoogleFonts.khula(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        letterSpacing: 1.w,
                        color: Color(0xff090909),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
