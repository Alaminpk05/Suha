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

class BillingInformation extends StatefulWidget {
  const BillingInformation({super.key});

  @override
  State<BillingInformation> createState() => _BillingInformationState();
}

class _BillingInformationState extends State<BillingInformation> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kTextTabBarHeight),
          child: CustomSimpleAppBar(
              title: 'Billing Information', widget: MenuWidget())),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
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
                      const BillingHeader(
                        title: 'Billing Information',
                      ),
                      const BillingPersonalInfoWidget(
                        title: 'Full Name',
                        name: 'SUHA JANNAT',
                        icon: CupertinoIcons.person,
                      ),
                      const BillingPersonalInfoWidget(
                        title: 'Email Address',
                        name: 'digital@crop.com',
                        icon: CupertinoIcons.mail,
                      ),
                      const BillingPersonalInfoWidget(
                        title: 'Phone',
                        name: '+880 000 111 222',
                        icon: CupertinoIcons.phone,
                      ),
                      const BillingPersonalInfoWidget(
                        title: 'Shipping',
                        name: '28/C Green Road, BD',
                        icon: CupertinoIcons.cube_box,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: ContainerTextButton(
                          text: "Edit Billing Informatioin",
                          height: 4.h,
                          fontsize: 15.px,
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
                    const BillingHeader(title: "Shipping Method"),
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
                                        fontszie: 14.px,
                                        fonweight: fontWeight500,
                                        color: textColor),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    textwidget(
                                        text: "1 days delivary for  \$1.0",
                                        fontszie: 12.px,
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
                        text: '\$0',
                        fontszie: textsize20,
                        fonweight: fontWeight600,
                        color: textColor),
                    ContainerTextButton(
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => ChoosePaymentMethod()));
                      },
                      text: 'Confirm & Pay',
                      height: 5.h,
                      fontsize: 14.px,
                      titleColor: textColor,
                      width: 30.w,
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
    Key? key,
    required this.text,
    required this.height,
    required this.fontsize,
    required this.titleColor,
    required this.width,
    this.ontap,
  }) : super(key: key);
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
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: textwidget(
              text: title,
              fontszie: 16.px,
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
  });
  final String title;
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
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
                    size: 15.px,
                    color: textColor,
                  )),
              SizedBox(
                width: 1.w,
              ),
              textwidget(
                  text: title,
                  fontszie: textsize15,
                  fonweight: fontWeight500,
                  color: textColor)
            ],
          ),
          textwidget(
              text: name,
              fontszie: 14.px,
              fonweight: fontWeight400,
              color: grayColor)
        ],
      ),
    );
  }
}
