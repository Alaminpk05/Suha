import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/cart/cart_view.dart';
import 'package:shuhaui/features/chat.dart';
import 'package:shuhaui/features/home/home_view.dart';
import 'package:shuhaui/features/settins.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Create the controller for the PersistentTabView
  PersistentTabController _controller = PersistentTabController();

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  // List of pages for each tab
  List<Widget> _buildScreens() {
    return const [
      HomeScreen(),
      Chat(),
      CartView(title: 'Cart Page',),
      Settings(),
      // Pages(),
    ];
  }

  // Define the items (icons, labels) for the BottomNavBar
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        iconSize: 5.sp,
        textStyle: TextStyle(
          fontSize: 13.sp,
          color: Colors.white, // Text color set to white
        ),
        icon: Image.asset(
          'assets/home (1).png',
        ),
        title: ("Home"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
        // Reduce the space between icon and label
      ),
      PersistentBottomNavBarItem(
        iconSize: 12.sp,
        textStyle: TextStyle(
          fontSize: 13.sp,
          color: Colors.white, // Text color set to white
        ),
        icon: Image.asset(
          'assets/message (1).png',
          
        ),
        title: ("Chat"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
       
      ),
      PersistentBottomNavBarItem(
        iconSize: 12.sp,
        textStyle: TextStyle(
          fontSize: 13.sp,
          color: Colors.white, // Text color set to white
        ),
        icon: Image.asset(
          'assets/basket (2).png',
         
        ),
        title: ("Cart"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
        
      ),
      PersistentBottomNavBarItem(
        iconSize: 12.sp,
        textStyle: TextStyle(
          fontSize: 13.sp,
          color: Colors.white, // Text color set to white
        ),
        icon: Image.asset(
          'assets/settings (1).png',
        
        ),
        title: ("Settings"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
       
      ),
      PersistentBottomNavBarItem(
        iconSize: 7.sp,
        textStyle: TextStyle(
          fontSize: 13.sp,
          color: Colors.white, // Text color set to white
        ),
        icon: Image.asset(
          'assets/heart (1).png',
         
        ),
        title: ("Pages"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
       
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use the PersistentTabView widget for the bottom nav bar
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineToSafeArea: false,
        backgroundColor:
            const Color(0xFF38266D), // Background color of the bottom nav
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,

        stateManagement: true,
        bottomScreenMargin: 10,
        hideNavigationBarWhenKeyboardAppears: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(0),
          colorBehindNavBar: Colors.white,
        ),
        padding: EdgeInsets.only(top: 0.5.h, bottom: 0.5.h),

        popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
        navBarStyle: NavBarStyle.simple, // Custom style for nav bar
      ),
    );
  }
}
