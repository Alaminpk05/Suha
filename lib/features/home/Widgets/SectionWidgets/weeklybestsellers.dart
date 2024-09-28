// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/data/model/weekly_product.dart';
import 'package:shuhaui/features/shop_list.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

import '../../../../utils/constant.dart';
import '../singlewidgets/viewallButton.dart';
import '../singlewidgets/weeklybestsellerscard.dart';

class WeeklyBestSellerSection extends StatelessWidget {
  const WeeklyBestSellerSection({
    super.key,
    required this.weeklyproductList,
  });
  final Future<List<WeeklyProductModel>> weeklyproductList;

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);

    return Column(
      children: [
        ViewProductlist(
          productListviewTitle: 'Weekly Best Sellers',
          ontab: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (c) =>
                        const ShopList()));
          },
        ),
        SizedBox(
          height: mobile ? 1.h : 1.5.h,
        ),
        WeeklyProductList(weeklyproductList: weeklyproductList)
      ],
    );
  }
}

class WeeklyProductList extends StatelessWidget {
  const WeeklyProductList({
    super.key,
    required this.weeklyproductList,
  });

  final Future<List<WeeklyProductModel>> weeklyproductList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: weeklyproductList,
      builder: (c, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No categories found'));
        }
        final weeklyProductList = snapshot.data!;
        return ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: weeklyProductList.length,
          itemBuilder: (context, index) {
            final item = weeklyProductList[index];
            return Column(
              children: [
                WeeklyProductsCard(
                  image: item.image,
                  title: item.name,
                  icon: 'assets/heart (3).png',
                ),
              ],
            );
          },
        );
      },
    );
  }
}
