import 'dart:math';
import 'dart:typed_data';

import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ngamar/app/data/constants/constants.dart';
import 'package:ngamar/app/modules/landingPage/landing_page.dart';
import 'package:ngamar/app/modules/scan/components/qr_scanner_overlay_shape.dart';

class ProductScanner extends StatefulWidget {
  const ProductScanner({super.key});

  @override
  _ProductScannerState createState() => _ProductScannerState();
}

class _ProductScannerState extends State<ProductScanner>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAll<Widget>(() => const LandingPage());
          },
        ),
        title: Text(
          'Scan Product',
          style: AppTypography.kSemiBold16.copyWith(color: AppColors.kGrey100),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: AppSpacing.twentyVertical,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Stack(
                  children: [
                    MobileScanner(
                      controller: MobileScannerController(
                        returnImage: true,
                      ),
                      onDetect: (capture) {
                        final barcodes = capture.barcodes;
                        for (final barcode in barcodes) {
                          debugPrint('Barcode found! ${barcode.rawValue}');
                        }
                      },
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: ShapeDecoration(
                          shape: QrScannerOverlayShape(
                            borderColor: AppColors.kPrimary,
                            borderRadius: 10,
                            borderLength: 20,
                            borderWidth: 5,
                            cutOutSize: 300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 100..h,
                child: Row(
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
                                borderRadius:
                                    BorderRadius.circular(AppSpacing.radiusTen),
                                image: DecorationImage(
                                  image: AssetImage(AppAssets.kDummyProduct1),
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
                                '24% Off',
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'King Bed Leonard',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.kSemiBold18,
                          ),
                          Text(
                            'By Leopar Zega',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.kMedium14.copyWith(
                                color: AppColors.kGrey70, fontSize: 10.sp),
                          ),
                          SizedBox(height: AppSpacing.tenVertical),
                          RichText(
                            text: TextSpan(
                              text: r'$ ',
                              style: AppTypography.kMedium14
                                  .copyWith(color: AppColors.kGrey100),
                              children: [
                                TextSpan(
                                  text: '39.00',
                                  style: AppTypography.kSemiBold16,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.h),
                      decoration: const BoxDecoration(
                        color: AppColors.kGrey50,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite_border_outlined,
                        size: 18,
                        color: AppColors.kWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
