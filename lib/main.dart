import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ngamar/app/bindings/home_binding.dart';
import 'package:ngamar/app/data/constants/constants.dart';
import 'package:ngamar/app/modules/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(defaultOverlay);
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            title: 'Ngamar',
            debugShowCheckedModeBanner: false,
            scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
            defaultTransition: Transition.fadeIn,
            theme: AppTheme.lightTheme,
            locale: const Locale('en_US'),
            initialBinding: HomeBinding(),
            home: const SplashView(),
          ),
        );
      },
    );
  }
}
