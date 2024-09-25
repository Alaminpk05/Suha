import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/bottom_nav_bar/tabapges.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/topproductswithcountdownCard.dart';

import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/global_widgets/custom_simple_appbar.dart';
import 'package:shuhaui/utils/global_widgets/horizontal_prduct_lis.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';


class ShopGrid extends StatefulWidget {
  // final String digitDays;
  // final String digitHours;
  // final String digitMinutes;
  // final String digitSeconds;
  const ShopGrid({
    super.key,
    // required this.digitDays,
    // required this.digitHours,
    // required this.digitMinutes,
    // required this.digitSeconds
  });

  @override
  State<ShopGrid> createState() => _ShopGridState();
}

class _ShopGridState extends State<ShopGrid> {
  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    var tablet = ResponsiveHelper.isTablet(context);
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(mobile ? kToolbarHeight : 5.5.h),
        child: CustomSimpleAppBar(
          title: 'Shop Grid',
          navigation: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (cxt) => const Bottompage()));
          },
          widget: const CircleMenu(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HorizontalProductList(mobile: mobile),
            SizedBox(
              height: 4.h,
            ),
            ProductsGridView(mobile: mobile, tablet: tablet),
          ],
        ),
      ),
    ));
  }
}



class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.mobile,
    required this.tablet,
    this.scrollPhysics,
  });

  final bool mobile;
  final bool tablet;
  final ScrollPhysics? scrollPhysics;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GridViewWidget(
            scrollPhysics: scrollPhysics, mobile: mobile, tablet: tablet),
      ),
    );
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.scrollPhysics,
    required this.mobile,
    required this.tablet,
  });

  final ScrollPhysics? scrollPhysics;
  final bool mobile;
  final bool tablet;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: scrollPhysics,
        itemCount: 20,
        gridDelegate: const 
        SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return topProductwithtime(
              name: "Beach Cap",
              image: "assets/11.png",
              miniButtonword: "Sale",
              miniButtoncolor: const Color.fromRGBO(255, 175, 0, 1),
              color: Colors.black,
              digitDays: '150',
              digitHours: '24',
              digitMinutes: '24',
              digitSeconds: '24',
              mobile: mobile,
              tablet: tablet, width: mobile?45.w:30.w);
        });
  }
}
//116,119,148