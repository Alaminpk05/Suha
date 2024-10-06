import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/SectionWidgets/topproducts.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/weeklybestsellerscard.dart';
import 'package:shuhaui/features/home/data/model/top_product.dart';
import 'package:shuhaui/features/home/data/model/weekly_product.dart';
import 'package:shuhaui/features/home/data/repository/load_product_data.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/constant/static.dart';
import 'package:shuhaui/utils/dependency_injection/dependency_setup.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  late Future<List<TopProductModel>> topProductList;
  late Future<List<WeeklyProductModel>> weeklyProductList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    topProductList = getIt<ProductService>().fetchwishListBorderPageProducts();
    weeklyProductList = getIt<ProductService>().fetchchecklistpageProducts();
  }

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    var tablet = ResponsiveHelper.isTablet(context);

    bool isBorder = true;
    bool isChecklist = false;
    Color inactiveColor = textColor;
    Color activeColor = const Color.fromRGBO(234, 76, 98, 1);
    Color activeIconColor = Colors.white;
    return Scaffold(
      appBar: PreCustomAppBar(
          mobile, context, () {}, 'WishList', const MenuWidget()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 2.h, horizontal: mobile ? 3.w : homeTabLP),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textwidget(
                      text: "Whishlist Items",
                      fontszie: mobile ? 16.px : 24.px,
                      fonweight: FontWeight.w700,
                      color: Colors.white),
                  Row(
                    children: [
                      WishListButton(
                        icon: 'assets/border-all.png',
                        color: isBorder == true ? activeColor : inactiveColor,
                        ontap: () {
                          setState(() {
                            print(' clicked on border button');
                            isBorder = true;
                            isChecklist = false;
                          });
                        }, mobile: mobile,
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
                            print(' clicked on checklist button');
                            isChecklist = true;
                            isBorder = false;
                          });
                        }, mobile: mobile,
                      ),
                    ],
                  )
                ],
              ),

              ////main
              if (isChecklist==false)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: TopProductList(
                    mobile: mobile,
                    topProductList: topProductList,
                    tablet: tablet,
                    childratio: mobile ? 0.75 : 0.675,
                  ),
                )
              else
                Container(
                    padding: EdgeInsets.only(top: 2.h, bottom: 1.h),
                    child: FutureBuilder(
                      future: weeklyProductList,
                      builder: (c, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(
                              child: Text('No categories found'));
                        }
                        final weeklyprodutList = snapshot.data!;
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: weeklyprodutList.length,
                          itemBuilder: (context, index) {
                            final item = weeklyprodutList[index];
                            return WeeklyProductsCard(
                              image: item.image,
                              title: item.name,
                              icon: 'assets/trash.png',
                            );
                          },
                        );
                      },
                    )),
              Container(
                height: 5.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.sp),
                    color: addButtonColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/circle-check (3).png',
                      scale: mobile?15.sp:10,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    textwidget(
                        text: 'Add all items to cart',
                        fontszie: mobile?16.px:24.px,
                        fonweight: mobile?FontWeight.w500:FontWeight.w600,
                        color: productColor),
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
    required this.ontap, required this.mobile,
  });
  final String icon;
  final Color color;
  final void Function()? ontap;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          height: mobile?3.2.h:3.5.h,
          width: mobile?7.5.w:6.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.sp), color: color),
          child: Image.asset(
            icon,
            scale: mobile ? 15.sp : 9.px,
          )),
    );
  }
}
