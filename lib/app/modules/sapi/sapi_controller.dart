import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/core/utils/storage_provider.dart';
import 'package:pemantauan_ternak/app/data/model/sapi.dart';
import 'package:pemantauan_ternak/app/data/services/sapi_service.dart';

class SapiController extends GetxController {
  final sapi = Sapi().obs;
  final isLoading = true.obs;
  final isChecked = false.obs;
  final bcs = 2.0.obs;
  final umur = "".obs;
  final isChanged = false.obs;
  int idSapi;

  @override
  void onInit() {
    this.idSapi = int.tryParse(Get.parameters['id_sapi']);

    this.getSapi();

    super.onInit();
  }

  getSapi() async {
    SapiService service = SapiService();

    await service.getOne(this.idSapi).then((res) {
      this.sapi.value = Sapi.fromJson(res['data']);

      final tglLahir = DateTime.parse(this.sapi.value.tanggal_lahir);
      final sekarang = DateTime.now();
      final selisihHari = sekarang.difference(tglLahir).inDays;
      final selisihBulan = (selisihHari / 30).toInt();
      final selisihTahun = (selisihBulan / 12).toInt();

      umur.value =
          (selisihTahun > 0) ? "$selisihTahun tahun" : "$selisihBulan bulan";
    });

    this.isLoading.value = false;

    update();
  }

  createPemantauan({@required int idSapi, @required int idSemen}) async {
    int idPetugas = int.tryParse(StorageProvider.read('id_role_akun'));

    SapiService service = SapiService();

    await service
        .create(idSapi: idSapi, idSemen: idSemen, idPetugas: idPetugas)
        .then((status) {
      print(status);
    });
  }

  back() {
    Get.back(result: this.isChanged.value);
  }
}
