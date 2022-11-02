import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/modules/list_notifikasi_input/list_notifikasi_input_controller.dart';

class ListNotifikasiInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListNotifikasiInputController());
  }
}
