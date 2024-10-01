import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:shuhaui/features/home/data/model/category.dart';
import 'package:shuhaui/features/home/data/model/collections.dart';
import 'package:shuhaui/features/home/data/model/cycloneoffer.dart';
import 'package:shuhaui/features/home/data/model/fetured_product.dart';
import 'package:shuhaui/features/home/data/model/home_slider_image.dart';
import 'package:shuhaui/features/home/data/model/productdetails.dart';
import 'package:shuhaui/features/home/data/model/top_product.dart';
import 'package:shuhaui/features/home/data/model/weekly_product.dart';

// Future<Map<String, dynamic>> loadProductData() async {
//   final String response = await rootBundle.loadString('assets/products.json');
//   return json.decode(response);
// }

class ProductService {
  var jsonfilepath = 'assets/products.json';

  Future<List<CategoryModel>> fetchCategoryList() async {
    final response = await rootBundle.loadString(jsonfilepath);
    final data = json.decode(response);
    return (data['categories'] as List)
        .map((json) => CategoryModel.fromJson(json))
        .toList();
  }

  Future<List<CycloneOfferModel>> fetchCycloneProductList() async {
    final response = await rootBundle.loadString(jsonfilepath);
    final data = jsonDecode(response);
    return (data["cycloneOffers"] as List)
        .map((json) => CycloneOfferModel.fromJson(json))
        .toList();
  }

  Future<List<TopProductModel>> fetchTopProductList() async {
    final response = await rootBundle.loadString(jsonfilepath);
    final data = jsonDecode(response);
    return (data["topProducts"] as List)
        .map((e) => TopProductModel.fromJson(e))
        .toList();
  }

  Future<List<WeeklyProductModel>> fetchweeklyProductListt() async {
    final response = await rootBundle.loadString(jsonfilepath);
    final data = jsonDecode(response);
    return (data["weeklybestsellerproduct"] as List)
        .map((e) => WeeklyProductModel.fromJson(e))
        .toList();
  }

  Future<List<FeaturedProductModel>> fetchFeaturedProductList() async {
    final response = await rootBundle.loadString(jsonfilepath);
    final data = jsonDecode(response);
    return (data["featuredproducts"] as List)
        .map((e) => FeaturedProductModel.fromJson(e))
        .toList();
  }

  Future<List<CollectionsModel>> fetchCllectionProductList() async {
    final response = await rootBundle.loadString(jsonfilepath);
    final data = jsonDecode(response);
    return (data["collections"] as List)
        .map((e) => CollectionsModel.fromJson(e))
        .toList();
  }

  Future<List<WeeklyProductModel>> fetchchecklistpageProducts() async {
    final response = await rootBundle.loadString(jsonfilepath);
    final data = jsonDecode(response);
    return (data["checklistpageproducts"] as List)
        .map((json) => WeeklyProductModel.fromJson(json))
        .toList();
  }

  Future<List<TopProductModel>> fetchwishListBorderPageProducts() async {
    final response = await rootBundle.loadString(jsonfilepath);
    final data = jsonDecode(response);
    return (data["borderpageproducts"] as List)
        .map((json) => TopProductModel.fromJson(json))
        .toList();
  }

  Future<List<SliderImageModel>> fetchHomesliderImage()async{
    final response = await rootBundle.loadString(jsonfilepath);
    final data = jsonDecode(response);
    return (data["sliderimages"] as List)
        .map((json) => SliderImageModel.fromJson(json))
        .toList();
  }

  Future<List<TopProductModel>> fetchRelatedProducts()async{
    final response = await rootBundle.loadString(jsonfilepath);
    final data = jsonDecode(response);
    return (data["relatedproducts"] as List)
        .map((json) => TopProductModel.fromJson(json))
        .toList();
  }



  Future<List<ProductDetailsModel>> fetchdetailslidableimage()async{
    final response = await rootBundle.loadString(jsonfilepath);
    final data = jsonDecode(response);
    return (data["detailslidableimages"] as List)
        .map((json) => ProductDetailsModel.fromJson(json))
        .toList();
  }
  Future<List<CycloneOfferModel>> fetchFlashProducts()async{
    final response = await rootBundle.loadString(jsonfilepath);
    final data = jsonDecode(response);
    return (data["flash"] as List)
        .map((json) => CycloneOfferModel.fromJson(json))
        .toList();
  }
















//// START FUNCTION TO ADD ITEM ON THE JSON FILE
Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/products.json'); // Your JSON file
}














}
