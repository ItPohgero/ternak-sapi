import 'package:flutter/material.dart';
import 'package:pemantauan_ternak/app/core/utils/api_helper.dart';
import 'package:pemantauan_ternak/app/core/values/strings.dart';
import 'package:pemantauan_ternak/app/core/values/urls.dart';

class SapiService {
  Future<Map<String, dynamic>> getOne(int idSapi) async {
    ApiHelper api = ApiHelper();

    var response =
        await api.get(Uri.http(Strings.BASE_URL, Urls.LIST_SAPI + "/$idSapi"));

    return response;
  }

  Future<String> create(
      {@required idSapi, @required idSemen, @required idPetugas}) async {
    ApiHelper api = ApiHelper();

    // print(idSapi.toString());
    // print(idSemen.toString());
    // print(idPetugas.toString());

    var input = {
      "id_sapi": idSapi.toString(),
      "id_semen": idSemen.toString(),
      "id_petugas": idPetugas.toString()
    };

    var response =
        await api.post(Uri.http(Strings.BASE_URL, Urls.PEMANTAUAN), input);

    // print("Response = ");
    // print(response);
    return response['status'];

    // return "ok";
  }

  Future<String> cekBirahi1(
      {@required int idSapi, @required int hasil, @required idPetugas}) async {
    ApiHelper api = ApiHelper();

    var response =
        await api.post(Uri.http(Strings.BASE_URL, Urls.CEK_BIRAHI1), {
      "id_sapi": idSapi.toString(),
      "hasil": hasil.toString(),
      "id_petugas": idPetugas.toString()
    });

    return response['status'];
  }

  Future<String> cekBirahi2(
      {@required int idSapi,
      @required int hasil,
      @required int hasilUsg,
      @required idPetugas}) async {
    ApiHelper api = ApiHelper();

    var response =
        await api.post(Uri.http(Strings.BASE_URL, Urls.CEK_BIRAHI2), {
      "id_sapi": idSapi.toString(),
      "hasil": hasil.toString(),
      "hasil_usg": hasilUsg.toString(),
      "id_petugas": idPetugas.toString()
    });

    return response['status'];
  }

  Future<String> pkb1(
      {@required int idSapi,
      @required String hasil,
      @required idPetugas}) async {
    ApiHelper api = ApiHelper();

    var response = await api.post(Uri.http(Strings.BASE_URL, Urls.PKB1), {
      "id_sapi": idSapi.toString(),
      "hasil": hasil,
      "id_petugas": idPetugas.toString()
    });

    return response['status'];
  }

  Future<String> pkb2(
      {@required int idSapi,
      @required String hasil,
      @required String hasilInduk,
      @required String posisiFetus,
      @required double bcs,
      @required idPetugas}) async {
    ApiHelper api = ApiHelper();

    var response = await api.post(Uri.http(Strings.BASE_URL, Urls.PKB2), {
      "id_sapi": idSapi.toString(),
      "hasil": hasil,
      "hasil_induk": hasilInduk,
      "posisi_fetus": posisiFetus,
      "bcs": bcs.toString(),
      "id_petugas": idPetugas.toString()
    });

    return response['status'];
  }

  Future<String> pkb3(
      {@required int idSapi,
      @required String hasilInduk,
      @required String posisiFetus,
      @required double bcs,
      @required String prediksiKelahiran,
      @required idPetugas}) async {
    ApiHelper api = ApiHelper();

    var response = await api.post(Uri.http(Strings.BASE_URL, Urls.PKB3), {
      "id_sapi": idSapi.toString(),
      "hasil_induk": hasilInduk,
      "posisi_fetus": posisiFetus,
      "bcs": bcs.toString(),
      "prediksi_kelahiran": prediksiKelahiran,
      "id_petugas": idPetugas.toString()
    });

    return response['status'];
  }

  Future<String> kelahiran(
      {@required int idSapi,
      @required String proses,
      @required String hasil,
      @required double bcs,
      @required String jenisKelamin,
      @required double beratLahir,
      @required int supportivePartus,
      @required idPetugas}) async {
    ApiHelper api = ApiHelper();

    var response = await api.post(Uri.http(Strings.BASE_URL, Urls.KELAHIRAN), {
      "id_sapi": idSapi.toString(),
      "proses": proses,
      "hasil": hasil,
      "bcs": bcs.toString(),
      "jenis_kelamin": jenisKelamin,
      "berat_lahir": beratLahir.toString(),
      "supportive_partus": supportivePartus.toString(),
      "id_petugas": idPetugas.toString()
    });

    return response['status'];
  }

  Future<String> postPartus(
      {@required int idSapi,
      @required String metriChecking,
      @required idPetugas}) async {
    ApiHelper api = ApiHelper();

    var response =
        await api.post(Uri.http(Strings.BASE_URL, Urls.POST_PARTUS), {
      "id_sapi": idSapi.toString(),
      "metri_checking": metriChecking,
      "id_petugas": idPetugas.toString()
    });

    return response['status'];
  }

  Future<String> ibUlang(
      {@required int idSapi,
      @required int idSemen,
      @required int idPetugas}) async {
    ApiHelper api = ApiHelper();

    var response = await api.post(Uri.http(Strings.BASE_URL, Urls.IB_ULANG), {
      "id_sapi": idSapi.toString(),
      "id_semen": idSemen.toString(),
      "id_petugas": idPetugas.toString()
    });

    return response['status'];
  }
}
