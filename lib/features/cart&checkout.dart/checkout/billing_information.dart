// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/choose_payment_method.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/constant/static.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/global_widgets/custom_simple_appbar.dart';
import 'package:shuhaui/utils/global_widgets/small_widgets.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class BillingInformation extends StatefulWidget {
  const BillingInformation({super.key});

  @override
  State<BillingInformation> createState() => _BillingInformationState();
}

class _BillingInformationState extends State<BillingInformation> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    return Scaffold(
      appBar: PreCustomAppBar(
          mobile, context, 'Billing Information', const MenuWidget()),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: mobile ? 2.h : homeTopPad,
            horizontal: mobile ? 5.w : homeTabLP),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.px),
                    color: productColor,
                  ),
                  height: 32.h,
                  width: 80.w,
                  child: Column(
                    children: [
                      BillingHeader(
                        title: 'Billing Information',
                        mobile: mobile,
                      ),
                      
                      BillingPersonalInfoWidget(
                        
                        title: 'Full Name',
                        name: 'SUHA JANNAT',
                        icon: CupertinoIcons.person, mobile: mobile,
                      ),
                       BillingPersonalInfoWidget(
                        title: 'Email Address',
                        name: 'digital@crop.com',
                        icon: CupertinoIcons.mail, mobile: mobile,
                      ),
                       BillingPersonalInfoWidget(
                        title: 'Phone',
                        name: '+880 000 111 222',
                        icon: CupertinoIcons.phone, mobile: mobile,
                      ),
                       BillingPersonalInfoWidget(
                        title: 'Shipping',
                        name: '28/C Green Road, BD',
                        icon: CupertinoIcons.cube_box, mobile: mobile,
                      ),
                      SizedBox(height: mobile?0:1.5.h
                      ,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: mobile?3.w:4.w),
                        child: ContainerTextButton(
                          text: "Edit Billing Informatioin",
                          height: 4.h,
                          fontsize: mobile?15.px:textsize20,
                          titleColor: textColor,
                          width: 80.w,
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.5.h),
                height: 24.h,
                width: 80.w,
                decoration: BoxDecoration(
                  color: productColor,
                  borderRadius: BorderRadius.circular(8.px),
                ),
                child: Column(
                  children: [
                    BillingHeader(
                      title: "Shipping Method",
                      mobile: mobile,
                    ),
                    GroupButton<String>(
                        options: GroupButtonOptions(
                          selectedColor: Colors.orange,
                          unselectedColor: productColor,
                          selectedTextStyle: const TextStyle(color: Colors.red),
                          unselectedTextStyle:
                              TextStyle(color: Colors.grey[400]),
                          borderRadius: BorderRadius.circular(8),
                          buttonHeight: 4.h,
                          buttonWidth: double.infinity,
                          mainGroupAlignment: MainGroupAlignment.start,
                          crossGroupAlignment: CrossGroupAlignment.start,
                          alignment: Alignment.centerLeft,
                          elevation: 0,
                        ),
                        isRadio: true,
                        onSelected: (selected, index, isSelected) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        buttons: const [
                          "Fast Shipping 1 days delivery for \$1.0",
                          "Reguler 3-7 days delivery for \$0.4",
                          "Courier 5-8 days delivery for \$0.3",
                        ],
                        buttonIndexedBuilder: (isSelected, index, context) {
                          return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: ListTile(
                                minTileHeight: 4.5.h,
                                title: Row(
                                  children: [
                                    Icon(
                                        isSelected
                                            ? Icons.radio_button_checked
                                            : Icons.radio_button_unchecked,
                                        color: isSelected
                                            ? Colors.orange
                                            : addButtonColor),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    textwidget(
                                        text: "Fast Shipping ",
                                        fontszie: mobile?14.px:textsize20,
                                        fonweight: fontWeight500,
                                        color: textColor),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    textwidget(
                                        text: "1 days delivary for  \$1.0",
                                        fontszie: mobile?12.px:17.px,
                                        fonweight: fontWeight500,
                                        color: textColor)
                                  ],
                                ),
                              ));
                        })
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                decoration: BoxDecoration(
                  color: productColor,
                  borderRadius: BorderRadius.circular(8.px),
                ),
                height: 6.h,
                width: 80.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textwidget(
                        text: '\$20',
                        fontszie: mobile?20.px:24.px,
                        fonweight: mobile?fontWeight700:FontWeight.w700,
                        color: textColor),
                    ContainerTextButton(
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => const ChoosePaymentMethod()));
                      },
                      text: 'Confirm & Pay',
                      height: 5.h,
                      fontsize: mobile?14.px:20.px,
                      titleColor: textColor,
                      width: mobile?30.w:25.w
                      ,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerTextButton extends StatelessWidget {
  const ContainerTextButton({
    super.key,
    required this.text,
    required this.height,
    required this.fontsize,
    required this.titleColor,
    required this.width,
    this.ontap,
  });
  final String text;
  final double height;
  final double fontsize;
  final Color titleColor;
  final double width;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 1.w,
        ),
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: addButtonColor, borderRadius: BorderRadius.circular(8.px)),
        height: height,
        child: textwidget(
            text: text,
            fontszie: fontsize,
            fonweight: fontWeight600,
            color: textColor),
      ),
    );
  }
}

class BillingHeader extends StatelessWidget {
  const BillingHeader({
    super.key,
    required this.title,
    required this.mobile,
  });
  final String title;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: textwidget(
              text: title,
              fontszie: mobile ? 16.px : 22.px,
              fonweight: fontWeight600,
              color: textColor),
        ),
        const Divider(
          thickness: 0.3,
          color: Color.fromARGB(255, 0, 0, 1),
        ),
      ],
    );
  }
}

class BillingPersonalInfoWidget extends StatelessWidget {
  const BillingPersonalInfoWidget({
    super.key,
    required this.title,
    required this.name,
    required this.icon,
    required this.mobile,
  });
  final String title;
  final String name;
  final IconData icon;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: mobile?3.w:4.w, vertical: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconContainerWidget(
                  height: 2.7.h,
                  width: 6.w,
                  widget: Icon(
                    icon,
                    size: mobile?15.px:20.px,
                    color: textColor,
                  ), mobile: mobile,),
              SizedBox(
                width: 1.w,
              ),
              textwidget(
                  text: title,
                  fontszie: mobile?textsize15:textsize20,
                  fonweight: fontWeight500,
                  color: textColor)
            ],
          ),
          textwidget(
              text: name,
              fontszie: mobile?14.px:18.px,
              fonweight: fontWeight400,
              color: grayColor)
        ],
      ),
    );
  }
}
