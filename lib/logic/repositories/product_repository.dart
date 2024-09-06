import 'package:arzonuz/data/models/product_model/product.dart';
import 'package:arzonuz/data/models/product_model/product_responce.dart';
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

  Future<List<Product>?> getMyProducts() async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken = shared.getString('refreshToken');
      if (refreshToken != null) {
        final responce = await productService.getMyProducts(refreshToken);
        print('from repppppsssss');
        print(responce);
        if (responce != null) {
          List<Product> products = [];
          for (var element in responce['product']) {
            products.add(
              Product.fromMap(element),
            );
          }
          return products;
        } else {
          return [];
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Product>?> getAllProducts() async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken = shared.getString('refreshToken');
      if (refreshToken != null) {
        final responce = await productService.getProducts(refreshToken);
        if (responce != null) {
          List<Product> products = [];
          for (var element in responce['product']) {
            print(element);
            print(Product.fromMap(element));
            products.add(Product.fromMap(element));
          }
          print(products.first.name);
          return products;
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
