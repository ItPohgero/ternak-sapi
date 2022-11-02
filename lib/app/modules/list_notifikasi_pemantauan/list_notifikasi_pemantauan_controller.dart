import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/data/model/sapi.dart';
import 'package:pemantauan_ternak/app/data/services/list_notifikasi_pemantauan_service.dart';
import 'package:pemantauan_ternak/app/routes/app_routes.dart';

class ListNotifikasiPemantauanController extends GetxController {
  final isLoading = true.obs;
  final listNotifikasi = <Sapi>[].obs;
  String title = "Pemantauan Hari Ini";
  String status;

  @override
  void onInit() {
    this.status = Get.parameters['nama'];
    this.title = "Pemantauan Status " + this.status;
    this.getAll(int.tryParse(Get.parameters['id_status']));

    super.onInit();
  }

  getAll(int idStatus) async {
    ListNotifikasiPemantauanService service = ListNotifikasiPemantauanService();

    await service.getAll(idStatus).then((res) {
      this.listNotifikasi.value = [];

      if (res.containsKey('data')) {
        if (res['data'] is! String) {
          // print(res['data']);
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
