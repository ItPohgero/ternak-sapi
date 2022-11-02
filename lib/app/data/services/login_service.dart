import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/core/utils/api_helper.dart';
import 'package:pemantauan_ternak/app/core/utils/storage_provider.dart';
import 'package:pemantauan_ternak/app/core/values/urls.dart';
import 'package:pemantauan_ternak/app/data/services/fcm_service.dart';
import 'package:pemantauan_ternak/app/routes/app_routes.dart';

class LoginService {
  Future<bool> login(String email, String password) async {
    bool status;

    ApiHelper api = ApiHelper();
    var response = await api.post(Uri.http(Urls.BASE_URL, Urls.LOGIN),
        {"email": email, "password": password});

    print("RESPONSE");
    print(response);

    if (response == [] || response == null) Get.offAllNamed(AppRoutes.LOGIN);

    switch (response['status']) {
      case 'login_gagal':
        Get.snackbar("Login Gagal", "Periksa kembali email / password Anda..");
        break;
      case 'ok':
        int idRole = response['data']['id_role'];

        StorageProvider.write('nama', response['data']['nama']);
        StorageProvider.write('id_role', idRole);
        StorageProvider.write('id_role_akun', response['data']['id_role_akun']);

        FCMService service = FCMService();

        if (StorageProvider.isManajerTernak(idRole))
          service.subscribeManajerTernak();

        if (StorageProvider.isPetugas(idRole)) service.subscribePetugas();

        status = true;
        break;
      case 'admin':
        status = false;
        Get.snackbar("Login Gagal", "Maaf, Anda tidak mempunyai akses..");
        break;
      default:
        status = false;
        Get.snackbar("Login Gagal", "Terjadi kesalahan..");
        break;
    }

    return status;
  }
}
