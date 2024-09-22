import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/shop_grid.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

import '../singlewidgets/topProductwithouttime.dart';
import '../singlewidgets/topproductswithcountdownCard.dart';
import '../singlewidgets/viewallButton.dart';

class TopProductsSection extends StatelessWidget {
  const TopProductsSection({
    super.key,
    required this.digitDays,
    required this.digitHours,
    required this.digitMinutes,
    required this.digitSeconds,
  });

  final String digitDays;
  final String digitHours;
  final String digitMinutes;
  final String digitSeconds;

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    var tablet = ResponsiveHelper.isTablet(context);
    return Column(
      children: [
        ViewProductlist(
          productListviewTitle: 'Top Products',
          ontab: () {
            PersistentNavBarNavigator.pushNewScreen(context,
                screen: const ShopGrid(),
                withNavBar: true);
          },
        ),
        SizedBox(
          height: mobile ? 1.h : 1.5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            topProductwithtime(
                name: "Beach Cap",
                image: "assets/11.png",
                miniButtonword: "Sale",
                miniButtoncolor: const Color.fromRGBO(255, 175, 0, 1),
                color: Colors.black,
                digitDays: digitDays,
                digitHours: digitHours,
                digitMinutes: digitMinutes,
                digitSeconds: digitSeconds,
                mobile: mobile,
                tablet: tablet),
            SizedBox(
              width: 2.7.w,
            ),
            topProductwithouttime(
                name: 'Wooden Sofa',
                photo: "assets/5.png",
                color: const Color.fromRGBO(0, 184, 148, 1),
                minibuttonword2: 'New',
                mobile: mobile,
                tablet: tablet,
                textcolor: Colors.white),
            if (tablet)
              SizedBox(
                width: 2.7.w,
              ),
            if (tablet)
              topProductwithouttime(
                  name: "Roof Lamp",
                  photo: "assets/6.png",
                  color: const Color.fromRGBO(0, 184, 148, 1),
                  minibuttonword2: 'New',
                  mobile: mobile,
                  tablet: tablet,
                  textcolor: Colors.white),
          ],
        ),
        SizedBox(
          height: 1.4.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            mobile
                ? topProductwithouttime(
                    name: "Roof Lamp",
                    photo: "assets/6.png",
                    color: const Color.fromRGBO(0, 184, 148, 1),
                    minibuttonword2: 'New',
                    mobile: mobile,
                    tablet: tablet,
                    textcolor: Colors.white)
                : topProductwithtime(
                    name: "Sneaker Shoes",
                    image: "assets/9.png",
                    miniButtonword: "-18%",
                    miniButtoncolor: Colors.redAccent,
                    color: Colors.white,
                    digitDays: digitDays,
                    digitHours: digitHours,
                    digitMinutes: digitMinutes,
                    digitSeconds: digitSeconds,
                    mobile: mobile,
                    tablet: tablet),

            SizedBox(
              width: 2.7.w,
            ),
            topProductwithouttime(
                name: 'Wooden Sofa',
                photo: "assets/8.png",
                color: Colors.redAccent,
                minibuttonword2: '-11%',
                mobile: mobile,
                tablet: tablet,
                textcolor: Colors.white),
            SizedBox(
              width: mobile ? 0.w : 1.5.w,
            ),
            if (tablet)
              topProductwithouttime(
                  name: 'Wooden Sofa',
                  photo: "assets/4.png",
                  color: const Color.fromRGBO(255, 175, 0, 1),
                  minibuttonword2: 'Sale',
                  mobile: mobile,
                  tablet: tablet,
                  textcolor: Colors.black),
            // SizedBox(
            //   width: 1.3.w,
            // ),
          ],
        ),
      ],
    );
  }
}
