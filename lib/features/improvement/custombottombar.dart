import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:shuhaui/features/cart/cart_view.dart';
import 'package:shuhaui/features/home/home_view.dart';
import 'package:shuhaui/features/chat.dart';
import 'package:shuhaui/features/pages/pages.dart';
import 'package:shuhaui/features/settins.dart';


class Bottompage extends StatefulWidget {
  const Bottompage({super.key});

  @override
  State<Bottompage> createState() => _BottompageState();
}

class _BottompageState extends State<Bottompage> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const Chat(),
      const CartView(title: 'MY Cart'),
      const Settings(),
      const Pages(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/home (1).png', height: 3.h),
        title: "Home",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/message (1).png', height: 3.h),
        title: "Chat",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/basket (2).png', height: 3.h),
        title: "Cart",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/settings (1).png', height: 3.h),
        title: "Settings",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/heart (1).png', height: 3.h),
        title: "Pages",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineToSafeArea: true,
        backgroundColor: const Color.fromRGBO(51, 40, 88, 1),
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarStyle: NavBarStyle.style1, // Choose your desired nav bar style
        decoration: NavBarDecoration(
          colorBehindNavBar: Colors.white,
          borderRadius: BorderRadius.circular(0),
        ),
        popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      ),
    );
  }
}
