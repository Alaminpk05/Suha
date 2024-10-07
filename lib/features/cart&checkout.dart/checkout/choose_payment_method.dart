import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/bank_transfer_page.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/cash_page.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/credit_page.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/payple_page.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/constant/static.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/global_widgets/custom_simple_appbar.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class ChoosePaymentMethod extends StatefulWidget {
  ChoosePaymentMethod({super.key});

  @override
  State<ChoosePaymentMethod> createState() => _ChoosePaymentMethodState();
}

class _ChoosePaymentMethodState extends State<ChoosePaymentMethod> {
  final List<Map<String, dynamic>> paymentMethods = [
    {
      'name': 'Credit Card',
      'icon': 'assets/icons/credit.png',
      'page': const CreditPage()
    },
    {
      'name': 'Bank Transfer',
      'icon': 'assets/icons/bank.png',
      'page': BankTransferPage()
    },
    {'name': 'PayPal', 'icon': 'assets/icons/payple.png', 'page': PaypalPage()},
    {
      'name': 'Cash On Delivery',
      'icon': 'assets/icons/cash.png',
      'page': const CashPage()
    },
  ];

  String? selectedMedthod;

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomSimpleAppBar(
                title: "Choose Payment Method", widget: MenuWidget())),
        body: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.3,
                crossAxisSpacing: 7.px,
                mainAxisSpacing: 7.px,
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              final item = paymentMethods[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedMedthod = item['name'];
                    isSelected = !isSelected;
                  });
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => item['page']));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: productColor,
                    borderRadius: BorderRadius.circular(8.px),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        item['icon'],
                        color: selectedMedthod == item['name']
                            ? textColor
                            : grayColor,
                        scale: 5.px,
                      ),
                      textwidget(
                          text: item['name'],
                          fontszie: textsize12,
                          fonweight: fontWeight600,
                          color: selectedMedthod == item['name']
                              ? textColor
                              : grayColor)
                    ],
                  ),
                ),
              );
            }));
  }
}
