import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/app/data/constants/constants.dart';
import 'package:ngamar/app/data/helpers/data.dart';
import 'package:ngamar/app/modules/explore/components/product_type_card.dart';
import 'package:ngamar/app/modules/search/components/star_rating_card.dart';
import 'package:ngamar/app/modules/widgets/buttons/custom_text_button.dart';
import 'package:ngamar/app/modules/widgets/buttons/primary_button.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  int selectedType = 0;
  int selectedStarRating = 0;
  double currentFilerPrice = 60.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 634.h,
      padding: EdgeInsets.only(
        top: 10.h,
        left: 24.w,
        right: 24.0.w,
        bottom: 20.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomDivider(),
          SizedBox(height: AppSpacing.twentyVertical),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.close),
              ),
              Text(
                'Filter',
                style: AppTypography.kSemiBold18,
              ),
              const Spacer(),
              CustomTextButton(
                onPressed: () {},
                text: 'Reset Filters',
                color: AppColors.kPrimary,
              ),
            ],
          ),
          SizedBox(height: AppSpacing.thirtyVertical),
          Text(
            'Categories',
            style: AppTypography.kSemiBold18,
          ),
          SizedBox(height: AppSpacing.tenVertical),
          Wrap(
            spacing: 10.0.w,
            runSpacing: 10.0.h,
            children: List.generate(
              categories.length,
              (index) => ProductTypeCard(
                onTap: () {
                  setState(() {
                    selectedType = index;
                  });
                },
                isSelected: selectedType == index,
                type: categories[index],
              ),
            ),
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          Text(
            'Price',
            style: AppTypography.kSemiBold18,
          ),
          SizedBox(height: AppSpacing.tenVertical),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 12.h,
              activeTrackColor: AppColors.kPrimary,
              trackShape: CustomTrackShape(),
            ),
            child: Slider(
              value: currentFilerPrice,
              max: 100,
              thumbColor: AppColors.kWhite,
              onChanged: (value) {
                setState(() {
                  currentFilerPrice = value;
                });
              },
            ),
          ),
          Row(
            children: [
              Text(
                r'$260',
                style: AppTypography.kSemiBold12
                    .copyWith(color: AppColors.kGrey70, fontSize: 12.sp),
              ),
              const Spacer(),
              Text(
                r'$12000',
                style: AppTypography.kSemiBold12
                    .copyWith(color: AppColors.kGrey70),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          Text(
            'Star Rating',
            style: AppTypography.kSemiBold18,
          ),
          SizedBox(height: AppSpacing.tenVertical),
          Wrap(
            spacing: 10.w,
            runSpacing: 10.0..h,
            children: List.generate(
              starRating.length,
              (index) => StarRatingCard(
                onTap: () {
                  setState(() {
                    selectedStarRating = index;
                  });
                },
                isSelected: selectedStarRating == index,
                rating: starRating[index],
              ),
            ),
          ),
          const Spacer(),
          PrimaryButton(
            onTap: () {},
            text: 'Apply Filters',
          ),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 7.h,
        width: 74.w,
        decoration: BoxDecoration(
          color: AppColors.kGrey30,
          borderRadius: BorderRadius.circular(AppSpacing.radiusThirty),
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    Offset offset = Offset.zero,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
