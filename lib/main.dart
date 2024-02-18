import 'package:first/common/utils/constants.dart';
import 'package:first/features/onboarding/pages/onboarding.dart';
import 'package:first/features/todo/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        //SN 3 lines below to adapt to diff devices
        useInheritedMediaQuery: true,
        designSize: Size(375, 825),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Task Manager',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: AppConst.kBkDark,
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Color.fromARGB(255, 217, 255, 3)),
              useMaterial3: true,
            ),
            themeMode: ThemeMode.dark,
            home: const OnBoarding(),
          );
        });
  }
}
