import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/bottom_nav_bar/tabapges.dart';
import 'package:shuhaui/utils/dependency_injection/dependency_setup.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Demo Ui',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor:Color.fromRGBO(24,179,210,1),

              //  Color.fromRGBO(51, 40, 88, 1),
            ),
            scaffoldBackgroundColor: Color.fromRGBO(238, 238, 238, 1),
            // const Color.fromRGBO(12, 21, 59, 1),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor:Colors.black,
              //  Color.fromRGBO(51, 40, 88, 1),
            ),
            useMaterial3: false,
          ),
          builder: (context, child) {
            return SafeArea(child: child!);
          },
          debugShowCheckedModeBanner: false,
          home: const Bottompage(),
        );
      },
    );
  }
}
