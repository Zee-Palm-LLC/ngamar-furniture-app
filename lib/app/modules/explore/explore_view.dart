import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:ngamar/app/data/constants/constants.dart';
import 'package:ngamar/app/data/helpers/data.dart';
import 'package:ngamar/app/models/product_model.dart';
import 'package:ngamar/app/modules/explore/components/product_type_card.dart';
import 'package:ngamar/app/modules/home/components/product_card.dart';
import 'package:ngamar/app/modules/search/search_view.dart';
import 'package:ngamar/app/modules/widgets/textfields/search_field.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedType = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Discover',
          style: AppTypography.kSemiBold18.copyWith(color: AppColors.kGrey100),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: GestureDetector(
              onTap: (){
                Get.to<Widget>(()=>const SearchView());
              },
              child: SearchField(
                controller: _searchController,
                isEnabled: false,
                filterCallback: () {},
              ),
            ),
          ),
          SizedBox(height: 16.w),
          SizedBox(
            height: 36.h,
            child: ListView.separated(
              itemCount: furnitureTypes.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 24.0.w),
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(
                width: 8.w,
              ),
              itemBuilder: (context, index) {
                return ProductTypeCard(
                  type: furnitureTypes[index],
                  isSelected: _selectedType == index,
                  onTap: () {
                    setState(() {
                      _selectedType = index;
                    });
                  },
                );
              },
            ),
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0..w),
            child: Text(
              'Latest Product',
              style: AppTypography.kSemiBold16,
            ),
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: AnimationLimiter(
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: 153.w / 221.h,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(8.h),
                crossAxisCount: 2,
                crossAxisSpacing: AppSpacing.tenHorizontal,
                mainAxisSpacing: AppSpacing.twentyVertical,
                children: List.generate(
                  dummyProductList.length,
                  (index) {
                    return AnimationConfiguration.staggeredGrid(
                      columnCount: 2,
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: FadeInAnimation(
                        duration: const Duration(seconds: 1),
                        child: FadeInAnimation(
                          child: ProductCard(
                            onTap: () {},
                            product: dummyProductList[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
