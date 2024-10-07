import 'package:flutter/material.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';

class BankTransferPage extends StatelessWidget {
   BankTransferPage
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  CustomAppBar(title: 'Bank Info', widget: MenuWidget()),
      body:Container(),
    );
  }
}