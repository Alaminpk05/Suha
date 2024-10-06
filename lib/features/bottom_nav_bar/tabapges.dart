import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/cart&checkout.dart/cart/cart_view.dart';
import 'package:shuhaui/features/home/home_view.dart';
import 'package:shuhaui/features/chat.dart';
import 'package:shuhaui/features/pages/pages.dart';
import 'package:shuhaui/features/settins.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class Bottompage extends StatefulWidget {
  const Bottompage({super.key, });

  @override
  State<Bottompage> createState() => _BottompageState();
}

class _BottompageState extends State<Bottompage> {
  int selectedIndex = 0;
  List<Map<String, dynamic>> pagedetails = [
    {
      'page': const HomeScreen(),
    },
    {
      'page': const Chat(),
    },
    {
      'page': const CartView(title: 'MY Cart'),
    },
    {
      'page': const Settings(),
    },
    {
      'page': const Pages(
      
      ),
    }
  ];
  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    var tablet = ResponsiveHelper.isTablet(context);
    return SafeArea(
      child: Scaffold(
        body: pagedetails[selectedIndex]['page'],
        bottomNavigationBar: mobile
            ? bottomNavBar(mobile, tablet)
            : Container(
                height: 6.h,
                color: scaffoldColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 11.w), // Padding for spacing
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildChoiceChip(0, 'assets/home (1).png', "Home"),
                      _buildChoiceChip(1, 'assets/message (1).png', "Chat"),
                      _buildChoiceChip(2, 'assets/basket (2).png', "Cart"),
                      _buildChoiceChip(
                          3, 'assets/settings (1).png', "Settings"),
                      _buildChoiceChip(4, 'assets/heart (1).png', "Pages"),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildChoiceChip(int builchipindex, String assetPath, String label) {
    return ChoiceChip(
      labelPadding: const EdgeInsets.symmetric(horizontal: 0),
      backgroundColor:scaffoldColor,
      selectedColor: scaffoldColor,
      shape: RoundedRectangleBorder(
        side:  BorderSide(
           color: scaffoldColor, // No border when unselected
          width: .0,
        ),
        borderRadius: BorderRadius.circular(25.sp), // Rounded border
      ),
      selected: selectedIndex == builchipindex,
      onSelected: (bool selected) {
        setState(() {
          selectedIndex = builchipindex;
        });
      },
      label: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            assetPath,
            height: 2.8.h, // Adjust the image size
             // Change color based on selection
          ),
          const SizedBox(height: 0.0),
          Text(
            label,
            style: TextStyle(
              color: bottomnavIconColor,// Change color based on selection
              fontSize: 13.sp,
            ),
          )
        ],
      ),
    );
  }

  BottomNavigationBar bottomNavBar(var mobile, var tablet) {
    Device.screenType == ScreenType.tablet;
    return BottomNavigationBar(
        currentIndex: selectedIndex,
        unselectedFontSize: 13.sp,
        selectedFontSize: 13.sp,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        iconSize: 12.sp,
        unselectedItemColor: bottomnavIconColor,
        selectedItemColor: bottomnavIconColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house
                ,
              size: 3.h,),

              label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_text,
            size: 3.h,),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart,
            size: 3.h,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings,size: 3.h,


              ),

              label: "Settings"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart,size: 3.h,),
              label: "Pages"),
        ]);
  }
}
