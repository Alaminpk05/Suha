import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/cycloneofferCard.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({super.key});

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
          padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
          child: GridView.builder(
              itemCount: 6,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 1.945),
              itemBuilder: (context, index) {
                return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      var item = cycloneOfferItems[index];
                      return CycloneOfferWidget(
                        value: item['value'],
                        asset: item['asset'],
                        title: item['title'],
                      );
                    }));
              })),
    );
  }
}
