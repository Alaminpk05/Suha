import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/topProductwithouttime.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/weeklybestsellerscard.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    var tablet = ResponsiveHelper.isTablet(context);

    bool isBorder = true;
    bool isChecklist = false;
    Color inactiveColor = const Color.fromRGBO(51, 40, 88, 1);
    Color activeColor = const Color.fromRGBO(234, 76, 98, 1);
    return Scaffold(
      appBar: PreCustomAppBar(
          mobile, context, () {}, 'WishList', const CircleMenu()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textwidget(
                      text: "Whishlist Items",
                      fontszie: 16.px,
                      fonweight: FontWeight.w700,
                      color: Colors.white),
                  Row(
                    children: [
                      WishListButton(
                        icon: 'assets/border-all.png',
                        color: isBorder == true ? activeColor : inactiveColor,
                        ontap: () {},
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      WishListButton(
                        icon: 'assets/list-check.png',
                        color:
                            isChecklist == true ? activeColor : inactiveColor,
                        ontap: () {
                          setState(() {
                            if (isChecklist == true) {
                              isChecklist = false;
                              isBorder = true;
                            } else {
                              isChecklist = true;
                              isBorder = false;
                            }
                            print(isChecklist);
                            print(isBorder);
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
              isChecklist == false
                  ? Container(
                      padding: EdgeInsets.only(top: 2.h, bottom: 0.h),
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 6,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 2.w,
                                  mainAxisSpacing: 2.w,
                                  childAspectRatio: 0.68),
                          itemBuilder: (context, index) {
                            return topProductwithouttime(
                                name: 'Wooden Sofa',
                                photo: "assets/5.png",
                                minibuttoncolor:
                                    const Color.fromRGBO(0, 184, 148, 1),
                                minibuttonword2: 'New',
                                mobile: mobile,
                                tablet: tablet,
                                textcolor: Colors.white,
                                width: mobile ? 45.w : 30.w);
                          }),
                    )
                  : Container(
                      padding: EdgeInsets.only(top: 2.h, bottom: 1.h),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return WeeklyProductsCard(
                            image: images[index],
                            title: tilteList[index],
                            icon: 'assets/trash.png',
                          );
                        },
                      )),
              Container(
                height: 5.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.sp),
                    color: const Color.fromRGBO(98, 90, 250, 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/circle-check (3).png',
                      scale: 15.sp,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    textwidget(
                        text: 'Add all items to cart',
                        fontszie: 16.px,
                        fonweight: FontWeight.w600,
                        color: Colors.white),
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

class WishListButton extends StatelessWidget {
  const WishListButton({
    super.key,
    required this.icon,
    required this.color,
    required this.ontap,
  });
  final String icon;
  final Color color;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          height: 3.2.h,
          width: 7.5.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.sp), color: color),
          child: Image.asset(
            icon,
            scale: 15.sp,
          )),
    );
  }
}
