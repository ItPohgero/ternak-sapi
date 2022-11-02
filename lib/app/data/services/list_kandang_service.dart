import 'package:pemantauan_ternak/app/core/utils/api_helper.dart';
import 'package:pemantauan_ternak/app/core/values/urls.dart';

class ListKandangService {
  Future<Map<String, dynamic>> getAll(int idPeternakan) async {
    ApiHelper api = ApiHelper();

    var response = await api.get(Uri.http(
      Urls.BASE_URL,
      Urls.LIST_KANDANG + idPeternakan.toString(),
    ));

    return response;
  }
}
