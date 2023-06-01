import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ngamar/app/data/constants/constants.dart';
import 'package:ngamar/app/models/user_model.dart';
import 'package:ngamar/app/modules/home/components/banner_card.dart';

import 'package:ngamar/app/modules/home/components/home_appBar.dart';
import 'package:ngamar/app/modules/widgets/buttons/custom_text_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        user: dummyUser,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          SizedBox(height: 20.h),
          const BannerCard(),
          SizedBox(height: 13.h),
          Row(
            children: [
              Text(
                'Popular 🔥',
                style: AppTypography.kSemiBold16,
              ),
              const Spacer(),
              CustomTextButton(
                onPressed: () {},
                text: 'See All',
                fontSize: 12.sp,
                color: AppColors.kPrimary,
              ),
            ],
          ),
        Container(
          height: 100.h,
          color: Colors.red,
        )
        ],
      ),
    );
  }
}
