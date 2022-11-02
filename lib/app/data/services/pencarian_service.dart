import 'package:pemantauan_ternak/app/core/utils/api_helper.dart';
import 'package:pemantauan_ternak/app/core/values/strings.dart';
import 'package:pemantauan_ternak/app/core/values/urls.dart';

class PencarianService {
  Future<Map<String, dynamic>> getAll(String search, int page) async {
    ApiHelper api = ApiHelper();

    var response = await api.get(Uri.http(Strings.BASE_URL, Urls.LIST_SAPI,
        {'search': search, 'page': page.toString()}));

    return response;
  }
}
