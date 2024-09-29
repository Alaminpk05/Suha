import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/data/model/top_product.dart';
import 'package:shuhaui/features/shop_grid.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

import '../singlewidgets/topProductwithouttime.dart';
import '../singlewidgets/topproductswithcountdownCard.dart';
import '../singlewidgets/viewallButton.dart';

class TopProductsSection extends StatelessWidget {
  const TopProductsSection({
    super.key,
    required this.topProductList,
  });
  final Future<List<TopProductModel>> topProductList;

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    var tablet = ResponsiveHelper.isTablet(context);
    return Column(
      children: [
        ViewProductlist(
          productListviewTitle: 'Top Products',
          ontab: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ShopGrid()));
          },
        ),
        SizedBox(
          height: mobile ? 1.h : 1.5.h,
        ),
        TopProductList(
            mobile: mobile, topProductList: topProductList, tablet: tablet, childratio: mobile ? 0.75 : 0.675,)
      ],
    );
  }
}

class TopProductList extends StatelessWidget {
  const TopProductList({
    super.key,
    required this.mobile,
    required this.topProductList,
    required this.tablet, required this.childratio,
  });

  final bool mobile;
  final Future<List<TopProductModel>> topProductList;
  final String digitDays = '150';
  final String digitHours = '24';
  final String digitMinutes = '60';
  final String digitSeconds = '60';
  final bool tablet;
  final double childratio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mobile ? 87.h : 44.h,
      width: double.infinity,
      child: FutureBuilder(
        future: topProductList,
        builder: (contex, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No categories found'));
          }
          final topProductList = snapshot.data!;
          return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: topProductList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: childratio,
                  crossAxisSpacing: mobile ? 2.w : 1.5.w,
                  mainAxisSpacing: 1.h,
                  crossAxisCount: mobile ? 2 : 3),
              itemBuilder: (contex, index) {
                final item = topProductList[index];
                return topProductList[index].istimer == true
                    ? topProductwithtime(
                        name: item.title,
                        image: item.imageUrl,
                        miniButtonword: item.minibuttonword,
                        miniButtoncolor:  Color.fromRGBO(24,179,210,1),

                        textcolor: Colors.black,
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
                        minibuttonword2: item.minibuttonword,
                        mobile: mobile,
                        textcolor: textColor,
                        tablet: tablet,
                        width: mobile ? 45.w : 30.w);
              });
        },
      ),
    );
  }
}
