import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/billing_information.dart';
import 'package:shuhaui/utils/constant/colors.dart';
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
            fontFamily: 'Poppins',
            textTheme: const TextTheme(
              bodyLarge: TextStyle(fontWeight: FontWeight.w400),
              bodyMedium: TextStyle(fontWeight: FontWeight.w400),
              bodySmall: TextStyle(
                fontWeight: FontWeight.w400,
              ),
              displayLarge: TextStyle(fontWeight: FontWeight.w600),
              displayMedium: TextStyle(fontWeight: FontWeight.w600),
              displaySmall: TextStyle(fontWeight: FontWeight.w500),
              headlineMedium: TextStyle(fontWeight: FontWeight.w500),
              titleMedium: TextStyle(fontWeight: FontWeight.w600),
              titleSmall: TextStyle(fontWeight: FontWeight.w600),
            ),

            appBarTheme: AppBarTheme(
              backgroundColor: appbarColor,

              //  Color.fromRGBO(51, 40, 88, 1),
            ),
            scaffoldBackgroundColor: scaffoldColor,
            // const Color.fromRGBO(12, 21, 59, 1),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: bottomnavColor,
              //  Color.fromRGBO(51, 40, 88, 1),
            ),
            useMaterial3: false,
          ),
          builder: (context, child) {
            return SafeArea(child: child!);
          },
          debugShowCheckedModeBanner: false,
          home:  const BillingInformation(),
        );
      },
    );
  }
}
