import 'package:arzonuz/features/arzonuz/product/data/model/product_model/product_responce.dart';
import 'package:dio/dio.dart';

class ProductDatasource {
  final Dio dio = Dio();
  final String baseUrl = 'http://13.38.70.151:8080';

  Future<void> createProduct(
      String refreshToken, ProductResponce productResponce) async {
    try {
      final url = '$baseUrl/products';
      await dio.post(
        url,
        data: productResponce.toMap(),
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getMyProducts(String refreshToken) async {
    try {
      final url = '$baseUrl/products';
      final responce = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );
      if (responce.statusCode == 200) {
        return responce.data;
      }
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
    return null;

  }

  Future<Map<String, dynamic>?> getProducts(String refreshToken) async {
    try {
      final url = '$baseUrl/products/list';
      final responce = await dio.post(
        url,
        data: {},
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );
      if (responce.statusCode == 200) {
        return responce.data;
      } else {
        return {};
      }
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }


  Future<void> addToWishlist(String refreshToken, String productId) async {
    try {
      final url = '$baseUrl/wishlist/$productId';
 await dio.post(
        url,
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getWishlist(String refreshToken) async {
    try {
      final url = '$baseUrl/wishlist';
      final responce = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );

      if (responce.statusCode == 200) {
        return responce.data;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteProduct(String refreshToken, String productId) async {

    try {
      final url = '$baseUrl/products/$productId';
     await dio.delete(
        url,
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );
  
    } catch (e) {
      rethrow;
    }
  }
}