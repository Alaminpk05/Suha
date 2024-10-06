import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/constant/static.dart';
import 'package:shuhaui/utils/global_widgets/elevated_text_button.dart';



class OTPConfirmationPage extends StatefulWidget {
  const OTPConfirmationPage({super.key});

  @override
  _OTPConfirmationPageState createState() => _OTPConfirmationPageState();
}

class _OTPConfirmationPageState extends State<OTPConfirmationPage> {
 
  late FocusNode focusNode;
  late TextEditingController controller;
  late List<FocusNode> focusNodes;
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    // Initialize focus nodes and text controllers for each input field
    focusNodes = List.generate(4, (index) => FocusNode());
    controllers = List.generate(4, (index) => TextEditingController());
  }

  @override
  void dispose() {
    // Dispose of the focus nodes and controllers to avoid memory leaks
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void nextField(String value, int index) {
    if (value.length == 1 && index < 3) {
      // Move to the next field if a digit is entered
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    } else if (value.length == 1 && index == 3) {
      // Close the keyboard if last digit is entered
      focusNodes[index].unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            
            children: [
              textwidget(text: 'Verify Phone Number', fontszie: textsize20,
               fonweight: fontWeight600, color: authPageTextColor)
               ,
             
             textwidget(text: 'Enter the OTP code sent to0123 456 7890', 
             fontszie: textsize16,
               fonweight: fontWeight400, color: authPageTextColor)
               ,
              SizedBox(height: 6.h),
              // Four OTP text fields
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return Container(
                    margin: EdgeInsets.only(right: 5.w),
                    width: 15.w,
                    height: 7.h,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                    
                      textAlignVertical: TextAlignVertical.center,
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      onChanged: (value) => nextField(value, index),
                      style: TextStyle(
                        fontSize: 18.px,
                        color: authPageTextColor,
                      ),
                     
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      
                      cursorColor: authPageTextColor,
                      cursorHeight: 2.h,
                      cursorWidth: 0.2.w,
                      
                      decoration: InputDecoration(
                        counterText: '',
                     fillColor: authPageTextColor.withOpacity(0.1),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.px),
                          borderSide: BorderSide(color: authPageTextColor.withOpacity(0.1)),
                        ),
                        filled: true
                        ,
                        focusedBorder: OutlineInputBorder(
                          
                          borderRadius: BorderRadius.circular(10.px),
                          borderSide: BorderSide(color:authPageTextColor.withOpacity(0.1)),
                        ),
                      ),
                    ),
                  );
                  
                }),
              ),
              SizedBox(height: 5.h),
              // Verify Button
            ElevatedTextButton(text: "Verify & Proceed",
             elevation: 0, fontsize: 16.px, fontWeight: fontWeight500,
              height: 5.h, width: double.infinity, radius: 8.px,
               buttoncolor: authButtonColor, textcolor: authPageTextColor,
                ontap: (){

                }),
              SizedBox(height: 0.5.h),
              // Resend OTP
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    // Resend OTP logic here
                  },
                  child: textwidget(text: "Don't received the OTP?", 
                  fontszie: 14.px, fonweight: fontWeight400, color: authPageTextColor)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
