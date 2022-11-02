import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/modules/splash/spash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
