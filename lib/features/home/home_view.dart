import 'dart:async';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/SectionWidgets/discount2.dart';
import 'package:shuhaui/features/home/Widgets/SectionWidgets/featuredproductsSection.dart';

import 'Widgets/SectionWidgets/category.dart';
import 'Widgets/SectionWidgets/collectionSection.dart';
import 'Widgets/SectionWidgets/cycloneoffer.dart';
import 'Widgets/SectionWidgets/discount.dart';
import 'Widgets/SectionWidgets/homeappbar.dart';
import 'Widgets/SectionWidgets/imageslider.dart';
import 'Widgets/SectionWidgets/search&filter.dart';
import 'Widgets/SectionWidgets/themeswitch.dart';
import 'Widgets/SectionWidgets/topproducts.dart';
import 'Widgets/SectionWidgets/weeklybestsellers.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  int index = 0;
  bool switchValue = false;
  int currentindex = 0;

  ///logic for countdown
  int seconds = 60, minutes = 60, hour = 24, day = 10;
  String digitSeconds = '60',
      digitMinutes = '60',
      digitHours = '24',
      digitDays = '10';
  Timer? timer;
  bool started = true;
  void stop() {
    if (day == 0 && hour == 0 && minutes == 0 && seconds == 0) {
      timer!.cancel();
      setState(() {
        started = false;
      });
    }
  }

  ///Creating the started timer function
  void start() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSeconds = seconds - 1;
      int localMinutes = minutes;
      int localHours = hour;
      int localDays = day;
      if (localSeconds < 1) {
        if (localMinutes < 1) {
          if (localHours < 1) {
            localDays--;
            localHours = 24;
          } else {
            localHours--;
            localMinutes = 60;
          }
        } else {
          localMinutes--;
          localSeconds = 60;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hour = localHours;
        digitSeconds = (seconds >= 10) ? '$seconds' : "0$seconds";
        digitMinutes = (minutes >= 10) ? '$minutes' : "0$minutes";
        digitHours = (hour >= 10) ? '$hour' : "0$hour";
        digitDays = (day >= 10) ? '$day' : "0$day";
        print(timer);
      });
    });
  }

  @override
  void initState() {
    start();
    super.initState();
  }


  @override
  void dispose() {
    // Cancel the timer to prevent memory leaks
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Scrollbar(

        child: GlowingOverscrollIndicator(

          axisDirection: AxisDirection.down,

           color: const Color.fromRGBO(51, 40, 88, 1),
          child: SingleChildScrollView(
          
            child: Container(
              padding: EdgeInsets.only(bottom: 2.h),
              child: Column(
                children: [
                  const Search_Filter(),
                  const ImageSlider(),
                   const CategorySection1(),
                   const CategorySection2(),
                  CycloneOfferSection(
                      digitDays: digitDays,
                      digitHours: digitHours,
                      digitMinutes: digitMinutes,
                      digitSeconds: digitSeconds),
                  ThemeSwitch(switchValue: switchValue),
                  TopProductsSection(
                      digitDays: digitDays,
                      digitHours: digitHours,
                      digitMinutes: digitMinutes,
                      digitSeconds: digitSeconds),
                  const DiscountSection(),
                  const WeeklyBestSellerSection(),
                  const DiscountSection2(),
                  const Featuredproductssection(),
          
          
                  CollectionsSection(),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}



