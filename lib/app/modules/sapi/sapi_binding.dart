import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/modules/sapi/sapi_controller.dart';

class SapiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SapiController());
  }
}
