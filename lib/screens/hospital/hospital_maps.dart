import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcare/screens/chatdoctor/chat_doctor.dart';
import '../../util/constants/colors.dart';
import '../../widgets/bottom bar/custom_bottom_bar.dart';
import '../../widgets/categories/categories_widget.dart';
import '../home/home_screen.dart';
import '../services/services_screen.dart';
import 'detail_hospital.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HospitalMaps extends StatefulWidget {
  const HospitalMaps({Key? key}) : super(key: key);

  @override
  State<HospitalMaps> createState() => _HospitalMaps();
}

class _HospitalMaps extends State<HospitalMaps> {

  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.5055, 9.2481); // Example: Milano
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  int index = 1;

  void _onItemTapped(int index) {
    setState(() {
      index = index;
    });
  }

  final List<Map<String, dynamic>> hospitals = [

    {
      'img': 'assets/images/Hospitals/ospedale.png',
      'name': 'Ospedale San Raffaele',
      'address': 'Via Olgettina, 60, 20132 Milano MI, Italy',
      'phone': '(+22) 2361 6257 1726',
      'bedDetailRoute': (BuildContext context) => const DetailHospital(),
      'locationRoute': (BuildContext context) => const HospitalMaps(),
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Container(
          child: Stack(
            children: [

              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(45.5055, 9.2481), // San Francisco
                  zoom: 14.0,
                ),
                onMapCreated: (controller) {
                  setState(() {
                    mapController = controller;
                  });
                },
              ),

          //     GoogleMap(
          //       onMapCreated: _onMapCreated,
          //       initialCameraPosition: CameraPosition(
          //       target: _center,
          //         zoom: 14.0,
          //       ),
          //   markers: {
          //     Marker(
          //       markerId: MarkerId('hospitalMarker'),
          //       position: _center,
          //       infoWindow: InfoWindow(
          //         title: 'Ospedale San Raffaele',
          //         snippet: 'Via Olgettina, 60, Milano',
          //       ),
          //     ),
          //   },
          // ),

              //Search Bar
              // Container(
              //   // width: 372.w,
              //   // height: 48.h,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Container(
              //         // width: 330.w,
              //         child: TextField(
              //           decoration: InputDecoration(
              //             contentPadding: EdgeInsets.all(12.w),
              //             prefixIconColor: Color(0xff8F8F8F),
              //             prefixIcon: IconButton(
              //               icon: Image.asset('assets/icons/Search.png',
              //                   height: 20.h,width: 20.w),
              //               onPressed: () {},
              //             ),
              //             prefixIconConstraints: BoxConstraints(minWidth: 15.05.w),
              //             hintText: 'Search this area',
              //             hintStyle: GoogleFonts.khula(
              //               letterSpacing: 1,
              //               fontWeight: FontWeight.w400,
              //               fontSize: 14,
              //               color: Color(0xff8F8F8F),
              //             ),
              //             border: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(12.0),
              //               borderSide:
              //               BorderSide(color: Color(0xffC2E7D9), width: 1),
              //             ),
              //             filled: true,
              //             fillColor: Color(0xffF9F9F9),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              // List of Hospitals

              //Hospital List

              //Hospital Card

              _buildHospitalList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHospitalList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(), // because inside SingleChildScrollView
      shrinkWrap: true,
      itemCount: hospitals.length,
      itemBuilder: (context, index) {
        final hospital = hospitals[index];
        return Container(
          margin: EdgeInsets.only(bottom: 40.h,left: 28.w,right:28.w,top: 600.h ),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xffC2E7D9))
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      hospital['img']!,
                      height: 74.h,
                      width: 90.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // SizedBox(width: 20.w),
                  Container(
                    width: 230.w,
                    padding: EdgeInsets.only(left: 20.w),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hospital['name']!,
                            style: GoogleFonts.khula(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              letterSpacing: 1,
                              height: 1.h,
                              color: Color(0xff090909),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            hospital['address']!,
                            style: GoogleFonts.khula(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              letterSpacing: 1,
                              // height: 1.h,
                              color: Color(0xff4D4D4D),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/Phone.png',
                                height: 12.h,
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                hospital['phone']!,
                                style: GoogleFonts.khula(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.sp,
                                  letterSpacing: 1,
                                  height: 1.h,
                                  color: Color(0xff4D4D4D),
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
              SizedBox(height: 16.h),
              Divider(color: AppColors.borderBtn),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => hospitals[index]['bedDetailRoute'](context),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 47.5.w, vertical: 14.h),
                      side: BorderSide(color: AppColors.borderSecondary, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.w),
                      ),
                    ),
                    child: Text(
                      "Bed Detail",
                      style: GoogleFonts.khula(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.textBtn
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => hospitals[index]['locationRoute'](context),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 14.h),
                      backgroundColor: AppColors.btnPrimary,
                      foregroundColor: AppColors.textWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.w),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            'Location',
                            style: GoogleFonts.khula(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              letterSpacing: 1,
                              color: AppColors.textWhite,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Icon(Icons.arrow_forward_ios,color: Color(0xffFFFFFF),size: 12)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

}
