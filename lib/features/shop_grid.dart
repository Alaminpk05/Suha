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
  const ShopGrid({
    super.key,
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
    var tablet = ResponsiveHelper.isTablet(context);
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(mobile ? kToolbarHeight : 5.5.h),
              child: CustomSimpleAppBar(
                  title: 'Shop Grid',
                  navigation: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (cxt) => const Bottompage()));
                  }),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 60.w,
                    height: 3.7.h,
                    color: const Color.fromRGBO(12, 21, 59, 1),
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (contex, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 1.5.w),
                         
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.sp),
                            color: const Color.fromRGBO(51, 40, 88, 1),
                          ),
                          width: 23.w,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 3.5.h,
                                width: 4.w,
                                child: Image.asset(
                                  'assets/5.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                width: 0.7.w,
                              ),
                              textwidget(
                                  text: 'Black Shoe',
                                  fontszie: 13.sp,
                                  fonweight: FontWeight.w700,
                                  color: Colors.white)
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 2.h,),
            
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        itemCount: 20,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                           
                              crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return topProductwithtime(
                                                      name: "Beach Cap",
                                                      image: "assets/11.png",
                                                      miniButtonword: "Sale",
                                                      miniButtoncolor:
                            const Color.fromRGBO(255, 175, 0, 1),
                                                      color: Colors.black,
                                                      digitDays: '150',
                                                      digitHours: '24',
                                                      digitMinutes: '24',
                                                      digitSeconds: '24',
                                                      mobile: mobile,
                                                      tablet: tablet);
                          }),
                    ),
                  ),
            
                 
                ],
              ),
            )));
  }
}
