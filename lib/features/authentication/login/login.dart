import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/authentication/registration/registration.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/global_widgets/authtextfield.dart';
import 'package:shuhaui/utils/global_widgets/elevated_text_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(64, 91, 233, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldWidget(
            labeltext: 'Username',
            hindtext: 'info@example.com',
            pefefiximage: 'assets/user.png',
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
            height: 3.h,
          ),
          ElevatedTextButton(
            text: 'Login',
            fontsize: 16.sp,
            fontWeight: FontWeight.w600,
            height: 4.h,
            width: 60.w,
            radius: 10.sp,
            textcolor: Colors.black,
            buttoncolor: Color.fromRGBO(255, 175, 0, 1), elevation: 0.0,
          ),
          TextButton(
              onPressed: () {},
              child: textwidget(
                  text: 'Forgot Password?',
                  fontszie: 15.sp,
                  fonweight: FontWeight.w700,
                  color: Colors.white)),


          RichText(
              text: TextSpan(

                  children: [
                TextSpan(
                    text: "Didn't have an account? ",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: Color.fromRGBO(170, 188, 243, 0.7),
                    )),
                TextSpan(
                    text: "Register Now",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.5.sp,
                      color: Colors.white,
                    ),recognizer: TapGestureRecognizer()..onTap=(){
                      Navigator.push(context, MaterialPageRoute(builder: (c)=>Registration()));

                })
              ])),
          SizedBox(height:2.h,),
          Container(
            height: 3.5.h,
            width: 32.w,
            child: ElevatedButton(

                onPressed: (){},

                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color.fromRGBO(88,90,245, 0.8),



                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.sp))
                ),

                child: Row(

                  children: [
                    textwidget(text: 'View as guest',
                        fontszie: 14.1.sp, fonweight: FontWeight.w700,
                        color:Colors.white70),
                    SizedBox(width: 2.w,),
                    Image.asset('assets/arrow-narrow-right.png',height: 3.h,width: 3.w,)
                  ],
                )),
          )

        ],
      ),
    );
  }
}
