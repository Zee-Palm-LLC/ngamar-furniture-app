import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ngamar/app/data/constants/constants.dart';
import 'package:ngamar/app/modules/explore/explore_view.dart';
import 'package:ngamar/app/modules/favorite/favorite_view.dart';
import 'package:ngamar/app/modules/home/home_view.dart';
import 'package:ngamar/app/modules/landingPage/components/centered_icon.dart';
import 'package:ngamar/app/modules/profile/profile_view.dart';
import 'package:ngamar/app/modules/scan/product_scanner.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  List<Widget> pages = [
    const HomeView(),
    const ExploreView(),
    const ProductScanner(),
    const FavoriteView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[_currentIndex],
      bottomNavigationBar: _currentIndex == 2
          ? null
          : BottomNavigationBar(
              showSelectedLabels: true,
              showUnselectedLabels: true,
              backgroundColor: AppColors.kWhite,
              elevation: 0,
              selectedLabelStyle: AppTypography.kLight10,
              unselectedLabelStyle: AppTypography.kLight10,
              currentIndex: _currentIndex,
              onTap: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppAssets.kHome),
                  label: 'Home',
                  activeIcon: SvgPicture.asset(AppAssets.kHomeFilled),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppAssets.kDiscovery),
                  label: 'Explore',
                  activeIcon: SvgPicture.asset(AppAssets.kDiscoveryFilled),
                ),
                const BottomNavigationBarItem(icon: CenteredIcon(), label: ''),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppAssets.kHeart),
                  label: 'Favorites',
                  activeIcon: SvgPicture.asset(AppAssets.kHeartFilled),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppAssets.kUser),
                  label: 'Profile',
                  activeIcon: SvgPicture.asset(AppAssets.kUserFilled),
                ),
              ],
            ),
    );
  }
}
