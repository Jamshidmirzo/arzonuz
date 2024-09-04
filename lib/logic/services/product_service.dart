import 'package:arzonuz/data/models/product_responce.dart';
import 'package:dio/dio.dart';

class ProductService {
  final Dio dio = Dio();
  final String baseUrl = 'http://13.38.70.151:8080';

  Future<void> createProduct(
      String refreshToken, ProductResponce productResponce) async {
    try {
      final url = '$baseUrl/cards';
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
}
