import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/data/services/login_service.dart';
import 'package:pemantauan_ternak/app/routes/app_routes.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;

  Future<void> login(String email, String password) async {
    this.isLoading.value = true;

    LoginService ls = LoginService();
    await ls.login(email, password).then((status) => (status == true)
        ? Get.offAllNamed(AppRoutes.HOME)
        : this.isLoading.value = false);
  }
}
