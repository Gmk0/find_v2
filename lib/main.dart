import 'package:find_v2/binding/allntialBinding.dart';
import 'package:find_v2/route/appRoute.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'FIND',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          initialBinding: AllIntialBinding(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: skinFill),
            useMaterial3: true,
          ),
          getPages: AppRoute.routes,
          //home: const GetStarted(),
        );
      },
    );
  }
}
