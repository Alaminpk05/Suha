import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/authentication/change_password.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/billing_information.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/credit_page.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/constant/static.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';

class CashPage extends StatelessWidget {
  const CashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  CustomAppBar(title: 'Cash Info', widget: MenuWidget()),
      body:Container(
        alignment: Alignment.center,
         margin: EdgeInsets.symmetric(vertical: 0.5.h),
            padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CheckOutImage(),
            SizedBox(height: 1.5.h,),
            textwidget(text: '''Pay when you receive your products. Lorem ipsum\ndolor sit amet consectetur adipisicing elit. Et qui nam.''', 
            
            fontszie: textsize14, fonweight: fontWeight400, color: productColor),
            textwidget(text: 'perferendis.', 
            
            fontszie: textsize14, fonweight: fontWeight400, color: productColor),
            SizedBox(height: 1.5.h,),
            ContainerTextButton(text: "Order Now",
             height: 4.5.h,
              fontsize: 16.px, 
              titleColor: productColor,
               width: double.infinity)
          ],
        ),
      ),
    );
  }
}