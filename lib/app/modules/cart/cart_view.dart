import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ngamar/app/data/constants/constants.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        centerTitle: true,
        title: Text(
          'Cart',
          style: AppTypography.kSemiBold18.copyWith(color: AppColors.kGrey100),
        ),
      ),
      body: Column(
        children: [
          const Spacer(),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(15.h),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.kGreenLight,
            ),
            child: SvgPicture.asset(
              AppAssets.kEmptyBox,
              height: 125.h,
              width: 125.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.h),
          Center(
            child: Text(
              'Sorry! No items are here yet.',
              style: AppTypography.kMedium14.copyWith(color: AppColors.kGrey60),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
