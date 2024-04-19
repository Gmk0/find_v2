import 'package:find_v2/binding/allntialBinding.dart';
import 'package:find_v2/route/appRoute.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(const MyApp());
}

/*
void main() => runApp(
      DevicePreview(
        // enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );
*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      //designSize: const Size(428, 926),
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return ConnectivityAppWrapper(
            app: GetMaterialApp(
          title: 'FIND',
          useInheritedMediaQuery: true,
          theme: FindTheme.lightTheme,
          darkTheme: FindTheme.darkTheme,
          locale: DevicePreview.locale(context),
          builder: (buildContext, widget) {
            return ConnectivityWidgetWrapper(
              disableInteraction: true,
              height: 80,
              child: widget!,
            );
          },
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          initialBinding: AllIntialBinding(),
          getPages: AppRoute.routes,
        ));
      },
    );
  }
}
