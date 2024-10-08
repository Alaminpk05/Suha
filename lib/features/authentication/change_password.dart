import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/constant/static.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/global_widgets/custom_simple_appbar.dart';
import 'package:shuhaui/utils/global_widgets/small_widgets.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController oldpasscontroller = TextEditingController();

  TextEditingController newpasscontroller = TextEditingController();

  TextEditingController repeatpasscontroller = TextEditingController();
  final width = 80.w;
  @override
  Widget build(BuildContext context) {
    final bool mobile=ResponsiveHelper.isMobile(context);
    return Scaffold(
      appBar: PreCustomAppBar(mobile, context, "Change Password", const MenuWidget()),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: mobile?2.h:homeTopPad,horizontal: mobile?fivePad:homeTabLP),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 13.h,
                  width: width,
                  decoration: BoxDecoration(
                      color: addButtonColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.px),
                          topRight: Radius.circular(10.px))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 10.h,
                          width: 18.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/9.jpg'),
                                  fit: BoxFit.contain)),
                        ),
                        SizedBox(width: 4.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textwidget(
                                text: "@digitalcrop",
                                fontszie: mobile?textsize14:textsize20,
                                fonweight: fontWeight400,
                                color: authButtonTextColor),
                            textwidget(
                                text: "Suha Jannat",
                                fontszie: mobile?textsize20:26.px,
                                fonweight: fontWeight600,
                                color: authButtonTextColor),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 4.w),
                  height: 38.5.h,
                  width: width,
                  decoration: BoxDecoration(
                      color: productColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.px),
                          bottomRight: Radius.circular(10.px))),
                  child: Column(
                    children: [
                       TextfieldHeader(
                        text: 'Old Password', mobile: mobile,
                      ),
                      SizedBox(
                        height: 0.9.h,
                      ),
                      PassChangeTextForm(
                        ishintText: false,
                        controller: oldpasscontroller,
                        ontap: () {},
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      TextfieldHeader(
                        text: "New Password", mobile: mobile,
                      ),
                      SizedBox(
                        height: 0.9.h,
                      ),
                      PassChangeTextForm(
                        ishintText: true,
                        controller: newpasscontroller,
                        ontap: () {},
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                       TextfieldHeader(text: "Repeat New Password", mobile: mobile,),
                      SizedBox(
                        height: 0.9.h,
                      ),
                      PassChangeTextForm(
                        ishintText: false,
                        controller: repeatpasscontroller,
                        ontap: () {},
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      TextButton(
                          onPressed: () {
                            String oldpass = oldpasscontroller.text;
                            String newpass = newpasscontroller.text;
                            String repeatpass = repeatpasscontroller.text;
                            if (oldpass == newpass && newpass == repeatpass) {
                              print(newpass);
                            } else {
                              print('Pass not matched');
                            }
                          },
                          onHover: (value) => Colors.black,
                          child: Container(
                            height: 4.5.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: addButtonColor,
                                borderRadius: BorderRadius.circular(10.px)),
                            child: Align(
                              alignment: Alignment.center,
                              child: textwidget(
                                  text: 'Update Password',
                                  fontszie: mobile?textsize16:24.px,
                                  fonweight: fontWeight600,
                                  color: authButtonTextColor),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PassChangeTextForm extends StatelessWidget {
  PassChangeTextForm(
      {super.key,
      required this.ishintText,
      required this.controller,
      required this.ontap});
  bool ishintText;
  TextEditingController controller;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
     final bool mobile = ResponsiveHelper.isMobile(context);
    return TextFormField(
      onTap: ontap,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      autofocus: false,
      cursorColor: authButtonTextColor,
      cursorWidth: 1,
      cursorHeight: 15,
      decoration: InputDecoration(
          hintText: ishintText == true ? 'Password' : null,
          hintStyle: TextStyle(
              color: authButtonTextColor.withOpacity(0.5),
              fontWeight: FontWeight.normal,
              fontSize: mobile?textsize14:19.px),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: authButtonTextColor.withOpacity(0.4)),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: authButtonTextColor.withOpacity(0.4))),
          constraints: BoxConstraints(minHeight: 4.5.h, maxHeight: 4.5.h),
          contentPadding:
              EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 3.w)),
    );
  }
}

class TextfieldHeader extends StatelessWidget {
  const TextfieldHeader({
    super.key,
    required this.text, required this.mobile,
  });
  final String text;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
     final bool mobile = ResponsiveHelper.isMobile(context);
    return Row(
      children: [
        IconContainerWidget(
          height: 2.7.h,
          width: 6.w,
          widget: Image.asset(
            'assets/key.png',
            fit: BoxFit.contain,
            color: authButtonTextColor,
          ),
          mobile: mobile,
        ),
        SizedBox(
          width: 1.5.w,
        ),
        textwidget(
            text: text,
            fontszie: mobile?14.px:20.px,
            fonweight: fontWeight500,
            color: authButtonTextColor),
      ],
    );
  }
}
