import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/modules/notifikasi/notifikasi_controller.dart';

class NotifikasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotifikasiController());
  }
}
