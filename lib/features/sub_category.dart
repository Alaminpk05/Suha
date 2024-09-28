// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/bottom_nav_bar/tabapges.dart';
import 'package:shuhaui/features/home/Widgets/SectionWidgets/topproducts.dart';
import 'package:shuhaui/features/home/data/model/top_product.dart';
import 'package:shuhaui/features/home/data/repository/load_product_data.dart';
import 'package:shuhaui/features/pages/widgets/button_widgets.dart';
import 'package:shuhaui/features/shop_grid.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/dependency_injection/dependency_setup.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class SubProductCategory extends StatefulWidget {
  const SubProductCategory({
    super.key,
  });

  @override
  State<SubProductCategory> createState() => _SubProductCategoryState();
}

class _SubProductCategoryState extends State<SubProductCategory> {
  late Future<List<TopProductModel>> topProductlist;
  @override
  void initState() {

    super.initState();
    topProductlist = getIt<ProductService>().fetchTopProductList();
  }

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    var tablet = ResponsiveHelper.isTablet(context);
    return Scaffold(
        appBar: PreCustomAppBar(mobile, context, () {
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => const Bottompage()));
        }, 'Clothing', filterwidget(mobile: mobile)),
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
                      title: 'Sub Category Products',
                      fontsize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  TopProductList(mobile: mobile,
                   topProductList: topProductlist, tablet: tablet)
                ],
              ),
            ),
          ),
        ));
  }
}
