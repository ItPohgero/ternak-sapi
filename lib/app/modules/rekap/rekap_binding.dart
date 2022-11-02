import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/modules/rekap/rekap_controller.dart';

class RekapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RekapController());
  }
}
