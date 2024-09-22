// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/flash_screen.dart';
import 'package:shuhaui/features/home/Widgets/SectionWidgets/homeappbar.dart';
import 'package:shuhaui/features/pages/widgets/button_widgets.dart';
import 'package:shuhaui/features/product_category.dart';
import 'package:shuhaui/features/shop_grid.dart';
import 'package:shuhaui/features/shop_list.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class Pages extends StatelessWidget {
  const Pages({super.key});

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Home',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FlashScreen()));
                  },
                  title: 'Intro/Fash Screen',
                ),
                PagesTitleText(
                  title: 'Shop',
                  fontsize: 15.5.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(116, 118, 140, 1),
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShopGrid()));
                  },
                  title: 'Shop Grid',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const ShopList()));
                  },
                  title: 'Shop List',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Product Details',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductCategory()));
                  },
                  title: 'Category',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Sub Category',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Wishlist Grid',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Whishlist List',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Flash Sale',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Featured Products',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Order Status',
                ),
                PagesTitleText(
                  title: 'Vendor',
                  fontsize: 15.5.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(116, 118, 140, 1),
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Vendors',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Vendor Shop',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Become A Vendor',
                ),
                PagesTitleText(
                  title: 'Cart & Checkout',
                  fontsize: 15.5.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(116, 118, 140, 1),
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Cart',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Checkout',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Checkout Bank',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Checkout Cash',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Checkout Credit Card',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Checkout Payment',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Checkout Paypal',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Payment Success',
                ),
                PagesTitleText(
                  title: 'Authentication',
                  fontsize: 15.5.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(116, 118, 140, 1),
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Login',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Register',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'OTP Send',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'OTP Confirmation',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Forget Password',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Change Password',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Forget Password Success',
                ),
                PagesTitleText(
                  title: 'Blog',
                  fontsize: 15.5.sp,
                  color: const Color.fromRGBO(116, 118, 140, 1),
                  fontWeight: FontWeight.w400,
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Blog Grid',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Blog List',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Blog Details',
                ),
                PagesTitleText(
                  title: "Chat & Notifications",
                  fontsize: 15.5.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(116, 118, 140, 1),
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Message/Chat',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Notification',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Notificartion Details',
                ),
                PagesTitleText(
                  title: "Miscellaneous",
                  fontsize: 15.5.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(116, 118, 140, 1),
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Profile',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Edit Profile',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'About Us',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Contact Us',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Offline',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Selected Language',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Privacy Policy',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Settings',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {},
                  title: 'Support',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
