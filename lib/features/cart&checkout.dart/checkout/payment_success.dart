import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/bottom_nav_bar/tabapges.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/constant/static.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class PaymentSuccessPage extends StatelessWidget {
  PaymentSuccessPage({super.key});
  final List<bool> selected = [true, false, true];
  @override
  Widget build(BuildContext context) {
    final bool mobile = ResponsiveHelper.isMobile(context);
    return Scaffold(
      backgroundColor: addButtonColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: homeMobLP),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/brand-cashapp.png',
                color: productColor,
                scale: mobile ? 5 : 3,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              textwidget(
                  text: 'Payment Successfull',
                  fontszie: mobile ? 16.px : 26.px,
                  fonweight: fontWeight600,
                  color: productColor),
              AlignCenterTextWidget(
                text:
                    'We will notify you of all the details via email. Thank you!',
                fontsize: mobile ? textsize14 : textsize20,
                fontWeight: fontWeight500,
                color: productColor.withOpacity(0.8),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (c) => const Bottompage()));
                  },
                  style: ElevatedButton.styleFrom(
                   
                      backgroundColor: productColor,
                      minimumSize:
                          Size(mobile ? 10.w : 10.w, mobile ? 4.h : 4.5.h),
                          
                          
                          ),
                  icon: Image.asset(
                    'assets/arrow-left.png',
                    scale: 11,
                    color: textColor,
                  ),
                  label: textwidget(
                      text: 'Shopping Again',
                      fontszie: mobile ? textsize14 : 20.px,
                      fonweight: fontWeight500,
                      color: textColor)),
            ],
          ),
        ),
      ),
    );
  }
}

class AlignCenterTextWidget extends StatelessWidget {
  const AlignCenterTextWidget({
    super.key,
    required this.text,
    required this.fontsize,
    required this.fontWeight,
    required this.color,
  });
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontFamily: 'Poppins',
          fontSize: fontsize,
          fontWeight: fontWeight),
      textAlign: TextAlign.center,
    );
  }
}
