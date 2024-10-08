import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/bottom_nav_bar/tabapges.dart';
import 'package:shuhaui/features/home/Widgets/SectionWidgets/category_section.dart';
import 'package:shuhaui/features/home/Widgets/SectionWidgets/topproducts.dart';
import 'package:shuhaui/features/home/data/model/category.dart';
import 'package:shuhaui/features/home/data/model/top_product.dart';
import 'package:shuhaui/features/home/data/repository/load_product_data.dart';
import 'package:shuhaui/features/pages/widgets/button_widgets.dart';
import 'package:shuhaui/utils/constant/static.dart';
import 'package:shuhaui/utils/dependency_injection/dependency_setup.dart';

import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({
    super.key,
  });

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}




class _ProductCategoryState extends State<ProductCategory> {


late Future<List<CategoryModel>> categoryList;
late Future<List<TopProductModel>> topproductList;







  @override
  void initState() {
    super.initState();
    categoryList = getIt<ProductService>().fetchCategoryList();
    topproductList = getIt<ProductService>().fetchTopProductList();

  }

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    var tablet = ResponsiveHelper.isTablet(context);
    return Scaffold(
        appBar: PreCustomAppBar(mobile, context,  'Product Category', filterwidget(mobile: mobile)),
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

                    ),
                  ),
                  CategorySection(
                    categorylist: categoryList,
                  ),
                  SizedBox(
                    height: 0.7.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: PagesTitleText(
                      title: 'Products',
                      fontsize: 17.sp,
                      fontWeight: FontWeight.w700,
                     
                    ),
                  ),
                 TopProductList(mobile: mobile, topProductList: topproductList, tablet: tablet, childratio: mobile ? 0.75 : 0.675,)
                ],
              ),
            ),
          ),
        ));
  }
}
