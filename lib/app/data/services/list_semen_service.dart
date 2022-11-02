import 'package:pemantauan_ternak/app/core/utils/api_helper.dart';
import 'package:pemantauan_ternak/app/core/values/strings.dart';
import 'package:pemantauan_ternak/app/core/values/urls.dart';

class ListSemenService {
  Future<Map<String, dynamic>> getAll() async {
    ApiHelper api = ApiHelper();

    var response = await api.get(Uri.http(Strings.BASE_URL, Urls.LIST_SEMEN));

    return response;
  }
}
