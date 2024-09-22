import 'package:flutter/material.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/weeklybestsellerscard.dart';

class Categoryview extends StatelessWidget {
  final String title;
  final String image;
  const Categoryview({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child:ListView.builder(
            itemCount:20,itemBuilder: (context,index){
          return WeeklyProductsCard(image: image, title: title);
        }
        ),
      ),

    );
  }
}
