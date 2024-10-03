import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/authentication/login/login.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/global_widgets/elevated_text_button.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: EdgeInsets.only(top: 40.h, bottom: 5.h),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 13.5.h,
                width: 23.w,
                child: Image.asset(
                  'assets/logo-white.png',
                  fit: BoxFit.contain,
                ),
              ),
              ElevatedTextButton(
                text: 'Get Started',
                fontsize: 16.sp,
                fontWeight: FontWeight.w600,
                height: mobile ? 4.2.h : 4.5.h,
                width: mobile ? 60.w : 60.w,
                radius: 10.sp,
                textcolor: Colors.black,
                buttoncolor: addButtonColor,
                elevation: 0.0,
                ontap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (c) => const Login()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
