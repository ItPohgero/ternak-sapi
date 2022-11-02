import 'package:pemantauan_ternak/app/core/utils/api_helper.dart';
import 'package:pemantauan_ternak/app/core/values/strings.dart';
import 'package:pemantauan_ternak/app/core/values/urls.dart';

class NotifikasiService {
  Future<Map<String, dynamic>> getAllNotifikasiInput() async {
    ApiHelper api = ApiHelper();

    var response = await api.get(Uri.http(
      Strings.BASE_URL,
      Urls.NOTIFIKASI_INPUT,
    ));

    return response;
  }

  Future<Map<String, dynamic>> getAllNotifikasiPemantauan() async {
    ApiHelper api = ApiHelper();

    var response = await api.get(Uri.http(
      Strings.BASE_URL,
      Urls.NOTIFIKASI_PEMANTAUAN,
    ));

    return response;
  }

  Future<Map<String, dynamic>> getAllNotifikasiReminder() async {
    ApiHelper api = ApiHelper();

    var response = await api.get(Uri.http(
      Strings.BASE_URL,
      Urls.NOTIFIKASI_REMINDER,
    ));

    return response;
  }
}
