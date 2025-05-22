import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medcare/screens/home/home_screen.dart';

import '../../screens/chatdoctor/history_screen.dart';
import '../../screens/profile/profile_screen.dart';
import '../../screens/services/services_screen.dart';

class CustomBottomAppBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomAppBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  void _navigate(int index) {
    widget.onItemTapped(index);

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ServicesScreenScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HistoryScreen()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
        break;
    }
  }

  Widget _buildIconItem({
    required int index,
    required String selectedAsset,
    required String unselectedAsset,
    required String label,
  }) {
    final isSelected = widget.selectedIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () => _navigate(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // padding: EdgeInsets.all(6.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                isSelected ? unselectedAsset : selectedAsset,
                height: 23.33.h,
                width: 23.33.w,
              ),
            ),
            SizedBox(height: 2.5.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                color: isSelected ? const Color(0xff4D4D4D) : const Color(0xff8F8F8F),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: SizedBox(
        height: 60.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildIconItem(
              index: 0,
              selectedAsset: 'assets/icons/bottombar/Home_selected.png',
              unselectedAsset: 'assets/icons/bottombar/Home_unselected.png',
              label: 'Home',
            ),
            _buildIconItem(
              index: 1,
              selectedAsset: 'assets/icons/bottombar/Services_selected.png',
              unselectedAsset: 'assets/icons/bottombar/Services_unselected.png',
              label: 'Services',
            ),
            _buildIconItem(
              index: 2,
              selectedAsset: 'assets/icons/bottombar/History_selected.png',
              unselectedAsset: 'assets/icons/bottombar/History_unselected.png',
              label: 'History',
            ),
            _buildIconItem(
              index: 3,
              selectedAsset: 'assets/icons/bottombar/Profile_selected.png',
              unselectedAsset: 'assets/icons/bottombar/Profile_unselected.png',
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
