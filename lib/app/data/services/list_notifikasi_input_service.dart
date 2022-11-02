import 'package:pemantauan_ternak/app/core/utils/api_helper.dart';
import 'package:pemantauan_ternak/app/core/values/urls.dart';

class ListNotifikasiInputService {
  Future<Map<String, dynamic>> getAll(int idPetugas) async {
    ApiHelper api = ApiHelper();

    var response = await api.get(Uri.http(
      Urls.BASE_URL,
      Urls.NOTIFIKASI_INPUT + idPetugas.toString(),
    ));

    return response;
  }
}
