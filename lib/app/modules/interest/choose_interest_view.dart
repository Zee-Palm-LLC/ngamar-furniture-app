import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/app/data/constants/constants.dart';
import 'package:ngamar/app/data/helpers/furniture_list.dart';
import 'package:ngamar/app/modules/auth/components/auth_appbar.dart';
import 'package:ngamar/app/modules/interest/components/interest_card.dart';
import 'package:ngamar/app/modules/interest/components/search_field.dart';
import 'package:ngamar/app/modules/widgets/buttons/primary_button.dart';

class ChooseInterestView extends StatefulWidget {
  const ChooseInterestView({super.key});

  @override
  State<ChooseInterestView> createState() => _ChooseInterestViewState();
}

class _ChooseInterestViewState extends State<ChooseInterestView> {
  final TextEditingController _searchController = TextEditingController();
  List<String> selectedFurniture = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Choose Interests', style: AppTypography.kBold24),
            SizedBox(height: AppSpacing.fiveVertical),
            Text(
              'Choose the items you are interested in to fulfill your dream home your dreams',
              style: AppTypography.kMedium14.copyWith(
                color: AppColors.kGrey60,
              ),
            ),
            SizedBox(height: AppSpacing.thirtyVertical),
            SearchField(
              controller: _searchController,
              filterCallback: () {},
            ),
            SizedBox(height: AppSpacing.twentyVertical),
            Wrap(
              spacing: 15.w,
              runSpacing: 15.h,
              children: List.generate(
                furnitureList.length,
                (index) => InterestCard(
                  onTap: () {
                    final furniture = furnitureList[index];
                    if (selectedFurniture.contains(furniture)) {
                      selectedFurniture.remove(furniture);
                    } else {
                      selectedFurniture.add(furniture);
                    }
                    setState(() {
                      debugPrint(selectedFurniture.toString());
                    });
                  },
                  isSelected: selectedFurniture.contains(furnitureList[index]),
                  text: furnitureList[index],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: AppColors.kWhite,
        padding: EdgeInsets.all(20.h),
        child: PrimaryButton(
          onTap: () {},
          text: 'Finish',
        ),
      ),
    );
  }
}
