import 'package:get_it/get_it.dart';
import 'package:shuhaui/features/home/data/repository/load_product_data.dart';

final getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton<ProductService>(()=>ProductService());
  
}
