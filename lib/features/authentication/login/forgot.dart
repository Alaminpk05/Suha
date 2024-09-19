import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/authentication/login/login.dart';
import 'package:shuhaui/features/bottom_nav_bar/tabapges.dart';
import 'package:shuhaui/utils/global_widgets/authtextfield.dart';
import 'package:shuhaui/utils/global_widgets/elevated_text_button.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(64, 91, 233, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextFieldWidget(
              labeltext: 'Email or Username',
              hindtext: 'Designing World',
              pefefiximage: 'assets/user.png'),
          SizedBox(height: 2.h),
          ElevatedTextButton(
            text: 'Reset Password',
            fontsize: 16.sp,
            fontWeight: FontWeight.w600,
            height: mobile ? 4.h : 4.5.h,
            width: mobile ? 70.w : 60.w,
            radius: 10.sp,
            textcolor: Colors.black,
            buttoncolor: const Color.fromRGBO(255, 175, 0, 1),
            elevation: 0.0,
            ontap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (cxt) => const Login()));
            },
          ),
        ],
      ),
    );
  }
}
