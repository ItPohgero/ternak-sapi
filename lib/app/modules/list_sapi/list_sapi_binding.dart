import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/modules/list_sapi/list_sapi_controller.dart';

class ListSapiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListSapiController());
  }
}
