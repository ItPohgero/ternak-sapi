import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/data/model/sapi.dart';
import 'package:pemantauan_ternak/app/data/services/list_notifikasi_input_service.dart';
import 'package:pemantauan_ternak/app/routes/app_routes.dart';

class ListNotifikasiInputController extends GetxController {
  final isLoading = true.obs;
  final listNotifikasi = <Sapi>[].obs;
  String title = "Input Pemantauan Hari Ini";
  String petugas;

  @override
  void onInit() {
    this.petugas = Get.parameters['nama'];
    this.title = "Inputan dari " + this.petugas;
    this.getAll(int.tryParse(Get.parameters['id_petugas']));

    super.onInit();
  }

  getAll(int idPetugas) async {
    ListNotifikasiInputService service = ListNotifikasiInputService();

    await service.getAll(idPetugas).then((res) {
      this.listNotifikasi.value = [];

      if (res.containsKey('data')) {
        if (res['data'] is! String) {
          print(res);
          for (var item in res['data']) {
            this.listNotifikasi.add(Sapi.fromJson(item));
          }
        }
      }
    });

    this.isLoading.value = false;

    update();
  }

  navigation(id) => Get.toNamed(
        "${AppRoutes.SAPI}/?id_sapi=$id",
      );
}
