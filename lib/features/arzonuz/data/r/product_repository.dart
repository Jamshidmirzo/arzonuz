import 'package:arzonuz/features/arzonuz/data/models/product_model/product.dart';
import 'package:arzonuz/features/arzonuz/data/models/product_model/product_responce.dart';
import 'package:arzonuz/features/arzonuz/data/datasources/product_service.dart';
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

  Future<List<Product>> getMyProducts() async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken = shared.getString('refreshToken');
      if (refreshToken != null) {
        final responce = await productService.getMyProducts(refreshToken);
        if (responce != null && responce.isNotEmpty) {
          List<Product> products = [];
          for (var element in responce['product']) {
            products.add(
              Product.fromMap(element),
            );
          }
          return products;
        }
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Product>> getAllProducts() async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken = shared.getString('refreshToken');
      if (refreshToken != null) {
        final response = await productService.getProducts(refreshToken);
        if (response != null && response.isNotEmpty) {
          List<Product> products = [];
          for (var element in response['product']) {
            products.add(Product.fromMap(element));
          }
          return products;
        }
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  addToWishlist(String productId) async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken = shared.getString('refreshToken');
      if (refreshToken != null) {
        await productService.addToWishlist(refreshToken, productId);
      }
    } catch (e) {
      rethrow;
    }
  }

  deleteProduct(String productId) async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken = shared.getString('refreshToken');
      if (refreshToken != null) {
        await productService.deleteProduct(refreshToken, productId);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Product>?> getWishlist() async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken = shared.getString('refreshToken');
      if (refreshToken != null) {
        final responce = await productService.getWishlist(refreshToken);
        if (responce != null) {
          List<Product> products = [];
          for (var element in responce['wish_list']) {
            print('qwertgh');
            print(element);
            products.add(Product.fromMap(element));
          }

          return products;
        } else {
          return null;
        }

        //  if (responce != null) {
        //   List<Product> products = [];
        //   for (var element in responce['product']) {
        //     print(element);
        //     print(Product.fromMap(element));
        //     products.add(Product.fromMap(element));
        //   }
        //   print(products.first.name);
        //   return products;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
