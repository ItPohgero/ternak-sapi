import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/modules/list_kandang/list_kandang_controller.dart';

class ListKandangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListKandangController());
  }
}
