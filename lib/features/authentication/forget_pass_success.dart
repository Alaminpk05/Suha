import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/authentication/otp_send.dart';
import 'package:shuhaui/features/bottom_nav_bar/tabapges.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/constant/static.dart';
import 'package:shuhaui/utils/global_widgets/elevated_text_button.dart';

class ForgetPassStatusPage extends StatelessWidget {
  const ForgetPassStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalpad10),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/circle-dashed-check.png',
                color: Colors.greenAccent,
                scale: 5,
              ),
              SizedBox(
                height: 3.h,
              ),
              textwidget(
                  text: 'Password recovery email is sent',
                  fontszie: textsize14,
                  fonweight: fontWeight400,
                  color: authPageTextColor),
              textwidget(
                  text: 'successfully. Please check your inbox!',
                  fontszie: textsize14,
                  fonweight: fontWeight400,
                  color: authPageTextColor),
              SizedBox(
                height: 1.5.h,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (c) => const Bottompage()));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                    decoration: BoxDecoration(
                      color: authButtonColor,
                      borderRadius: BorderRadius.circular(10.px),
                    ),
                    child: textwidget(
                        text: "Go Home",
                        fontszie: 16.px,
                        fonweight: fontWeight500,
                        color: authButtonTextColor),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
