import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ngamar/app/data/constants/constants.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback filterCallback;
  const SearchField({
    required this.controller,
    required this.filterCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        prefixIcon: Padding(
          padding: EdgeInsets.all(14.h),
          child: SvgPicture.asset(
            AppAssets.kSearch,
          ),
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 20.0.h,
              width: 1.w,
              color: AppColors.kGrey30,
            ),
            IconButton(
              onPressed: filterCallback,
              icon: SvgPicture.asset(
                AppAssets.kFilter,
              ),
            ),
          ],
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(AppSpacing.radiusThirty),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(AppSpacing.radiusThirty),
        ),
      ),
    );
  }
}
