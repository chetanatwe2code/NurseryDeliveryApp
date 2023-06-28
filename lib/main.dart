import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nursery_driver/theme/dark_theme.dart';
import 'package:nursery_driver/theme/light_theme.dart';
import 'core/di/get_di.dart' as di;
import 'core/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) => GetMaterialApp(
        getPages: Routes.routes,
        initialRoute: rsDefaultPage,
        title: "nursery",
        theme: light(),
        darkTheme: dark(),
      ),
    );
  }
}