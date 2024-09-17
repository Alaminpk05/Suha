import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/cart/cart_view.dart';
import 'package:shuhaui/features/home/home_view.dart';
import 'package:shuhaui/features/cart.dart';
import 'package:shuhaui/features/chat.dart';
import 'package:shuhaui/features/pages.dart';
import 'package:shuhaui/features/settins.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class Tabapges extends StatefulWidget {
  const Tabapges({super.key});

  @override
  State<Tabapges> createState() => _TabapgesState();
}

class _TabapgesState extends State<Tabapges> {
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
      'page': const Pages(),
    }
  ];
  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    var tablet = ResponsiveHelper.isTablet(context);
    return Scaffold(
      body: pagedetails[selectedIndex]['page'],
      bottomNavigationBar: mobile?bottomNavBar(mobile,tablet):Container(
        height: 6.h,
        color: const Color.fromRGBO(51, 40, 88, 1),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 11.w), // Padding for spacing
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildChoiceChip(0, 'assets/home (1).png', "Home"),
              _buildChoiceChip(1, 'assets/message (1).png', "Chat"),
              _buildChoiceChip(2,  'assets/basket (2).png', "Cart"),
              _buildChoiceChip(3,  'assets/settings (1).png' ,"Settings"),
              _buildChoiceChip(4, 'assets/heart (1).png', "Pages"),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildChoiceChip(int builchipindex, String assetPath, String label) {
    return ChoiceChip(
      labelPadding: const EdgeInsets.symmetric(horizontal: 0),
      backgroundColor: const Color.fromRGBO(51, 40, 88, 1),
      selectedColor: const Color.fromRGBO(51, 40, 88, 1),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color.fromRGBO(51, 40, 88, 1), // No border when unselected
          width: .0,
        ),
        borderRadius: BorderRadius.circular(25.sp), // Rounded border
      ),
      selected: selectedIndex == builchipindex,
      onSelected: (bool  selected) {
        setState(() {
        selectedIndex = builchipindex ;
        });
      },
      label: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            assetPath,
            height: 2.8.h, // Adjust the image size
            color: builchipindex == builchipindex
                ? Colors.white
                : Colors.white, // Change color based on selection
          ),
           const SizedBox(height: 0.0),
          Text(
            label,
            style: TextStyle(
              color: builchipindex == builchipindex
                  ? Colors.white
                  : Colors.white, // Change color based on selection
              fontSize: 13.sp,
            ),
          )
        ],
      ),
    );
  }




  BottomNavigationBar bottomNavBar(var mobile,var tablet) {
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
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/home (1).png',
                color: Colors.white,
                height: 3.h,
              ),
              label: "Home"),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/message (1).png',
              color: Colors.white,
              height: 3.h,
            ),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/basket (2).png',
              color: Colors.white,
              height: 3.h,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/settings (1).png',
                color: Colors.white,
                height: 3.h,
              ),
              label: "Settings"),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/heart (1).png',
                fit: BoxFit.contain,
                color: Colors.white,
                height: 3.h,
              ),
              label: "Pages"),
        ]);
  }
}
