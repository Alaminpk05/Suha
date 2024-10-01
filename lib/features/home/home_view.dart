import 'dart:async';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/SectionWidgets/discount2.dart';
import 'package:shuhaui/features/home/Widgets/SectionWidgets/featuredproductsSection.dart';
import 'package:shuhaui/features/home/data/model/category.dart';
import 'package:shuhaui/features/home/data/model/collections.dart';
import 'package:shuhaui/features/home/data/model/cycloneoffer.dart';
import 'package:shuhaui/features/home/data/model/fetured_product.dart';
import 'package:shuhaui/features/home/data/model/top_product.dart';
import 'package:shuhaui/features/home/data/model/weekly_product.dart';
import 'package:shuhaui/features/home/data/repository/load_product_data.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/dependency_injection/dependency_setup.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

import 'Widgets/SectionWidgets/category_section.dart';
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

  bool isLoading = true;

  /// GET IT
  late Future<List<CategoryModel>> categoryList;
  late Future<List<CycloneOfferModel>> cycloneProductList;
  late Future<List<TopProductModel>> topProductList;
  late Future<List<WeeklyProductModel>> weeklyProductList;
  late Future<List<FeaturedProductModel>> featuredProductList;
  late Future<List<CollectionsModel>> collectionProductList;



  @override
  void initState() {
    // loadData();
    start();
    categoryList = getIt<ProductService>().fetchCategoryList();
    cycloneProductList = getIt<ProductService>().fetchCycloneProductList();
    topProductList = getIt<ProductService>().fetchTopProductList();
    weeklyProductList = getIt<ProductService>().fetchweeklyProductListt();
    featuredProductList = getIt<ProductService>().fetchFeaturedProductList();
    collectionProductList = getIt<ProductService>().fetchCllectionProductList();



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
    var mobile = ResponsiveHelper.isMobile(context);
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Padding(
        padding: ResponsiveHelper.isMobile(context)
            ? EdgeInsets.only(
                top: oneHeightPad, left: homeMobLP, right: homeMobRP)
            : EdgeInsets.only(
                top: oneHeightPad, left: homeTabLP, right: homeTabRP),
        child: Scrollbar(
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: const Color.fromRGBO(51, 40, 88, 1),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: 2.h),
                child: Column(
                  children: [
                    const Search_Filter(),
                    SizedBox(height: 2.h),
                     const ImageSlider(),
                    SizedBox(height: 2.h),
                    CategorySection(
                      categorylist: categoryList,
                    ),
                    SizedBox(height: 1.5.h),
                    CycloneOfferSection(
                      digitDays: digitDays,
                      digitHours: digitHours,
                      digitMinutes: digitMinutes,
                      digitSeconds: digitSeconds,
                      offerProductList: cycloneProductList,
                    ),
                    SizedBox(height: mobile ? 2.h : 0.h),
                    ThemeSwitch(switchValue: switchValue),
                    SizedBox(height: 0.8.h),
                    TopProductsSection(
                      topProductList: topProductList,
                    ),
                    SizedBox(height: 2.h),
                    const DiscountSection(),
                    SizedBox(height: 1.h),
                    WeeklyBestSellerSection(
                      weeklyproductList: weeklyProductList,
                    ),
                    SizedBox(height: 2.h),
                    const DiscountSection2(),
                    SizedBox(height: 1.h),
                    Featuredproductssection(
                      featuredProductList: featuredProductList,
                    ),
                    SizedBox(height: 0.5.h),
                    const CollectionsSection(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
