import 'package:pemantauan_ternak/app/core/utils/api_helper.dart';
import 'package:pemantauan_ternak/app/core/values/strings.dart';
import 'package:pemantauan_ternak/app/core/values/urls.dart';

class ListSapiService {
  Future<Map<String, dynamic>> getAll(int idKandang, int page) async {
    ApiHelper api = ApiHelper();

    var response = await api.get(Uri.http(Strings.BASE_URL, Urls.LIST_SAPI,
        {'id_kandang': idKandang.toString(), 'page': page.toString()}));

    return response;
  }
}
