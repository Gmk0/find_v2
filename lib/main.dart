import 'package:find_v2/binding/allntialBinding.dart';
import 'package:find_v2/route/appRoute.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:find_v2/utils/theme2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      // designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'FIND',
          theme: FindTheme.lightTheme,
          darkTheme: FindTheme.darkTheme,
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          initialBinding: AllIntialBinding(),
          getPages: AppRoute.routes,
        );
      },
    );
  }
}
