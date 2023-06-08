import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/app/data/constants/constants.dart';
import 'package:ngamar/app/data/helpers/data.dart';
import 'package:ngamar/app/modules/search/components/last_search_card.dart';
import 'package:ngamar/app/modules/search/components/popular_search_card.dart';
import 'package:ngamar/app/modules/widgets/buttons/custom_text_button.dart';

class PopularSearch extends StatefulWidget {
  const PopularSearch({super.key});

  @override
  State<PopularSearch> createState() => _PopularSearchState();
}

class _PopularSearchState extends State<PopularSearch> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      children: [
        SizedBox(height: AppSpacing.thirtyVertical),
        Row(
          children: [
            Text(
              'Last Search',
              style: AppTypography.kSemiBold16,
            ),
            const Spacer(),
            CustomTextButton(
              onPressed: () {
                setState(() {
                  lastSearch.clear();
                });
              },
              text: 'Clear All',
              fontSize: 12.sp,
              color: AppColors.kPrimary,
            ),
          ],
        ),
        if (lastSearch.isNotEmpty)
          Wrap(
            spacing: 15.w,
            runSpacing: 15.h,
            children: List.generate(
              lastSearch.length,
              (index) => LastSearchCard(
                onTap: () {
                  setState(() {
                    lastSearch.removeAt(index);
                  });
                },
                text: lastSearch[index],
              ),
            ),
          )
        else
          Center(
            child: Text(
              'No Last Search',
              style: AppTypography.kMedium14.copyWith(color: AppColors.kGrey70),
            ),
          ),
        SizedBox(height: AppSpacing.twentyVertical),
        Text(
          'Popular Search',
          style: AppTypography.kSemiBold16,
        ),
        SizedBox(height: AppSpacing.twentyVertical),
        ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return const PopularSearchCard();
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 16.h,
          ),
          itemCount: 5,
        ),
        SizedBox(height: AppSpacing.twentyVertical),
      ],
    );
  }
}
