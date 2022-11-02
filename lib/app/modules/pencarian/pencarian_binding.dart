import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/modules/pencarian/pencarian_controller.dart';

class PencarianBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PencarianController());
  }
}
