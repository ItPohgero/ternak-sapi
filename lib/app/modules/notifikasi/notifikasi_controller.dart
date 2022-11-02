import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/data/model/pemantauan.dart';
import 'package:pemantauan_ternak/app/data/model/petugas.dart';
import 'package:pemantauan_ternak/app/data/model/reminder.dart';
import 'package:pemantauan_ternak/app/data/services/notifikasi_service.dart';
import 'package:pemantauan_ternak/app/routes/app_routes.dart';

class NotifikasiController extends GetxController {
  List items;
  final isLoading = true.obs;
  final segments = [].obs;
  final listNotifikasiInput = [].obs;
  final listNotifikasiPemantauan = [].obs;
  final listNotifikasiReminder = [].obs;

  @override
  void onInit() async {
    this.segments.value = [
      "Input Pemantauan",
      "Agenda Pemantauan",
      "Jadwal Hari Ini"
    ];
    await this.getAllNotifications();

    super.onInit();
  }

  getAllNotifications() async {
    await this.getNotifikasiInput();
    await this.getNotifikasiPemantauan();
    await this.getNotifikasiReminder();

    this.isLoading.value = false;
    update();
  }

  getNotifikasiInput() async {
    NotifikasiService service = NotifikasiService();

    await service.getAllNotifikasiInput().then((res) {
      this.listNotifikasiInput.value = [];

      // print(res);

      if (res.containsKey('data')) {
        if (res['data'] is! String) {
          var data = res['data'];

          if (data.length > 0) {
            for (var item in data)
              this.listNotifikasiInput.add(Petugas.fromJson(item));
          }
        }
      }
    });
  }

  getNotifikasiPemantauan() async {
    NotifikasiService service = NotifikasiService();

    await service.getAllNotifikasiPemantauan().then((res) {
      this.listNotifikasiPemantauan.value = [];

      // print(res);

      if (res.containsKey('data')) {
        if (res['data'] is! String) {
          var data = res['data'];

          if (data.length > 0) {
            for (var item in data)
              this.listNotifikasiPemantauan.add(Pemantauan.fromJson(item));
          }
        }
      }
    });
  }

  getNotifikasiReminder() async {
    NotifikasiService service = NotifikasiService();

    await service.getAllNotifikasiReminder().then((res) {
      this.listNotifikasiReminder.value = [];

      print(res);

      if (res.containsKey('data')) {
        if (res['data'] is! String) {
          var data = res['data'];

          if (data.length > 0) {
            for (var item in data)
              this.listNotifikasiReminder.add(Reminder.fromJson(item));
          }
        }
      }
    });
  }

  navigasiPetugas(String nama, int id) => Get.toNamed(
      AppRoutes.LIST_NOTIFIKASI_INPUT + "/?id_petugas=$id&nama=$nama");

  navigasiPemantauan(String nama, int id) => Get.toNamed(
      AppRoutes.LIST_NOTIFIKASI_PEMANTAUAN + "/?id_status=$id&nama=$nama");
}
