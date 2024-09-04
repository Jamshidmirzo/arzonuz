import 'package:arzonuz/data/models/product_responce.dart';
import 'package:arzonuz/logic/services/product_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductRepository {
  ProductService productService = ProductService();

  createProduct(
    ProductResponce productResponce,
  ) async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken = shared.getString('refreshToken');
      if (refreshToken != null) {
        return productService.createProduct(refreshToken, productResponce);
      }
    } catch (e) {
      rethrow;
    }
  }
}
