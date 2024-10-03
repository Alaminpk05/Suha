// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/bottom_nav_bar/tabapges.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/features/home/data/model/weekly_product.dart';
import 'package:shuhaui/features/home/data/repository/load_product_data.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/dependency_injection/dependency_setup.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/global_widgets/custom_simple_appbar.dart';
import 'package:shuhaui/utils/global_widgets/horizontal_prduct_lis.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class ShopList extends StatefulWidget {
  const ShopList({
    super.key,
  });

  @override
  State<ShopList> createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  late Future<List<WeeklyProductModel>> weeklyProductList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weeklyProductList = getIt<ProductService>().fetchweeklyProductListt();
  }

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(mobile ? kToolbarHeight : 5.5.h),
        child: CustomSimpleAppBar(
          title: 'Shop List',
          navigation: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (cxt) => const Bottompage()));
          },
          widget: const MenuWidget(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: mobile ? 5.w : homeTabLP,
              vertical: mobile ? 1.5.h : homeTopPad),
          child: Column(
            children: [
              HorizontalProductList(mobile: mobile),
              SizedBox(
                height: 3.h,
              ),
              FutureBuilder(
                future: weeklyProductList,
                builder: (c, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No categories found'));
                  }
                  final weeklyProductList = snapshot.data!;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: weeklyProductList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        // var infiniteIndex = index % horizontalProductList.length;
                        var item = weeklyProductList[index];
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: mobile ? 0.w : 0, vertical: 0.4.h),
                          height: 16.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                productColor, // Use the passed container color
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 1.2.h),
                                padding:
                                    EdgeInsets.only(top: 1.h, bottom: 0.5.h),
                                height: 12.h,
                                width: mobile ? 27.w : 18.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13.sp),
                                    color: addButtonColor),
                                child: Stack(children: [
                                  Positioned(
                                    left: 2.w,
                                    bottom: 0.5.h,
                                    top: 0,
                                    child: SizedBox(
                                      height: mobile ? 22.h : 18.h,
                                      width: mobile ? 19.w : 14.w,
                                      child: Image.asset(
                                        item.image,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: mobile ? 2.w : 1.w,
                                    bottom: mobile ? 6.3.h : 7.5.h,
                                    child: Container(
                                      height: mobile ? 5.h : 3.h,
                                      width: mobile ? 6.w : 5.w,
                                      decoration: BoxDecoration(
                                          color: productColor,
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                            mobile ? 8.5.sp : 8.5.sp),
                                        child: Image.asset(
                                          'assets/heart (3).png',
                                          height: mobile ? 4.h : 1.h,
                                          width: mobile ? 4.w : 2.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                              SizedBox(width: 2.5.w),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 1.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 1.8.h,
                                        ),
                                        child: Text(
                                          item.name,
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: mobile ? 16.5.sp : 23.px,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text(
                                            '\$',
                                            style: TextStyle(
                                              color: textColor,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Text(
                                            '\$${item.price}',
                                            style: TextStyle(
                                              color: textColor,
                                              fontSize: mobile ? 16.sp : 22.px,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 1.8.w),
                                          Text(
                                            '\$${item.originalPrice}',
                                            style: TextStyle(
                                              color: const Color(0xFFDC3545),
                                              fontSize: mobile ? 14.sp : 20.px,
                                              fontWeight: FontWeight.w600,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const Icon(Icons.star,
                                              color: Colors.amber, size: 16),
                                          const SizedBox(width: 4),
                                          Text(
                                            "4.88",
                                            style: TextStyle(
                                              color: textColor,
                                              fontSize: mobile ? 14.sp : 22.px,
                                            ),
                                          ),
                                          Text(
                                            " (125 reviews)",
                                            style: TextStyle(
                                              color: textColor,
                                              fontSize: mobile ? 14.sp : 22.px,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 0.8.h,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                0, 184, 148, 1),
                                            borderRadius:
                                                BorderRadius.circular(10.sp)),
                                        height: 3.8.h,
                                        width: mobile ? 23.w : 17.5.w,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: textwidget(
                                              text: 'Add to cart',
                                              fontszie: mobile ? 15.sp : 22.px,
                                              fonweight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
