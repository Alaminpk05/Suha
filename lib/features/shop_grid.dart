import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/bottom_nav_bar/tabapges.dart';
import 'package:shuhaui/utils/global_widgets/custom_simple_appbar.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class ShopGrid extends StatefulWidget {
  // final String digitDays;
  // final String digitHours;
  // final String digitMinutes;
  // final String digitSeconds;
  const ShopGrid(
      {super.key,
      // required this.digitDays,
      // required this.digitHours,
      // required this.digitMinutes,
      // required this.digitSeconds

      });

  @override
  State<ShopGrid> createState() => _ShopGridState();
}

class _ShopGridState extends State<ShopGrid> {
  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(mobile ? kToolbarHeight : 5.5.h),
              child: CustomSimpleAppBar(
                  title: 'Shop Grid',
                  navigation: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (cxt) => const Tabapges()));
                  }),
            ),
            body: Container()));
  }
}
