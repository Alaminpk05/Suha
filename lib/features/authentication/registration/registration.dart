import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/authentication/login/login.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/global_widgets/authtextfield.dart';
import 'package:shuhaui/utils/global_widgets/elevated_text_button.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    var mobile =ResponsiveHelper.isMobile(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(64, 91, 233, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Container(
            height: 13.5.h,
            width: 23.w,
            child: Image.asset('assets/logo-white.png',fit: BoxFit.contain,),
          ),
          
          SizedBox(
            height: 5.h
            ,
          ),
          TextFieldWidget(
            labeltext: 'Username',
            hindtext: 'Designing World',
            pefefiximage: 'assets/user.png',
          ),
          SizedBox(
            height: 3.h,
          ),
          TextFieldWidget(
            labeltext: 'Email',
            hindtext: 'help@example.com',
            pefefiximage: 'assets/at.png',
          ),
          SizedBox(
            height: 3.h,
          ),
          TextFieldWidget(
            labeltext: 'Password',
            hindtext: 'Password',
            pefefiximage: 'assets/key.png',
          ),
          SizedBox(
            height: mobile?3.h:3.5.h,
          ),
          ElevatedTextButton(
            text: 'Sign Up',
            fontsize: 16.sp,
            fontWeight: FontWeight.w600,
            height: mobile?4.h:4.5.h,
            width: mobile?70.w:60.w,
            radius: 10.sp,
            textcolor: Colors.black,
            buttoncolor: Color.fromRGBO(255, 175, 0, 1), elevation: 0.0,
          ),
          SizedBox(height: 2.h,),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "Already have an account? ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.7.sp,
                  color: Color.fromRGBO(170, 188, 243, 0.7),
                )),
                TextSpan(
                    text: "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.8.sp,
                      color: Colors.white,
                    ),recognizer: TapGestureRecognizer()..onTap=(){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (c)=>Login()));

                })
          ])),


        ],
      ),
    );
  }
}

//88,90,245

// 170,188,243,  92 90,247 86,107, 237
