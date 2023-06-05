import 'package:flutter/material.dart';
import 'package:ngamar/app/data/constants/constants.dart';
import 'package:ngamar/app/models/product_model.dart';
import 'package:ngamar/app/modules/my_purchase/components/my_purchase_card.dart';

class DeliveredPurchases extends StatelessWidget {
  const DeliveredPurchases({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx, i) {
        return MyPurchaseCard(
          product: dummyProductList[i],
        );
      },
      separatorBuilder: (ctx, i) => SizedBox(height: AppSpacing.twentyVertical),
      itemCount: dummyProductList.length - 2,
    );
  }
}
