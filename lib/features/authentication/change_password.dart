import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/constant/static.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/global_widgets/custom_simple_appbar.dart';
import 'package:shuhaui/utils/global_widgets/small_widgets.dart';

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
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomSimpleAppBar(
              title: "Change Password", widget: MenuWidget())),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 2.h),
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
                                fontszie: textsize14,
                                fonweight: fontWeight400,
                                color: authButtonTextColor),
                            textwidget(
                                text: "Suha Jannat",
                                fontszie: textsize20,
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
                      const TextfieldHeader(
                        text: 'Old Password',
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
                      const TextfieldHeader(
                        text: "New Password",
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
                      const TextfieldHeader(text: "Repeat New Password"),
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
                                  fontszie: 16.px,
                                  fonweight: fontWeight700,
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
              fontWeight: FontWeight.w400,
              fontSize: textsize14),
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
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconContainerWidget(height: 2.7.h, width: 6.w, widget:
         Image.asset(
        'assets/key.png',
        fit: BoxFit.contain,
        color: authButtonTextColor,
      ),),
        SizedBox(
          width: 1.5.w,
        ),
        textwidget(
            text: text,
            fontszie: 14.px,
            fonweight: fontWeight600,
            color: authButtonTextColor),
      ],
    );
  }
}
