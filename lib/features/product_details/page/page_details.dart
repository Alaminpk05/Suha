// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/categorybuttonwidget.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/features/home/data/model/top_product.dart';
import 'package:shuhaui/features/home/data/repository/load_product_data.dart';
import 'package:shuhaui/features/product_details/data/model/ratings_review.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/constant/static.dart';
import 'package:shuhaui/utils/dependency_injection/dependency_setup.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

import '../../home/data/model/productdetails.dart';

class PageDetails extends StatefulWidget {
  const PageDetails({super.key, required this.image, required this.title});
  final String image;
  final String title;

  @override
  State<PageDetails> createState() => _PageDetailsState();
}

class _PageDetailsState extends State<PageDetails> {
  late PageController pageController = PageController();
  int currentpage = 0;
  double value = 0.82;
  late Timer timer;
  int selectedStar = 0;
  late AnimationController animationController;
  late Animation<double> animation;
  double textFieldHeight = 10.h;
  bool ResizingVertically = false;

  static Color detailsPageTextColor = const Color.fromRGBO(116, 119, 148, 1);
  static Color detailPageContColor = const Color.fromRGBO(51, 40, 88, 1);

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      currentpage++;
      pageController.animateToPage(currentpage,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });

    super.initState();
    itemlist = getIt<ProductService>().fetchRelatedProducts();
    productImage = getIt<ProductService>().fetchdetailslidableimage();
    reviews = getIt<ProductService>().fetchReviews();
  }

  @override
  void dispose() {
    timer.cancel();
    pageController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  late Future<List<TopProductModel>> itemlist;
  late Future<List<ProductDetailsModel>> productImage;

  late Future<List<ReviewModel>> reviews;

  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var mobile = ResponsiveHelper.isMobile(context);
    var tablet = ResponsiveHelper.isTablet(context);
    return Scaffold(
      appBar: PreCustomAppBar(
          mobile, context, () {}, 'Product Details', const MenuWidget()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FirstSection(mobile, productImage, widget.image, widget.title),

            /// START THE SECOND HEADER
            SecondSection(
                width: width,
                detailsPageTextColor: textColor,
                value: value,
                mobile: mobile),
            SizedBox(
              height: 1.5.h,
            ),

            /// ADD TO CART COMPONENT
            ThirdSection(
              width: width,
              mobile: mobile,
            ),
            SizedBox(
              height: 1.5.h,
            ),
            SpecificationSection(
              detailPageContColor: productColor,
              mobile: mobile,
            ),

            VideoSection(width: width),
            RelatedProductsSection(
              width: width,
              detailPageContColor: detailPageContColor,
              mobile: mobile,
              tablet: tablet,
              datalist: itemlist,
            ),
            SizedBox(
              height: 1.5.h,
            ),

            RatingsReviewsSection(
              reviewlist: reviews,
              mobile: mobile,
            ),

            SizedBox(
              height: 1.5.h,
            ),
            SubmitSection(
              width: width,
              textFieldHeight: textFieldHeight,
              focusNode: focusNode,
              mobile: mobile,
            )
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<ProductDetailsModel>> FirstSection(
    bool mobile,
    Future<List<ProductDetailsModel>> slidableimage,
    String assets,
    String title,
  ) {
    return FutureBuilder(
      future: slidableimage,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No categories found'));
        }

        final itemlist = snapshot.data!;
        return SizedBox(
          height: 25.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (int page) {
                      currentpage = page;
                    },
                    itemBuilder: (context, index) {
                      final int imageindex = index % itemlist.length;
                      final item = itemlist[imageindex];

                      return SizedBox(
                        height: 8.h,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: Image.asset(
                            assets,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    }),
              ),
              Positioned(
                  bottom: 2.5.h,
                  right: 0,
                  child: Image.asset(
                    'assets/curve.png',
                    color: productColor,
                    scale: 1,
                  )),
              Positioned(
                  bottom: -10.5.h,
                  child: ProductHeader(
                    mobile: mobile,
                    title: title,
                  )),
            ],
          ),
        );
      },
    );
  }
}

class SubmitSection extends StatelessWidget {
  const SubmitSection({
    super.key,
    required this.width,
    required this.textFieldHeight,
    required this.focusNode,
    required this.mobile,
  });

  final double width;
  final double textFieldHeight;
  final FocusNode focusNode;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: mobile ? 5.w : homeTabLP, vertical: 2.h),
      height: 25.5.h,
      width: width,
      color: productColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textwidget(
              text: 'Submit A Review',
              fontszie: mobile ? 16.px : 22.px,
              fonweight: FontWeight.w600,
              color: textColor),
          SizedBox(
            height: 1.h,
          ),
          Row(
              children: List.generate(5, (index) {
            return Icon(
              Icons.star,
              color: Colors.grey.shade400,
            );
          })),
          SizedBox(
            height: 1.h,
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: null,
                border: Border.all(color: const Color.fromRGBO(54, 49, 86, 1))),
            width: 70.w,
            height: textFieldHeight,
            child: Stack(
              children: [
                TextFormField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  focusNode: focusNode,
                  maxLines: null,
                  cursorHeight: 1.5.h,
                  cursorColor: textColor,
                  cursorWidth: 0.15.w,
                  style: TextStyle(
                      fontSize: 14.px,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                      hintText: 'Write your review...',
                      hintStyle: TextStyle(
                        color: const Color.fromRGBO(112, 114, 133, 1),
                        fontSize: mobile ? 14.px : 20.px,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          DetailPageTextButton(
            ontab: () {},
            buttonWidth: mobile ? 25.w : 20.w,
            height: 3.h,
            text: 'Save Review',
            mobile: mobile,
          )
        ],
      ),
    );
  }
}

class RelatedProductsSection extends StatelessWidget {
  const RelatedProductsSection({
    super.key,
    required this.width,
    required this.detailPageContColor,
    required this.mobile,
    required this.tablet,
    required this.datalist,
  });

  final double width;
  final Color detailPageContColor;
  final bool mobile;
  final bool tablet;
  final Future<List<TopProductModel>> datalist;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mobile ? 34.h : 34.h,
      width: width,
      color: null,
      padding: EdgeInsets.symmetric(
          horizontal: mobile ? 5.w : homeTabLP, vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textwidget(
                  text: "Related Products",
                  fontszie: mobile ? 16.px : 22.px,
                  fonweight: FontWeight.w600,
                  color: productColor),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: mobile ? 1.5.w : 1.5.w, vertical: 0.5.h),
                decoration: BoxDecoration(
                  color: addButtonColor,
                  borderRadius: BorderRadius.circular(8.px),
                ),
                child: textwidget(
                    text: "View All",
                    fontszie: mobile?12.px:16.px,
                    fonweight: FontWeight.w500,
                    color: productColor),
              )
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          FutureBuilder(
            future: datalist,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No categories found'));
              }
              final itemlist = snapshot.data;
              print('REALATED PRODUCTS LIST PRINT ');
              print(itemlist?.first.title);
              return Expanded(
                child: ListView.builder(
                    itemCount: itemlist!.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = itemlist[index];
                      print(item.title);
                      return Padding(
                        padding: EdgeInsets.only(right: mobile?4.w:2.w),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => PageDetails(
                                        image: item.imageUrl,
                                        title: item.title)));
                          },
                          child: Container(
                            height: mobile ? 28.5.h : 22.h,
                            width: mobile?42.5.w:30.w,
                            // margin: EdgeInsets.only(
                            //     top: 0.5.h, left: mobile?0.5.w:0, right: 1.h, bottom: 0.5.h),
                            decoration: BoxDecoration(
                              color: productColor,
                              //  const Color.fromRGBO(36, 38, 68, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: mobile ? 3.h : 2.5.h,
                                  left: mobile ? 6.w : 1.5.w,
                                  child: Center(
                                      child: Image.asset(item.imageUrl,
                                          width: mobile ? 28.w : 25.w)),
                                ),
                                Positioned(
                                  top: mobile ? 3.h : 1.5.h,
                                  left: mobile ? 4.w : 2.5.w,
                                  right: mobile ? 3.5.w : -2.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w, vertical: 0.2.h),
                                        // height: mobile ? 2.h : 1.5.h,
                                        // width: mobile ? 10.w : 5.w,
                                        decoration: BoxDecoration(
                                          color: miniButtonColor,
                                          borderRadius:
                                              BorderRadius.circular(20.sp),
                                        ),
                                        child: Center(
                                          child: Text(
                                            item.minibuttonword,
                                            style: TextStyle(
                                              color: miniButtonTextColor,
                                              fontWeight: FontWeight.w400,
                                              fontFamily:
                                                  "PlusJakartaSans-Regular.ttf",
                                              fontSize:
                                                  mobile ? 13.5.sp : 12.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                        width: 10.w,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.only(right: 0.7.w),
                                          child: Image.asset(
                                            'assets/heart (3).png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: mobile ? 17.5.h : 19.h,
                                  left: mobile ? 3.3.w : 2.5.w,
                                  child: regularfont(
                                    text: item.title,
                                    fontsize: mobile ? 16.sp : 23.px,
                                    color: textColor,
                                  ),
                                ),
                                Positioned(
                                  top: mobile ? 20.2.h : 21.h,
                                  left: mobile ? 3.3.w : 2.5.w,
                                  right: 2.w,
                                  child: Row(
                                    children: [
                                      Text(
                                        "\$74",
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: mobile ? 18.sp : 23.px,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(width: 1.w),
                                      Text(
                                        "\$99",
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: mobile ? 15.5.sp : 13.5.sp,
                                          fontWeight: FontWeight.w500,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: textColor,
                                          decorationThickness: 0.3.h,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: mobile ? 2.5.h : 1.5.h,
                                  left: mobile ? 3.3.w : 2.8.w,
                                  right: mobile ? 5.w : 3.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FiveStar(
                                        height: mobile ? 2.5.h : 1.5.h,
                                        width: mobile ? 2.5.w : 1.5.w,
                                      ),
                                      Container(
                                        height: mobile ? 4.h : 2.5.h,
                                        width: mobile
                                            ? 4.h
                                            : 2.5
                                                .h, // Use 4.h for both dimensions to maintain the circle
                                        decoration: BoxDecoration(
                                          color: addButtonColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                            child: Image.asset(
                                          color: addButtoniconColor,
                                          'assets/plus.png',
                                          height: mobile ? 2.h : 2.h,
                                          width: mobile ? 2.h : 1.5.h,
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              );
            },
          )
        ],
      ),
    );
  }
}

class RatingsReviewsSection extends StatelessWidget {
  const RatingsReviewsSection({
    super.key,
    required this.reviewlist,
    required this.mobile,
  });
  final Future<List<ReviewModel>> reviewlist;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.only(
        top: 2.h,
        left: mobile ? 5.w : homeTabLP,
        right: mobile ? 5.w : homeTabLP,
      ),
      color: productColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textwidget(
              text: 'Ratings & Reviews',
              fontszie: mobile ? 16.px : 22.px,
              fonweight: FontWeight.w700,
              color: textColor),
          SizedBox(
            height: 1.3.h,
          ),
          FutureBuilder(
              future:
                  Future.delayed(const Duration(seconds: 1), () => reviewlist),
              builder: (c, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No categories found'));
                }
                final datalist = snapshot.data!;

                return Expanded(
                  child: ListView.builder(
                    itemCount: datalist.length,
                    itemBuilder: (context, index) {
                      final item = datalist[index];
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 0.5.h),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(item.author.profilePicture),
                                ),
                              ),
                              SizedBox(
                                width: 2.5.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FiveStar(height: 1.5.h, width: 3.w),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  textwidget(
                                      text: item.reviewText,
                                      fontszie: 14.px,
                                      fonweight: FontWeight.w400,
                                      color: textColor),
                                  SizedBox(height: 0.3.h),
                                  Row(children: [
                                    textwidget(
                                        text: item.author.name,
                                        fontszie: 12.px,
                                        fonweight: FontWeight.w400,
                                        color: textColor),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    textwidget(
                                        text: item.author.date,
                                        fontszie: 12.px,
                                        fonweight: FontWeight.w400,
                                        color: textColor),
                                  ]),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  if (item.reviewImages != null &&
                                      item.reviewImages!.isNotEmpty)
                                    SizedBox(
                                      width: 36.w,
                                      height: 6.h,
                                      child: ListView.builder(
                                        itemCount: item.reviewImages!.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (c, index) {
                                          final images =
                                              item.reviewImages![index];
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(right: 1.w),
                                            child: DetailPageIconButton(
                                              width: 12.w,
                                              height: 6.h,
                                              widget: Image.asset(images),
                                              ontab: () {},
                                              color: productColor,
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.3.h,
                          ),
                          if (datalist.length - 1 != index)
                            Row(
                                children:
                                    List.generate(mobile ? 45 : 35, (index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 0.5.w),
                                height: 0.05.h,
                                width: 1.w,
                                color: textColor,
                              );
                            })),
                          SizedBox(
                            height: 2.h,
                          )
                        ],
                      );
                    },
                  ),
                );
              })
        ],
      ),
    );
  }
}

class VideoSection extends StatelessWidget {
  const VideoSection({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.5.h),
      height: 18.h,
      width: width,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/18.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: textwidget(
                    text: "Summer Clothing",
                    fontszie: 20.px,
                    fonweight: FontWeight.w700,
                    color: Colors.white),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 2.h),
                  height: 4.5.h,
                  width: 9.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(24, 179, 210, 1),
                  ),
                  child: Image.asset(
                    'assets/player-play (1).png',
                    scale: 15,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SecondSection extends StatelessWidget {
  const SecondSection({
    super.key,
    required this.width,
    required this.detailsPageTextColor,
    required this.value,
    required this.mobile,
  });

  final double width;
  final Color detailsPageTextColor;
  final double value;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 12.h,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: mobile ? 5.w : homeTabLP, vertical: 0.5.h),
      color: productColor,
      height: 8.h,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textwidget(
                  text: 'Flash sale end in',
                  fontszie: 15.sp,
                  fonweight: FontWeight.w400,
                  color: textColor),
              SizedBox(
                height: 0.3.h,
              ),
              textwidget(
                  text: '150d 24h 60m 60s',
                  fontszie: 15.sp,
                  fonweight: FontWeight.w700,
                  color: textColor),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${(value * 100).toStringAsFixed(0)}% Sold Out",
                style: TextStyle(
                  color: textColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 0.3.h,
              ),
              SizedBox(
                width: width * 0.3,
                child: LinearPercentIndicator(
                  barRadius: Radius.circular(25.sp),
                  padding: EdgeInsets.symmetric(horizontal: mobile ? 0.6.w : 0),
                  lineHeight: 0.7.h,
                  percent: value,
                  progressColor: const Color.fromRGBO(255, 176, 0, 1),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SpecificationSection extends StatelessWidget {
  const SpecificationSection({
    super.key,
    required this.detailPageContColor,
    required this.mobile,
  });
  final bool mobile;

  final Color detailPageContColor;

  @override
  Widget build(BuildContext context) {
    return SpecificationsWidget(
      title: 'Specifications',
      description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. '
          'Quasi, eum? Id, culpa? At officia quisquam laudantium nisi '
          'molitia nesciunt, qui porro asperiores cum voluptates placeat '
          'similique recusandae in facere quos vitae?',
      specifications: const [
        '100% Good Reviews',
        '7 Days Returns',
        'Warranty not Applicable',
        '100% Brand New Product',
      ],
      contentColor: detailPageContColor,
      mobile: mobile,
    );
  }
}

class ThirdSection extends StatelessWidget {
  const ThirdSection({
    super.key,
    required this.width,
    required this.mobile,
  });

  final double width;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.5.h,
      width: width,
      color: productColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mobile ? 5.w : homeTabLP,
        ),
        child: Row(
          children: [
            DetailPageIconButton(
              width: 8.w,
              widget: Icon(
                CupertinoIcons.minus,
                color: Colors.white,
                size: 16.sp,
              ),
              height: 3.5.h,
              ontab: () {},
              color: const Color.fromRGBO(36, 38, 68, 1),
            ),
            SizedBox(
              width: 3.w,
            ),
            DetailPageIconButton(
              width: 11.w,
              widget: Align(
                alignment: Alignment.center,
                child: textwidget(
                    text: '0',
                    fontszie: 16.sp,
                    fonweight: FontWeight.w400,
                    color: Colors.white),
              ),
              height: 3.5.h,
              ontab: () {},
              color: const Color.fromRGBO(36, 38, 68, 1),
            ),
            SizedBox(
              width: 3.w,
            ),
            DetailPageIconButton(
              width: 8.w,
              widget: Icon(
                CupertinoIcons.add,
                color: Colors.white,
                size: 16.sp,
              ),
              height: 3.5.h,
              ontab: () {},
              color: const Color.fromRGBO(36, 38, 68, 1),
            ),
            SizedBox(
              width: 4.w,
            ),
            DetailPageTextButton(
              ontab: () {},
              buttonWidth: 22.w,
              height: 3.5.h,
              text: 'Add To Cart',
              mobile: mobile,
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPageTextButton extends StatelessWidget {
  const DetailPageTextButton({
    super.key,
    required this.ontab,
    required this.buttonWidth,
    required this.height,
    required this.text,
    required this.mobile,
  });
  final void Function()? ontab;
  final double buttonWidth;
  final double height;
  final String text;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: buttonWidth,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(24, 179, 210, 1),
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: textwidget(
            text: text,
            fontszie: mobile ? 14.px : 20.px,
            fonweight: FontWeight.w600,
            color: Colors.white),
      ),
    );
  }
}

/// SART COMPONENT FROM HERE

/// SPECIFICATION COMPONENT

class SpecificationsWidget extends StatelessWidget {
  final String title;
  final String description;
  final List<String> specifications;
  final Color contentColor;

  const SpecificationsWidget({
    super.key,
    required this.title,
    required this.description,
    required this.specifications,
    required this.contentColor,
    required this.mobile,
  });
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: mobile ? 5.w : homeTabLP, vertical: 2.h),
      color: contentColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: textColor,
              fontSize: mobile ? 16.5.px : 22.px,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.h),
          textwidget(
              text:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quasi, eum? Id, culpa? At officia quisquam laudantium nisi mollitia nesciunt, qui porro asperiores cum voluptates placeat similique recusandae in facere quos vitae?',
              fontszie: mobile ? 14.px : 20.px,
              fonweight: FontWeight.w400,
              color: textColor),
          SizedBox(height: 2.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: specifications
                .map((spec) => Column(
                      children: [
                        SpecificationRules(
                          title: spec,
                          mobile: mobile,
                        ),
                        // const SpecificationRules(
                        //   title: '7 Days Returns',
                        // ),
                        // const SpecificationRules(
                        //   title:  'Warranty not Aplicable',
                        // ),
                        // const SpecificationRules(
                        //   title: '100% Brand New Product',
                        // ),
                      ],
                    ))
                .toList(),
          ),
          SizedBox(height: 1.5.h),
          textwidget(
              text:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quasi, eum? Id, culpa? At officia quisquam laudantium nisi mollitia nesciunt, qui porro asperiores cum voluptates placeat similique recusandae in facere quos vitae?',
              fontszie: mobile?14.px:20.px,
              fonweight: FontWeight.w400,
              color: textColor),
        ],
      ),
    );
  }
}

class SpecificationRules extends StatelessWidget {
  const SpecificationRules({
    super.key,
    required this.title, this.mobile,
  });
  final String title;
  final mobile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/check.png',
          color: textColor,
          scale: mobile ? 18 : 16,
        ),
        SizedBox(
          width: 1.w,
        ),
        textwidget(
            text: title,
            fontszie: mobile?14.px:20.px,
            fonweight: FontWeight.w400,
            color: textColor)
      ],
    );
  }
}

/// ICON BUTTON

class DetailPageIconButton extends StatelessWidget {
  const DetailPageIconButton({
    super.key,
    required this.width,
    required this.height,
    required this.widget,
    required this.ontab,
    required this.color,
  });
  final double width;
  final double height;
  final Widget widget;
  final void Function()? ontab;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.sp),
            border: Border.all(
              color: const Color.fromRGBO(58, 60, 88, 1),
            ),
          ),
          child: widget),
    );
  }
}

class ProductHeader extends StatelessWidget {
  const ProductHeader({
    super.key,
    required this.mobile,
    required this.title,
  });

  final bool mobile;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: mobile?5.w:homeTabLP, vertical: 0.5.h),
      decoration: BoxDecoration(
          color: productColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp))),
      height: 13.h,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textwidget(
                  text: title,
                  fontszie: 18.sp,
                  fonweight: FontWeight.w700,
                  color: textColor),
              SizedBox(
                  height: 3.h,
                  width: 5.w,
                  child: Image.asset(
                    'assets/heart (3).png',
                    fit: BoxFit.contain,
                  ))
            ],
          ),
          Row(
            children: [
              Text(
                "\$55",
                style: TextStyle(
                  color: const Color.fromRGBO(202, 50, 68, 1),
                  fontSize: mobile ? 17.sp : 15.5.sp,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: 1.w),
              Text(
                "\$15",
                style: TextStyle(
                  color: textColor,
                  fontSize: mobile ? 14.5.sp : 13.5.sp,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: textColor,
                  decorationThickness: 0.3.h,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      return Padding(
                        padding: EdgeInsets.only(right: mobile ? 0.1.w : 0.3.w),
                        child: Image.asset(
                          'assets/star.png',
                          height: mobile ? 2.5.h : 2.h,
                          width: mobile ? 2.8.w : 1.5.w,
                        ),
                      );
                    }),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  textwidget(
                    text: '3 ratings',
                    fontszie: 14.sp,
                    fonweight: FontWeight.w400,
                    color: textColor,
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 2.h,
                    width: 8.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: const Color.fromRGBO(234, 76, 98, 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: textwidget(
                          text: '5.0',
                          fontszie: 14.sp,
                          fonweight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  textwidget(
                      text: 'Very Good',
                      fontszie: 14.sp,
                      fonweight: FontWeight.w600,
                      color: const Color.fromRGBO(0, 184, 148, 1))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
