import 'package:get/get.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = CaseMode
    httpClient.baseUrl = 'http://localhost:8000';

    super.onInit();
  }
}
