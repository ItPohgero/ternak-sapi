import 'package:get/get.dart';
import 'list_notifikasi_pemantauan_controller.dart';

class ListNotifikasiPemantauanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListNotifikasiPemantauanController());
  }
}
