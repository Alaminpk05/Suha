import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/data/model/top_product.dart';
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
    required this.topProductList,
  });
  final List<TopProduct> topProductList;
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
                screen: const ShopGrid(), withNavBar: true);
          },
        ),
        SizedBox(
          height: mobile ? 1.h : 1.5.h,
        ),
        SizedBox(
          height: mobile?87.h:44.h,
          width: double.infinity,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: topProductList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 2.w
                    ,mainAxisSpacing: 1.h
                    ,
                    
                    
                    crossAxisCount: 2),
              itemBuilder: (contex, index) {
                final item = topProductList[index];
                return topProductList[index].istimer == true
                    ? topProductwithtime(
                        name: item.title,
                        image: item.imageUrl,
                        miniButtonword: item.minibuttonword,
                        miniButtoncolor: const Color.fromRGBO(255, 175, 0, 1),
                        textcolor: Colors.white,
                        digitDays: digitDays,
                        digitHours: digitHours,
                        digitMinutes: digitMinutes,
                        digitSeconds: digitSeconds,
                        mobile: mobile,
                        tablet: tablet,
                        width: mobile ? 45.w : 30.w)
                    : topProductwithouttime(
                        name: item.title,
                        photo: item.imageUrl,
                        minibuttoncolor: const Color.fromRGBO(255, 175, 0, 1),
                        minibuttonword2:item.minibuttonword,
                        mobile: mobile,
                        textcolor: Colors.white,
                        tablet: tablet,
                        width: mobile ? 45.w : 30.w);
              }),
        )
      ],
    );
  }
}
