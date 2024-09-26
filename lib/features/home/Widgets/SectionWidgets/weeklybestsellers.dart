// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/data/model/weekly_product.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

import '../../../../utils/constant.dart';
import '../singlewidgets/viewallButton.dart';
import '../singlewidgets/weeklybestsellerscard.dart';

class WeeklyBestSellerSection extends StatelessWidget {
  const WeeklyBestSellerSection({
    super.key,
    required this.weeklyproductList,
  });
  final List<WeeklyProduct> weeklyproductList;

  @override
  Widget build(BuildContext context) {
    var Mobile = ResponsiveHelper.isMobile(context);
    var Tablet = ResponsiveHelper.isTablet(context);
    return Column(
      children: [
        ViewProductlist(
          productListviewTitle: 'Weekly Best Sellers',
          ontab: () {},
        ),
        SizedBox(
          height: Mobile ? 1.h : 1.5.h,
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Column(
              children: [
                WeeklyProductsCard(
                  image: images[index],
                  title: tilteList[index],
                  icon: 'assets/heart (3).png',
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
