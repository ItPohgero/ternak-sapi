import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/core/utils/storage_provider.dart';
import 'package:pemantauan_ternak/app/data/model/akun.dart';
import 'package:pemantauan_ternak/app/data/services/akun_service.dart';
import 'package:pemantauan_ternak/app/routes/app_routes.dart';

class AkunController extends GetxController {
  static AkunController get to => Get.find();
  final isLoading = true.obs;
  final isEdit = false.obs;
  final akun = Akun().obs;
  final jenisKelamin = "".obs;

  @override
  void onInit() {
    this.getAkun();

    super.onInit();
  }

  getAkun() async {
    AkunService service = AkunService();

    await service.getOne().then((res) {
      this.akun.value = Akun.fromJson(res['data']);

      this.isLoading.value = false;
    });
    update();
  }

  updateAkun(String nama, int nohp, String alamat, String email) {
    this.isLoading.value = true;

    AkunService service = AkunService();

    return service.update(nama: nama, nohp: nohp, alamat: alamat, email: email);
  }

  logout() async {
    this.isLoading.value = true;
    await StorageProvider.emptySession();
    this.isLoading.value = false;

    Get.offAllNamed(AppRoutes.LOGIN);
  }
}
