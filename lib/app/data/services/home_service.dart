import 'package:pemantauan_ternak/app/core/utils/api_helper.dart';
import 'package:pemantauan_ternak/app/core/values/urls.dart';

class HomeService {
  Future<Map<String, dynamic>> getAkun() async {
    ApiHelper api = ApiHelper();

    var response = await api.get(Uri.http(
      Urls.BASE_URL,
      Urls.AKUN,
    ));

    return response;
  }

  getNewToken() async {
    ApiHelper api = ApiHelper();
    await api
        .get(Uri.http(Urls.BASE_URL, Urls.REFRESH_TOKEN))
        .then((res) => print("GET NEW TOKEN : $res"));
  }
}
