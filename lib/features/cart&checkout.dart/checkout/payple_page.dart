import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/billing_information.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/credit_page.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/constant/static.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class PaypalPage extends StatefulWidget {
  const PaypalPage({super.key});

  @override
  State<PaypalPage> createState() => _PaypalPageState();
}

class _PaypalPageState extends State<PaypalPage> {
  final TextEditingController paypalEmailController = TextEditingController();

  final TextEditingController paypalPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool mobile = ResponsiveHelper.isMobile(context);
    return Scaffold(
        appBar: const CustomAppBar(title: ' Paypal Info', widget: MenuWidget()),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 0.5.h),
            padding: EdgeInsets.symmetric(horizontal: mobile?5.w:homeTabLP),
            child: Column(
              children: [
                const CheckOutImage(),
                TextfieldWithLearnMoreButton(
                  title: 'Email Address',
                  hintText: 'paypale@example.com',
                  secureText: 'Secure online payments at the speed of want.',
                  controller: paypalEmailController,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textwidget(
                        text: "Password",
                        fontszie: mobile?16.px:20.px,
                        fonweight: fontWeight500,
                        color: productColor),
                    TextFormField(
                      onTap: () {},
                    
                      controller: paypalPasswordController,
                      cursorColor: textColor,
                      cursorWidth: 1,
                      cursorHeight: 2.h,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 3.w),
                          filled: true,
                          fillColor: productColor,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.px))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.px)),
                              borderSide: BorderSide(
                                color: addButtonColor,
                              ))),
                              style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: mobile?16.px:20.px,
                      fontWeight: FontWeight.normal

                    ),
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                ContainerTextButton(
                    text: 'Pay Now',
                    height: 4.5.h,
                    fontsize: mobile?16.px:24.px,
                    titleColor: textColor,
                    width: double.infinity)
              ],
            ),
          ),
        ));
  }
}
