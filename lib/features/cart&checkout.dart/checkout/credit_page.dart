import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/billing_information.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/constant/static.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';

class CreditPage extends StatefulWidget {
  const CreditPage({super.key});

  @override
  State<CreditPage> createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController creditCardController = TextEditingController();
  final TextEditingController cardHolderNameController = TextEditingController();
  final TextEditingController expDateController = TextEditingController();
  final TextEditingController cvvCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppBar(title: 'Credit - COD', widget: MenuWidget()),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 0.5.h),
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CheckOutImage(),
               TextfieldWithLearnMoreButton(
                title: 'Credit Card Number',
                hintText: '1234 xxxx xxxx xxxx',
                secureText: 'Your payment info is stored securely.',
                controller:creditCardController,
              ),
              SizedBox(
                height: 1.5.h,
              ),
               CheckOutTextField(
                title: "Cardholder Name",
                hintText: 'SUHA JANNAT',
                width: double.infinity,
                controller: cardHolderNameController,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheckOutTextField(
                    title: "Exp .Date",
                    hintText: '12/20',
                    width: 35.w,
                    controller: expDateController,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  CheckOutTextField(
                    title: " CVV Code",
                    hintText: 'xxxx',
                    width: 35.w,
                    controller: cvvCodeController,
                  ),
                ],
              ),
              SizedBox(
                height: 1.5.h,
              ),
              ContainerTextButton(
                  text: 'Pay Now',
                  height: 4.5.h,
                  fontsize: 16.px,
                  titleColor: productColor,
                  width: double.infinity),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckOutImage extends StatelessWidget {
  const CheckOutImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/transfer.png',
          scale: 1,
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}

class TextfieldWithLearnMoreButton extends StatelessWidget {
  const TextfieldWithLearnMoreButton({
    super.key,
    required this.title,
    required this.hintText,
    required this.secureText,
    required this.controller,
  });
  final String title;
  final String hintText;
  final String secureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckOutTextField(
          title: title,
          hintText: hintText,
          width: double.infinity,
          controller: controller,
        ),
        SizedBox(
          height: 0.5.h,
        ),
        Row(
          children: [
            Image.asset(
              'assets/icons/lock-square-rounded (1).png',
              color: productColor.withOpacity(0.5),
              scale: 16.px,
            ),
            SizedBox(
              width: 1.w,
            ),
            textwidget(
                text: secureText,
                fontszie: 12.px,
                fonweight: fontWeight400,
                color: productColor.withOpacity(0.5)),
            GestureDetector(
              onTap: () {},
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: textwidget(
                    text: ' Learn More',
                    fontszie: textsize12,
                    fonweight: fontWeight600,
                    color: addButtonColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CheckOutTextField extends StatefulWidget {
  const CheckOutTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.width,
    required this.controller,
  });
  final TextEditingController controller;
  final String title;
  final String hintText;
  final double width;

  @override
  State<CheckOutTextField> createState() => _CheckOutTextFieldState();
}

class _CheckOutTextFieldState extends State<CheckOutTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textwidget(
            text: widget.title,
            fontszie: 16.px,
            fonweight: fontWeight500,
            color: productColor),
        SizedBox(
          width: widget.width,
          child: TextFormField(
            controller: widget.controller,
            onTap: () {},
            cursorColor: textColor,
            cursorWidth: 1,
            cursorHeight: 2.h,
            decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: grayColor,
                    fontFamily: 'Poppinis',
                    fontWeight: fontWeight400,
                    fontSize: textsize14),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                filled: true,
                fillColor: productColor,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.px))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.px)),
                    borderSide: BorderSide(
                      color: addButtonColor,
                    ))),
          ),
        )
      ],
    );
  }
}

// Extracted Custom AppBar Widget

