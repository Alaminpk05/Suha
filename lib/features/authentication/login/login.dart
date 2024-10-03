import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/authentication/login/forgot.dart';
import 'package:shuhaui/features/authentication/registration/registration.dart';
import 'package:shuhaui/features/bottom_nav_bar/tabapges.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/global_widgets/authtextfield.dart';
import 'package:shuhaui/utils/global_widgets/elevated_text_button.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextFieldWidget(
            labeltext: 'Username',
            hindtext: 'info@example.com',
            pefefiximage: 'assets/user.png',
          ),
          SizedBox(
            height: 3.h,
          ),
          const TextFieldWidget(
            labeltext: 'Password',
            hindtext: 'Password',
            pefefiximage: 'assets/key.png',
          ),
          SizedBox(
            height: 3.h,
          ),
          ElevatedTextButton(
            text: 'Log In',
            fontsize: 16.sp,
            fontWeight: FontWeight.w600,
            
            height: mobile ? 4.h : 4.5.h,
            width: mobile ? 70.w : 60.w,
            radius: 10.sp,
            textcolor: Colors.black,
            buttoncolor:addButtonColor,
            elevation: 0.0,
            ontap: () {
               Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (c) => const Bottompage()));
            },
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPassword()));
              },
              child: textwidget(
                  text: 'Forgot Password?',
                  fontszie: 14.8.sp,
                 
                  fonweight: FontWeight.w600,
                  color: productColor)),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "Didn't have an account? ",
                style: TextStyle(
                   fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.7.sp,
                  color: loginadditonaltextColor,
                )),
            TextSpan(
                text: "Register Now",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 14.8.sp,
                  color: Colors.white,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => const Registration()));
                  })
          ])),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 3.5.h,
            width: mobile ? 34.w : 25.1.w,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color.fromRGBO(24,179,210,1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.sp))),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Bottompage()));
                  },
                  child: Row(
                    children: [
                      textwidget(
                          text: 'View as guest',
                          fontszie: mobile ? 14.sp : 14.sp,
                          fonweight: FontWeight.w600,
                          color: textColor),
                      SizedBox(
                        width: 1.w,
                      ),
                      Icon(Icons.arrow_forward,size: 3.w,color: textColor,)
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
