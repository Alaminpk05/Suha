import 'package:flutter/cupertino.dart';

class ResponsiveHelper{
  static double screenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  static double screenHeight(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  static bool isMobile(BuildContext context){
    return MediaQuery.of(context).size.width<600;
  }
  static bool isTablet(BuildContext context){
    return MediaQuery.of(context).size.width>600;
  }
}