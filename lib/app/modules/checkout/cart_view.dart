import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/app/data/constants/constants.dart';
import 'package:ngamar/app/models/product_model.dart';
import 'package:ngamar/app/modules/checkout/components/cart_item_card.dart';
import 'package:ngamar/app/modules/checkout/components/drag_sheet.dart';
import 'package:ngamar/app/modules/checkout/components/no_item_card.dart';

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
      body: dummyProductList.isEmpty
          ? const NoItemCard()
          : Stack(
              children: [
                ListView.separated(
                  itemCount: dummyProductList.length,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: AppSpacing.twentyVertical,
                  ),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: AppSpacing.twentyVertical),
                  itemBuilder: (context, index) {
                    return CartItemCard(
                      product: dummyProductList[index],
                    );
                  },
                ),
                const DragSheet(
                  shipping: '6.00',
                  subtotal: '93.00',
                  totalAmount: '97.00',
                ),
              ],
            ),
    );
  }
}
