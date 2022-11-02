import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pemantauan_ternak/app/core/utils/storage_provider.dart';
import 'package:pemantauan_ternak/app/routes/app_routes.dart';

class ApiHelper {
  Future<dynamic> get(Uri url) async {
    var jsonResponse;

    try {
      final response = await http.get(url, headers: _headers);
      jsonResponse = _returnResponse(response);
    } catch (e) {
      print("HTTP ERROR : " + e.toString());
      this.otherError(e.toString());
    }

    return jsonResponse;
  }

  Future<dynamic> post(Uri url, Map data) async {
    var jsonResponse;

    try {
      final response = await http.post(url, body: data, headers: _headers);
      jsonResponse = _returnResponse(response);
    } catch (e) {
      print("HTTP ERROR : " + e.toString());
      this.otherError(e.toString());
    }

    return jsonResponse;
  }

  dynamic _returnResponse(http.Response response) {
    // print(response.body);
    // print(_headers);

    switch (response.statusCode) {
      case 200:
        var data = json.decode(response.body.toString());

        if (data['token'].toString().isNotEmpty &&
            data['token'].toString() != '' &&
            data['token'].toString() != null &&
            data['token'].toString() != "null") {
          _saveToken(data['token']);
          print("TOKEN " + data['token'].toString());
        }

        return data;
        break;
      case 401:
      case 403:
        Get.offAllNamed(AppRoutes.LOGIN);
        Get.snackbar("Sesi Habis", "Maaf, sesi aplikasi sudah habis..");
        StorageProvider.emptySession();
        break;
      case 500:
        Get.offAllNamed(AppRoutes.LOGIN);
        Get.snackbar(
            "Terjadi Kesalahan", "Maaf, terdapat kesalahan di server..");
        break;
      default:
        // this.otherError(response.statusCode);
        (StorageProvider.getIdRole() != null)
            ? Get.back()
            : Get.offAllNamed(AppRoutes.LOGIN);
        ;
        Get.snackbar("Terjadi Kesalahan", "Periksa kembali koneksi Anda..");
    }
  }

  void _saveToken(String token) {
    StorageProvider.write('token', token);
  }

  Map<String, String> _headers = {
    HttpHeaders.authorizationHeader: 'Bearer ' + StorageProvider.getToken(),
    // HttpHeaders.contentTypeHeader: 'application/json'
  };

  otherError(err) {
    (StorageProvider.getIdRole() != null)
        ? Get.back()
        : Get.offAllNamed(AppRoutes.LOGIN);
    Get.snackbar("Terjadi Kesalahan", "Mohon periksa kembali koneksi Anda..");
    // if (err) throw Exception(err);
  }
}
