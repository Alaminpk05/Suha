import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/authentication/otp_confirmation.dart';
import 'package:shuhaui/features/authentication/privacy_policy.dart';
import 'package:shuhaui/features/authentication/term_of_service.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/global_widgets/elevated_text_button.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class OTPSendPage extends StatefulWidget {
  const OTPSendPage({super.key});

  @override
  State<OTPSendPage> createState() => _OTPSendPageState();
}

class _OTPSendPageState extends State<OTPSendPage> {
  final isOpen = false;

  final numberTextSize = 14.px;

  final popupitemheight = 4.h;
  final FocusNode focusNode = FocusNode();

  String selectedValue = '';
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool mobile = ResponsiveHelper.isMobile(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textwidget(
                text: 'Phone Verification',
                fontszie: 20.px,
                fonweight: FontWeight.w600,
                color: authPageTextColor),
            textwidget(
                text: "We will send you an OTP on this phone number.",
                fontszie: 14.px,
                fonweight: FontWeight.w400,
                color: authPageTextColor),
            SizedBox(
              height: 6.h,
            ),
            Container(
              height: 5.5.h,
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                  color: authPageTextColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.px)),
              child: Row(
                children: [
                  PopupMenuButton(
                    clipBehavior: Clip.hardEdge,
                    shadowColor: scaffoldColor,
                    color: authPageTextColor,
                    offset: const Offset(-10, 50),
                    onSelected: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    itemBuilder: (contex) {
                      return [
                        PopupMenuItem(
                            height: popupitemheight,
                            value: '880',
                            child: textwidget(
                                text: "+880",
                                fontszie: numberTextSize,
                                fonweight: FontWeight.w500,
                                color: authButtonTextColor)),
                        PopupMenuItem(
                            height: popupitemheight,
                            value: '62',
                            child: textwidget(
                                text: "+62",
                                fontszie: numberTextSize,
                                fonweight: FontWeight.w500,
                                color: authButtonTextColor)),
                        PopupMenuItem<String>(
                          height: popupitemheight,
                          value: '91',
                          child: textwidget(
                              text: '+91',
                              fontszie: numberTextSize,
                              fonweight: FontWeight.w500,
                              color: textColor),
                        ),
                        PopupMenuItem(
                            height: popupitemheight,
                            value: '60',
                            child: textwidget(
                                text: "+60",
                                fontszie: numberTextSize,
                                fonweight: FontWeight.w500,
                                color: authButtonTextColor)),
                        PopupMenuItem<String>(
                          height: popupitemheight,
                          value: '198',
                          child: textwidget(
                              text: '+198',
                              fontszie: numberTextSize,
                              fonweight: FontWeight.w500,
                              color: textColor),
                        ),
                      ];
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            child: textwidget(
                                text: selectedValue == ''
                                    ? '+880'
                                    : "+$selectedValue",
                                fontszie: 14.px,
                                fonweight: FontWeight.w600,
                                color: authPageTextColor),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          SizedBox(
                              height: 5.h,
                              width: mobile ? 3.w : 2.5.w,
                              child: isOpen == false
                                  ? Image.asset(
                                      'assets/chevron-down.png',
                                      color: authPageTextColor,
                                      fit: BoxFit.contain,
                                    )
                                  : Image.asset(
                                      'assets/chevron-up.png',
                                      color: authPageTextColor,
                                      fit: BoxFit.contain,
                                    ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Flexible(
                    child: TextFormField(
                      focusNode: focusNode,
                      controller: numberController,
                      cursorColor: authPageTextColor,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: numberTextSize,
                          color: authPageTextColor,
                          fontWeight: FontWeight.w500),
                      cursorHeight: 1.7.h,
                      cursorWidth: 0.2.w,
                      decoration: InputDecoration(
                        hintText: 'Enter phone number',
                        hintStyle: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: numberTextSize,
                            fontWeight: FontWeight.w400,
                            color: authPageTextColor.withOpacity(0.15)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            ElevatedTextButton(
                text: "Sent OTP",
                elevation: 0,
                
                fontsize: 17.px,
                fontWeight: FontWeight.w500,
                height: 5.h,
                width: double.infinity,
                radius: 10.px,
                buttoncolor: addButtonColor,
                textcolor: authButtonTextColor,
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) =>  OTPConfirmationPage()));
                }),
            SizedBox(
              height: 2.h,
            ),
            RichText(
                text: TextSpan(children: [
              textSpanwidget(
                  'By providing my phone number, I hereby agree the ',
                  FontWeight.w400,
                  numberTextSize,
                  null),
              textSpanwidget('Term of Services ', FontWeight.w700, 15.px, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => const TermOfServicePage()));
              }),
              textSpanwidget('and ', FontWeight.w400, numberTextSize, null),
              textSpanwidget('Privacy Policy', FontWeight.w700, 15.px, () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (c) => const PrivacyPolicyPage()));
              }),
            ]))
          ],
        ),
      ),
    );
  }


}


  TextSpan textSpanwidget(String text, FontWeight fontweight, double fontsize,
      void Function()? ontap) {
    return TextSpan(
      recognizer:
          ontap != null ? (TapGestureRecognizer()..onTap = ontap) : null,
      text: text,
      style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: fontsize,
          fontWeight: fontweight,
          color: authPageTextColor),
    );
  }
