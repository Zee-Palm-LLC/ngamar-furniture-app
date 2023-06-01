import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ngamar/app/data/constants/constants.dart';
import 'package:ngamar/app/models/user_model.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final UserModel user;
  const HomeAppBar({
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 60.w,
      leading: Padding(
        padding: EdgeInsets.only(
          left: 10.w,
          top: 5.h,
        ),
        child: CircleAvatar(
          backgroundImage: AssetImage(user.profilePic),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name,
            style:
                AppTypography.kSemiBold16.copyWith(color: AppColors.kGrey100),
          ),
          Text(
            'Good Morning',
            style: AppTypography.kLight10.copyWith(color: AppColors.kGrey80),
          ),
        ],
      ),
      actions: [
        CustomIcons(
          onTap: () {},
          icon: AppAssets.kBag,
        ),
        SizedBox(width: 10.0.w),
        CustomIcons(
          onTap: () {},
          icon: AppAssets.kNotification,
        ),
        SizedBox(width: 20.0.w),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomIcons extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  const CustomIcons({required this.icon, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.h,
        width: 44.w,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xffF6F6F6),
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}