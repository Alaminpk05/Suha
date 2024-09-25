import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/cycloneofferCard.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/featuredproducts.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class FeaturedProductList extends StatelessWidget {
  const FeaturedProductList({super.key});

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    return Scaffold(
      appBar: PreCustomAppBar(
          mobile,
          context,
          () {},
          'Flash Sale',
          filterwidget(
            mobile: mobile,
          )),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.w),
          child: GridView.builder(
              itemCount: 6,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.1,
              ),
              itemBuilder: (context, index) {
                return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      var item = cycloneOfferItems[index];
                      return FeaturedProducts(
                        image: 'assets/14.png',
                        title: 'Blue Skateboard',
                        newprice: '39',
                        oldprice: '89',
                        ontap: () {},
                      );
                    }));
              })),
    );
  }
}
