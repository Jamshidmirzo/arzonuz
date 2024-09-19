import 'package:arzonuz/features/arzonuz/data/models/process_models/process_request.dart';
import 'package:arzonuz/features/arzonuz/data/datasources/process_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProcessRepository {
  ProcessService processService = ProcessService();

  Future<String> buy(ProcessRequest processRequest) async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken = shared.getString('refreshToken');
      if (refreshToken != null) {
        final responce = await processService.buy(processRequest, refreshToken);
        print(responce);
        if (responce != null) {
          return responce['id'];
        }
      }
      return '';
    } catch (e) {
      rethrow;
    }
  }
}
