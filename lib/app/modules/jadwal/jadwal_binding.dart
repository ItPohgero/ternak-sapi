import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/modules/jadwal/jadwal_conroller.dart';

class JadwalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JadwalController());
  }
}
