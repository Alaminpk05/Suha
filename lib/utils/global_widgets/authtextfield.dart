
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.labeltext,
    required this.hindtext,
    required this.pefefiximage,
  });
  final String labeltext;
  final String hindtext;
  final String pefefiximage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            labeltext, // Label text
            style: TextStyle(
              color: Colors.white, // Label color
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 0.5.h), // Space between label and text field
          TextFormField(
            decoration: InputDecoration(
                hintText: hindtext, // Hint text
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: Color.fromRGBO(170, 188, 243, 0.7), // Hint text color
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(1.h, 0.w, 4.w, 1.h),
                  child: Image.asset(
                    pefefiximage, // Custom image
                    width: 0.w,
                    height: 0.h,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.06.w,
                      color: Colors.white54), // Border color when enabled
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 0.06.w, color: Colors.white54),
                ),
                border: InputBorder.none // Remove focus border
            ),
            style: TextStyle(
              color: Colors.white, // Text color
            ),
            cursorColor: Colors.white, // Cursor color
          ),
        ],
      ),
    );
  }
}