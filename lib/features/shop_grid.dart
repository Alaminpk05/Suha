import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/bottom_nav_bar/tabapges.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/topproductswithcountdownCard.dart';
import 'package:shuhaui/utils/global_widgets/custom_simple_appbar.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

import 'home/Widgets/singlewidgets/categorybuttonwidget.dart';
import 'home/Widgets/singlewidgets/textwidget.dart';
import 'home/Widgets/singlewidgets/topProductwithouttime.dart';

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
    var tablet=ResponsiveHelper.isTablet(context);
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
            body:Padding(
              padding: const EdgeInsets.symmetric(),
              child: Column(
                children: [



                  SizedBox(height:2.h),
                  ListView.builder(
                    shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context,index){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        topProductwithtime(
                            name: "Beach Cap",
                            image: "assets/11.png",
                            miniButtonword: "Sale",
                            miniButtoncolor: const Color.fromRGBO(255, 175, 0, 1),
                            color: Colors.black,
                            digitDays: '150',
                            digitHours: '24',
                            digitMinutes: '24',
                            digitSeconds: '24',
                            mobile: mobile,
                            tablet: tablet),
                        topProductwithouttime(
                            name: 'Wooden Sofa',
                            photo: "assets/5.png",
                            color: const Color.fromRGBO(0, 184, 148, 1),
                            minibuttonword2: 'New',
                            mobile: mobile,
                            tablet: tablet,
                            textcolor: Colors.white),
                      ],
                    );
                  }),
                ],
              ),
            )










        ));
  }
}
