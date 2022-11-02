import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class RekapController extends GetxController {
  final isLoading = true.obs;

  openExcel(String url) async => await launch(url).then((res) {
        this.isLoading.value = false;
        update();
      }).catchError((err) {
        this.isLoading.value = false;
        print(err);
      });
}
