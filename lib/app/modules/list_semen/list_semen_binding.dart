import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:pemantauan_ternak/app/modules/list_semen/list_semen_controller.dart';

class ListSemenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListSemenController());
  }
}
