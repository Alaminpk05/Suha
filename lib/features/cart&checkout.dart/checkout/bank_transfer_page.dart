import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/billing_information.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/credit_page.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/payment_success.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/constant/static.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class BankTransferPage extends StatefulWidget {
  const BankTransferPage({super.key});

  @override
  State<BankTransferPage> createState() => _BankTransferPageState();
}

class _BankTransferPageState extends State<BankTransferPage> {
  final TextEditingController bankNameController = TextEditingController();

  final TextEditingController accountNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool mobile = ResponsiveHelper.isMobile(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Bank Info', widget: MenuWidget()),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: mobile ? fivePad : homeTabLP),
          child: Column(
            children: [
              const CheckOutImage(),
              textwidget(
                  text:
                      'Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order wont be shipped until the funds have cleared in our account.',
                  fontszie: mobile ? 14.px : 20.px,
                  fonweight: fontWeight400,
                  color: productColor.withOpacity(0.5)),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 1.5.h,
                ),
                width: double.infinity,
                height: 10.h,
                decoration: BoxDecoration(
                  color: productColor,
                  borderRadius: BorderRadius.circular(8.px),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BankInfoTextField(
                      bankName: 'Bank Name',
                      hintText: 'Example Bank Ltd.',
                      controller: bankNameController,
                    ),
                    Divider(
                      color: grayColor,
                      thickness: 0.5,
                    ),
                    BankInfoTextField(
                      bankName: 'Account Number',
                      hintText: '010 2125 32563 2525',
                      controller: accountNumberController,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              ContainerTextButton(
                  ontap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (c) => PaymentSuccessPage()));
                  },
                  text: 'Order Now',
                  height: 4.5.h,
                  fontsize: mobile?16.px:24.px
                  ,
                  titleColor: textColor,
                  width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}

class BankInfoTextField extends StatefulWidget {
  const BankInfoTextField({
    super.key,
    required this.bankName,
    required this.hintText,
    required this.controller, 
  });
  final String bankName;
  final String hintText;
  final TextEditingController controller;


  @override
  State<BankInfoTextField> createState() => _BankInfoTextFieldState();
}

class _BankInfoTextFieldState extends State<BankInfoTextField> {
  @override
  Widget build(BuildContext context) {
      final bool mobile=ResponsiveHelper.isMobile(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      height: 3.2.h,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textwidget(
              text: widget.bankName,
              fontszie:mobile?14.px:20.px,
              fonweight: fontWeight400,
              color: textColor),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              cursorColor: textColor,
              cursorWidth: 1,
              cursorHeight: 15,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(bottom: 2.h, left: 2.w, right: 2.w),
                  border: InputBorder.none),
              style: TextStyle(
                fontSize:mobile? 14.px:20.px,
                fontWeight: fontWeight500,
              ),
            ),
          ),
          SizedBox(
            width: 1.w,
          ),
          textwidget(
              text: widget.hintText,
              fontszie: mobile?14.px:20.px,
              fonweight: fontWeight400,
              color: textColor)
        ],
      ),
    );
  }
}
