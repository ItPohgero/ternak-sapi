import 'package:flutter/material.dart';
import 'package:pemantauan_ternak/app/core/utils/api_helper.dart';
import 'package:pemantauan_ternak/app/core/values/strings.dart';
import 'package:pemantauan_ternak/app/core/values/urls.dart';

class AkunService {
  Future<Map<String, dynamic>> getOne() async {
    ApiHelper api = ApiHelper();

    var response = await api.get(Uri.http(
      Strings.BASE_URL,
      Urls.AKUN,
    ));

    return response;
  }

  Future<String> update(
      {@required String nama,
      @required int nohp,
      @required String alamat,
      @required String email}) async {
    ApiHelper api = ApiHelper();

    var response = await api.post(Uri.http(Strings.BASE_URL, Urls.AKUN), {
      "nama": nama,
      "nohp": nohp.toString(),
      "alamat": alamat,
      "email": email
    });

    return response['status'];
  }
}
