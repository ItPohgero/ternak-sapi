import 'package:pemantauan_ternak/app/core/utils/api_helper.dart';
import 'package:pemantauan_ternak/app/core/values/urls.dart';

class ListNotifikasiPemantauanService {
  Future<Map<String, dynamic>> getAll(int idStatus) async {
    ApiHelper api = ApiHelper();

    var response = await api.get(Uri.http(
      Urls.BASE_URL,
      Urls.NOTIFIKASI_PEMANTAUAN + idStatus.toString(),
    ));

    return response;
  }
}
