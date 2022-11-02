import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/modules/akun/akun_controller.dart';

class AkunBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AkunController());
  }
}
