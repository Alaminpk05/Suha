import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/bottom_nav_bar/tabapges.dart';
import 'package:shuhaui/features/home/Widgets/SectionWidgets/category.dart';
import 'package:shuhaui/features/pages/widgets/button_widgets.dart';
import 'package:shuhaui/features/shop_grid.dart';
import 'package:shuhaui/utils/constant.dart';

import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({super.key});

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    var tablet = ResponsiveHelper.isTablet(context);
    return Scaffold(
        appBar: PreCustomAppBar(mobile, context, () {
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => const Bottompage()));
        },
            'Product Category',filterwidget(mobile: mobile)),
        body: SingleChildScrollView(
          child: Padding(
            padding: ResponsiveHelper.isMobile(context)
                ? EdgeInsets.only(
                    top: widgetTopPad, left: homeMobLP, right: homeMobRP)
                : EdgeInsets.only(
                    top: widgetTopPad, left: homeTabLP, right: homeTabRP),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        image: const DecorationImage(
                            image: AssetImage(
                              'assets/5.jpg',
                            ),
                            fit: BoxFit.cover)),
                    height: 18.h,
                    width: 94.w,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: PagesTitleText(
                      title: 'Sub Category',
                      fontsize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const CategorySection1(),
                  SizedBox(
                    height: 0.7.h,
                  ),
                  const CategorySection2(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: PagesTitleText(
                      title: 'Products',
                      fontsize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  GridViewWidget(
                    mobile: mobile,
                    tablet: tablet,
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                  )
                ],
              ),
            ),
          ),
        ));
  }


}

