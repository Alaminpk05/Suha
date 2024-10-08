// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/authentication/change_password.dart';
import 'package:shuhaui/features/authentication/forget_pass_success.dart';
import 'package:shuhaui/features/authentication/login/forgot.dart';
import 'package:shuhaui/features/authentication/login/login.dart';
import 'package:shuhaui/features/authentication/otp_confirmation.dart';
import 'package:shuhaui/features/authentication/otp_send.dart';
import 'package:shuhaui/features/authentication/registration/registration.dart';
import 'package:shuhaui/features/bottom_nav_bar/tabapges.dart';
import 'package:shuhaui/features/cart&checkout.dart/cart/cart_view.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/bank_transfer_page.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/billing_information.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/cash_page.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/choose_payment_method.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/credit_page.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/payment_success.dart';
import 'package:shuhaui/features/cart&checkout.dart/checkout/payple_page.dart';
import 'package:shuhaui/features/feature_products.dart';
import 'package:shuhaui/features/flash_sale.dart';
import 'package:shuhaui/features/flash_screen.dart';
import 'package:shuhaui/features/home/Widgets/SectionWidgets/homeappbar.dart';
import 'package:shuhaui/features/order_status.dart';
import 'package:shuhaui/features/pages/widgets/button_widgets.dart';
import 'package:shuhaui/features/product_category.dart';
import 'package:shuhaui/features/shop_grid.dart';
import 'package:shuhaui/features/shop_list.dart';
import 'package:shuhaui/features/sub_category.dart';
import 'package:shuhaui/features/wish_list.dart';
import 'package:shuhaui/utils/constant/static.dart';
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
          padding: EdgeInsets.symmetric(
              vertical: 2.h, horizontal: mobile ? 0 : homeTabLP),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (c) => const Bottompage()));
                  },
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShopList()));
                  },
                  title: 'Shop List',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(

                    //         builder: (context) =>   PageDetails()));
                  },
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
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SubProductCategory()));
                  },
                  title: 'Sub Category',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WishList()));
                  },
                  title: 'Wishlist Grid',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WishList()));
                  },
                  title: 'Whishlist List',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FlashSale()));
                  },
                  title: 'Flash Sale',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FeaturedProductPage()));
                  },
                  title: 'Featured Products',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OrderStatus()));
                  },
                  title: 'Order Status',
                ),
                PagesTitleText(
                  title: 'Vendor',
                  fontsize: 15.5.sp,
                  fontWeight: FontWeight.w400,
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
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => const CartView()));
                  },
                  title: 'Cart',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => const BillingInformation()));
                  },
                  title: 'Checkout',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) =>  BankTransferPage()));
                  },
                  title: 'Checkout Bank',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => const CashPage()));
                  },
                  title: 'Checkout Cash',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => const CreditPage()));
                  },
                  title: 'Checkout Credit Card',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>
                    const ChoosePaymentMethod()));
                  },
                  title: 'Checkout Payment',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => const PaypalPage()));
                  },
                  title: 'Checkout Paypal',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  PaymentSuccessPage()));
                  },
                  title: 'Payment Success',
                ),
                PagesTitleText(
                  title: 'Authentication',
                  fontsize: 15.5.sp,
                  fontWeight: FontWeight.w400,
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Login()));
                  },
                  title: 'Login',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Registration()));
                  },
                  title: 'Register',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OTPSendPage()));
                  },
                  title: 'OTP Send',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OTPConfirmationPage()));
                  },
                  title: 'OTP Confirmation',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPassword()));
                  },
                  title: 'Forget Password',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChangePasswordPage()));
                  },
                  title: 'Change Password',
                ),
                ElevatedIconTextButton(
                  mobile: mobile,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ForgetPassStatusPage()));
                  },
                  title: 'Forget Password Success',
                ),
                PagesTitleText(
                  title: 'Blog',
                  fontsize: 15.5.sp,
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
