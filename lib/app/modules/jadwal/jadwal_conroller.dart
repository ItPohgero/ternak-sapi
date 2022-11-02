import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pemantauan_ternak/app/data/model/jadwal.dart';
import 'package:pemantauan_ternak/app/data/services/jadwal_service.dart';

class JadwalController extends GetxController {
  final jadwal = <Jadwal>[].obs;
  final isLoading = true.obs;
  final events = [].obs;

  @override
  void onInit() async {
    await this.getJadwal();

    super.onInit();
  }

  getJadwal() async {
    JadwalService service = JadwalService();

    await service.getAll().then((res) {
      this.jadwal.value = [];

      if (res['data'].length > 0) {
        for (var item in res['data']) {
          print(item);

          jadwal.add(Jadwal.fromJson(item));
        }
      }
    });

    // var tanggal = DateTime.now();
    // print(tanggal.weekday);
    // var tanggal2 = tanggal.add(Duration(days: 1));
    // print(tanggal2);

    this.isLoading.value = false;

    update();
  }

  // List<Event> _getEventForDay(DateTime day) {
  //   return
  // }
}
