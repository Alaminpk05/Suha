import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant/static.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class OrderStatus extends StatelessWidget {
  OrderStatus({super.key});

  final List<Map<String, dynamic>> orderStatusDetails = [
    {
      "title": "Order placed",
      "date": "2 Feb 2024 - 12:38 PM",
      "icon": "assets/basket (2).png"
    },
    {
      "title": "Product packaging",
      "date": "3 Feb 2024",
      "icon": "assets/box.png"
    },
    {
      "title": "Ready for shipment",
      "date": "3 Feb 2024",
      "icon": "assets/trolley.png"
    },
    {
      "title": "On the way",
      "date": "Estimate: 4 Feb 2024",
      "icon": "assets/truck-delivery.png"
    },
    {
      "title": "Dropped in the delivery station",
      "date": "Estimate: 6 Feb 2024",
      "icon": "assets/building-store copy.png"
    },
    {
      "title": "Delivered",
      "date": "Estimate: 7 Feb 2024",
      "icon": "assets/heart-check.png"
    },
  ];
  static Color icontextColor = const Color.fromRGBO(116, 119, 148, 1);

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    return Scaffold(
      appBar: PreCustomAppBar(
          mobile, context, () {}, 'Order Status', const MenuWidget()),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/21 copy.jpg'), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 2.h, horizontal: mobile ? 0 : homeTabLP),
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              height: 44.h,
              width: 85.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.sp)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(orderStatusDetails.length, (index) {
                  return OrderSingleStatus(
                    icon: orderStatusDetails[index]['icon'],
                    text: orderStatusDetails[index]['title'],
                    date: orderStatusDetails[index]['date'],
                    index: index,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderSingleStatus extends StatelessWidget {
  const OrderSingleStatus({
    super.key,
    required this.icon,
    required this.text,
    required this.date,
    required this.index,
  });
  final String icon;
  final String text;
  final String date;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 1.5.h),
          child: Row(
            /// FIRST ROW
            children: [
              Container(
                height: 5.h,
                width: 10.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index > 2 ? Colors.grey : Colors.cyan),
                child: Image.asset(
                  icon,
                  scale: 10.5,
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  textwidget(
                      text: text,
                      fontszie: 14.px,
                      fonweight: FontWeight.w600,
                      color: index > 2
                          ? Colors.grey

                          ///const Color.fromRGBO(116, 119, 148, 1)
                          : Colors.black),
                  SizedBox(
                    height: 0.3.h,
                  ),
                  textwidget(
                      text: date,
                      fontszie: 12.px,
                      fonweight: FontWeight.w400,
                      color: Colors.grey),
                ],
              ),
            ],
          ),
        ),

        /// CHECK CIRCLE
        Column(
          children: [
            if (index == 0)
              StraightDot(
                height: 0.8.h,
                marginv: 0.2.h,
              ),
            Container(
              height: 21.px,
              width: 23.px,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: index > 2
                    ? const AssetImage('assets/circle-check (2).png')
                    : const AssetImage('assets/circle-check.png'),
                fit: BoxFit.contain,
              )),
            ),
            if (index < 5)
              StraightDotList(
                index: index,
              ),
            if (index == 5)
              StraightDot(
                height: 0.8.h,
                marginv: 0.3.h,
              ),
          ],
        ),
      ],
    );
  }
}

class StraightDot extends StatelessWidget {
  const StraightDot({
    super.key,
    required this.height,
    required this.marginv,
  });
  final double height;
  final double marginv;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: marginv),
      height: height,
      width: 0.3.w,
      color: const Color.fromRGBO(57, 59, 86, 1),
    );
  }
}

class StraightDotList extends StatelessWidget {
  const StraightDotList({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(4, (index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 0.2.h),
          height: 0.5.h,
          width: 0.4.w,
          color: const Color.fromRGBO(57, 59, 86, 1),
        );
      }),
    );
  }
}
