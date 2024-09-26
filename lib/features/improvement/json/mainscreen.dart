import 'package:flutter/material.dart';
import 'package:shuhaui/features/improvement/json/model/category.dart';
import 'package:shuhaui/features/improvement/json/model/cycloneoffer.dart';
import 'package:shuhaui/features/improvement/json/model/top_product.dart';
import 'package:shuhaui/features/improvement/json/repository/load_product_data.dart';
import 'package:shuhaui/features/improvement/json/widgets/top_product.dart';
import 'widgets/category_widget.dart';
import 'widgets/cyclone_offer_widget.dart';

class ProductDisplayScreen extends StatefulWidget {
  @override
  _ProductDisplayScreenState createState() => _ProductDisplayScreenState();
}

class _ProductDisplayScreenState extends State<ProductDisplayScreen> {
  late List<Category> categories = [];
  late List<CycloneOffer> cycloneOffers = [];
  late List<TopProduct> topProducts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final data = await loadProductData();
    setState(() {
      categories = (data['categories'] as List)
          .map((item) => Category.fromJson(item))
          .toList();
      cycloneOffers = (data['cycloneOffers'] as List)
          .map((item) => CycloneOffer.fromJson(item))
          .toList();
      topProducts = (data['topProducts'] as List)
          .map((item) => TopProduct.fromJson(item))
          .toList();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Display')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Categories Section
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width:MediaQuery.of(context).size.width ,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryWidget(category: categories[index]);
                    },
                  ),
                ),
                const Divider(),

                // Cyclone Offers Section
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Cyclone Offers',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 180,
                 width:MediaQuery.of(context).size.width ,
                  child: ListView.builder(
                    
                    itemCount: cycloneOffers.length,
                    itemBuilder: (context, index) {
                      return CycloneOfferWidget(offer: cycloneOffers[index]);
                    },
                  ),
                ),
                const Divider(),

                // Top Products Section
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Top Products',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 100,
                width:MediaQuery.of(context).size.width ,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: topProducts.length,
                    itemBuilder: (context, index) {
                      return TopProductWidget(product: topProducts[index]);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
