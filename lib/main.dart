import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/bottom_nav_bar/tabapges.dart';
import 'package:shuhaui/features/feature_products.dart';
import 'package:shuhaui/features/flash_sale.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/featuredproducts.dart';
import 'package:shuhaui/features/order_status.dart';
import 'package:shuhaui/features/page_details.dart';
import 'package:shuhaui/features/wish_list.dart';

void main() {
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
              backgroundColor: Color.fromRGBO(51, 40, 88, 1),
            ),
            scaffoldBackgroundColor: const Color.fromRGBO(12, 21, 59, 1),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color.fromRGBO(51, 40, 88, 1),
            ),
            useMaterial3: false,
          ),
          builder: (context, child) {
            return SafeArea(child: child!);
          },
          debugShowCheckedModeBanner: false,
          home: 
           const Bottompage(),
        );
      },
    );
  }
}
