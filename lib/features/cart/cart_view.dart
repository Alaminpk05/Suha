import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:shuhaui/features/bottom_nav_bar/tabapges.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/features/shop_grid.dart';

import 'package:shuhaui/utils/global_widgets/custom_simple_appbar.dart';
import 'package:shuhaui/utils/global_widgets/elevated_text_button.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class CartView extends StatelessWidget {
  final String title;
  const CartView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var mobile=ResponsiveHelper.isMobile(context);
    
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize:  Size.fromHeight(mobile?kToolbarHeight:5.5.h),
            child: CustomSimpleAppBar(
              title: 'My Cart',
              navigation: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>const ShopGrid()));
              },
            )),
            body: Column(
              
            
              children: [
                Align(
                  heightFactor: mobile?0.15.h:0.115.h,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      mobile?Image.asset('assets/empty-cart.png')
                      :SizedBox(
                        height: 19.h,
                        width: 60.w,
                        child:Image.asset('assets/empty-cart.png',fit: BoxFit.contain,) ,
                        ),
                      SizedBox(height: 2.h,),
                      textwidget(text: 'Your Bag is Empty',
                       fontszie: mobile?19.sp:17.7.sp,
                        fonweight: FontWeight.w700, color: Colors.white),
                         SizedBox(height: 2.2.h,),
                        ElevatedTextButton( text:'Go to Shop',
                         fontsize:mobile?15.sp:14.6.sp, fontWeight:  FontWeight.w600,
                          height: mobile?3.5.h:3.1.h, width: mobile?24.9.w:17.w, radius: mobile?10.sp:8.5.sp,)
                    ],
                  ),
                ),

              ],
            ),
      ),
    );
  }
}
