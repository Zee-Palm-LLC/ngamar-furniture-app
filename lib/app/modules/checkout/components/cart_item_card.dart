import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/app/data/constants/constants.dart';
import 'package:ngamar/app/models/product_model.dart';
import 'package:ngamar/app/modules/home/components/quantity_card.dart';

class CartItemCard extends StatelessWidget {
  final ProductModel product;
  const CartItemCard({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 100.h,
          width: 100.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: 92.h,
                  width: 92.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusTen),
                    image: DecorationImage(
                      image: AssetImage(product.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Transform.rotate(
                angle: -0.2,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.kPrimary,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    product.offPercentage,
                    style: AppTypography.kSemiBold10,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: AppSpacing.tenHorizontal),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.kSemiBold18,
              ),
              SizedBox(height: AppSpacing.fiveVertical),
              Text(
                'By Leopar Zega',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.kMedium14
                    .copyWith(color: AppColors.kGrey70, fontSize: 10.sp),
              ),
              SizedBox(height: AppSpacing.tenHorizontal),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QuantityCard(
                    onChanged: (quantity) {},
                  ),
                  RichText(
                    text: TextSpan(
                      text: r'$ ',
                      style: AppTypography.kMedium14
                          .copyWith(color: AppColors.kGrey100),
                      children: [
                        TextSpan(
                          text: product.currentPrice.toString(),
                          style: AppTypography.kSemiBold24,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
