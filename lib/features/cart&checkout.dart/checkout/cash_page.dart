import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/authentication/change_password.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/billing_information.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/credit_page.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/payment_success.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/constant/static.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class CashPage extends StatelessWidget {
  const CashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool mobile = ResponsiveHelper.isMobile(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Cash Info', widget: MenuWidget()),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 0.5.h),
        padding: EdgeInsets.symmetric(horizontal: mobile?fivePad:homeTabLP),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CheckOutImage(),
            AlignCenterTextWidget(
                text: 'Pay when you receive your products. Lorem ipsum dolor sit amet consectetur adipisicing elit. Et qui nam perferendis.',
                fontsize: mobile ? textsize14 : textsize20,
                fontWeight: fontWeight400, color: productColor.withOpacity(0.5),),
            SizedBox(
              height: 1.5.h,
            ),
            ContainerTextButton(
                text: "Order Now",
                height: 4.5.h,
                fontsize: mobile?16.px:24.px,
                titleColor: productColor,
                width: double.infinity)
          ],
        ),
      ),
    );
  }
}
