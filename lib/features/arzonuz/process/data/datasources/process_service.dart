import 'package:arzonuz/features/arzonuz/process/data/model/process_models/process_request.dart';
import 'package:dio/dio.dart';

class ProcessService {
  final Dio dio = Dio();
  final String baseUrl = 'http://13.38.70.151:8080';

  Future<Map<String, dynamic>?> buy(
      ProcessRequest processRequest, String refreshToken) async {
    try {
      final String url = '$baseUrl/process/buy';

      final response = await dio.post(
        url,
        data: processRequest.toMap(),
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {

        return response.data; 
      } else {

      }
    } catch (e) {

      rethrow;
    }

    return null;
  }
}
