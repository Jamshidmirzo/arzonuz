import 'package:arzonuz/features/arzonuz/data/models/process_models/process_request.dart';
import 'package:dio/dio.dart';

class ProcessService {
  final Dio dio = Dio();
  final String baseUrl = 'http://13.38.70.151:8080';

  Future<Map<String, dynamic>?> buy(
      ProcessRequest processRequest, String refreshToken) async {
    try {
      final String url = '$baseUrl/process/buy';
      print("Process Request: ${processRequest.toMap()}");

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
        print("Response data: ${response.data}");
        return response.data; 
      } else {
        print("Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      print("Error during buy request: $e");
      rethrow;
    }

    return null;
  }
}
