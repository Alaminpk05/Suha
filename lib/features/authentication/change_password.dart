import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/constant/static.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/global_widgets/custom_simple_appbar.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar:const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child:  CustomSimpleAppBar(title: "Change Password",
         navigation: null,
          widget: MenuWidget())),
          body: Container(

            child: Column(
                     
              children: [
                Container(
                 alignment: Alignment.center,
                 
                margin: EdgeInsets.symmetric(vertical: 2.h
                ),
                  height:15.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    color: productColor,
                    borderRadius:BorderRadius.only(topLeft: Radius.circular(10.px),topRight: Radius.circular(10.px))
                     
                  ),
                  child:  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                  
                     
                      children: [
                       Container(
                        height: 10.h,
                        width: 18.w,
                        decoration:BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('assets/9.jpg'),fit: BoxFit.contain)
                        ),
                       ),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           textwidget(text: "@digitalcrop",
                            fontszie: textsize14,
                             fonweight: fontWeight400, 
                             color: authButtonTextColor),
                             textwidget(text: "Suha Jannat",
                            fontszie: textsize20,
                             fonweight: fontWeight600, 
                             color: authButtonTextColor),
                         ],
                       ),
                    
                    
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
