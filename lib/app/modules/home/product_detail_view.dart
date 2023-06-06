import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ngamar/app/data/constants/constants.dart';
import 'package:ngamar/app/data/helpers/data.dart';
import 'package:ngamar/app/modules/home/components/color_card.dart';
import 'package:ngamar/app/modules/home/components/quantity_card.dart';
import 'package:ngamar/app/modules/widgets/buttons/primary_button.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        centerTitle: true,
        title: Text(
          'Detail',
          style: AppTypography.kSemiBold18.copyWith(color: AppColors.kGrey100),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppAssets.kBag,
            ),
          ),
          SizedBox(width: AppSpacing.tenHorizontal),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(AppAssets.kStage),
              Image.asset(
                AppAssets.kSofaDetail,
              ),
            ],
          ),
          SizedBox(height: AppSpacing.thirtyVertical),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bagilan Sofa',
                    style: AppTypography.kSemiBold18,
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.kStar),
                      SizedBox(width: 5.w),
                      Text(
                        '4.8',
                        style: AppTypography.kSemiBold14,
                      ),
                      Text(
                        '(320 Review)',
                        style: AppTypography.kSemiBold12
                            .copyWith(color: AppColors.kGrey60),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  QuantityCard(
                    onChanged: (quantity) {},
                  ),
                  Text(
                    'Available in stock',
                    style: AppTypography.kSemiBold12.copyWith(
                      color: AppColors.kGrey100,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          Text(
            'Color',
            style: AppTypography.kSemiBold18,
          ),
          SizedBox(height: AppSpacing.tenVertical),
          Wrap(
            spacing: 10.w,
            runSpacing: 10.0.h,
            children: List.generate(
              availableColor.length,
              (index) => ColorCard(
                color: availableColor[index],
                isSelected: _selectedColor == index,
                onTap: () {
                  setState(() {
                    _selectedColor = index;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          Text(
            'Description',
            style: AppTypography.kSemiBold18,
          ),
          SizedBox(height: AppSpacing.tenVertical),
          ExpandableText(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a Read More",
            expandText: 'Read More',
            collapseText: 'Read Less',
            maxLines: 3,
            linkColor: AppColors.kPrimary,
            style: AppTypography.kMedium14.copyWith(
              color: AppColors.kGrey80,
            ),
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: r'$',
                    style: AppTypography.kBold32
                        .copyWith(color: AppColors.kPrimary),
                    children: [
                      TextSpan(
                        text: '35.25',
                        style: AppTypography.kBold32,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: PrimaryButton(
                  onTap: () {},
                  text: 'Add To Cart',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
