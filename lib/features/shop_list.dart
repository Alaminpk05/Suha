// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:shuhaui/features/bottom_nav_bar/tabapges.dart';
// import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
// import 'package:shuhaui/utils/constant.dart';
// import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
// import 'package:shuhaui/utils/global_widgets/custom_simple_appbar.dart';
// import 'package:shuhaui/utils/global_widgets/horizontal_prduct_lis.dart';
// import 'package:shuhaui/utils/respnsive_helper.dart';

// class ShopList extends StatelessWidget {
//   const ShopList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var mobile = ResponsiveHelper.isMobile(context);
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(mobile ? kToolbarHeight : 5.5.h),
//         child: CustomSimpleAppBar(
//           title: 'Shop List',
//           navigation: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (cxt) => const Bottompage()));
//           },
//           widget: const CircleMenu(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
//           child: Column(
//             children: [
//               HorizontalProductList(mobile: mobile),
//               SizedBox(
//                 height: 3.h,
//               ),
//               ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: 4,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) {
                    
//                     // var infiniteIndex = index % horizontalProductList.length;
//                     // var item = horizontalProductList[infiniteIndex];
//                     return Container(
//                       margin: EdgeInsets.symmetric(
//                           horizontal: mobile ? 0.w : 0, vertical: 0.4.h),
//                       height: 16.h,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: const Color.fromRGBO(
//                             36, 38, 68, 1), // Use the passed container color
//                         borderRadius: BorderRadius.circular(10.sp),
//                       ),
//                       child: Row(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(top: 1.2.h),
//                             padding: EdgeInsets.only(top: 1.h, bottom: 0.5.h),
//                             height: 12.h,
//                             width: mobile ? 27.w : 18.w,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(13.sp),
//                                 color: const Color.fromRGBO(51, 40, 88, 1)),
//                             child: Stack(children: [
//                               Positioned(
//                                 left: 3.w,
//                                 bottom: 0,
//                                 top: 0,
//                                 child: SizedBox(
//                                   height: 22.h,
//                                   width: 19.w,
//                                   child: Image.asset(
//                                    'assets/4.png',
//                                     fit: BoxFit.contain,
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 left: 2.w,
//                                 bottom: 6.3.h,
//                                 child: Container(
//                                   height: 5.h,
//                                   width: 6.w,
//                                   decoration: const BoxDecoration(
//                                       color: Color.fromRGBO(36, 38, 68, 1),
//                                       shape: BoxShape.circle),
//                                   child: Padding(
//                                     padding: EdgeInsets.all(8.5.sp),
//                                     child: Image.asset(
//                                       'assets/heart (3).png',
//                                       height: 4.h,
//                                       width: 4.w,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ]),
//                           ),
//                           SizedBox(width: 2.5.w),
//                           Expanded(
//                             child: Padding(
//                               padding: EdgeInsets.only(left: 1.w),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.only(
//                                       top: 1.8.h,
//                                     ),
//                                     child: Text(
//                                       'Nesecafe Coffe Jar',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 16.5.sp,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                       maxLines: 2,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 5),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         '\$',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 11.sp,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 1.w,
//                                       ),
//                                       Text(
//                                         '\$54',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 16.sp,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       SizedBox(width: 1.8.w),
//                                       const Text(
//                                         '\$64',
//                                         style: TextStyle(
//                                           color: Color(0xFFDC3545),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w600,
//                                           decoration:
//                                               TextDecoration.lineThrough,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 5),
//                                   const Row(
//                                     children: [
//                                       Icon(Icons.star,
//                                           color: Colors.amber, size: 16),
//                                       SizedBox(width: 4),
//                                       Text(
//                                         "4.88",
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                       Text(
//                                         " (125 Reviews",
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 0.8.h,
//                                   ),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                         color: const Color.fromRGBO(0, 184, 148, 1),
//                                         borderRadius:
//                                             BorderRadius.circular(10.sp)),
//                                     height: 3.8.h,
//                                     width: 23.w,
//                                     child: Align(
//                                       alignment: Alignment.center,
//                                       child: textwidget(
//                                           text: 'Add to cart',
//                                           fontszie: 15.sp,
//                                           fonweight: FontWeight.w700,
//                                           color: Colors.white),
//                                     ),
//                                   ),

//                                   //  ElevatedTextButton(
//                                   //     text: 'Add to cart',
//                                   //     elevation: 0,
//                                   //     fontsize: 15.5.sp,
//                                   //     fontWeight: FontWeight.w700,
//                                   //     height: 3.5.h,
//                                   //     width: 26.5.w,
//                                   //     radius: 8.sp,
//                                   //     buttoncolor:
//                                   //         Color.fromRGBO(0, 184, 148, 1),
//                                   //     textcolor: Colors.white,
//                                   //     ontap: () {})
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
