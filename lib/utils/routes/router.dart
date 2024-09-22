import 'package:go_router/go_router.dart';
import 'package:shuhaui/features/bottom_nav_bar/tabapges.dart';
import 'package:shuhaui/features/cart/cart_view.dart';
import 'package:shuhaui/features/chat.dart';
import 'package:shuhaui/features/home/home_view.dart';
import 'package:shuhaui/features/pages/pages.dart';
import 'package:shuhaui/features/settins.dart';

class AppRouter {
   String bottompage='/';
   
   static final GoRouter router = GoRouter(
    initialLocation: '/',
   
   routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const Bottompage(),
      ),
       GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/chat',
        builder: (context, state) => const Chat(),
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) => const CartView(title: 'My Cart',),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const Settings(),
      ),
      GoRoute(
        path: '/pages',
        builder: (context, state) => const Pages(),
      ),


   ]);
}
