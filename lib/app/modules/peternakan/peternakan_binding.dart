import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/modules/peternakan/peternakan_controller.dart';

class PeternakanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PeternakanController(), fenix: true);
  }
}
