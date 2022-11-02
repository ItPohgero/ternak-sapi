import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/data/model/peternakan.dart';
import 'package:pemantauan_ternak/app/data/services/peternakan_service.dart';

class PeternakanController extends GetxController {
  final peternakan = [].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    this.getPeternakan();

    super.onInit();
  }

  getPeternakan() async {
    PeternakanService ps = new PeternakanService();
    await ps.getAll().then((res) {
      this.peternakan.value = [];

      for (var item in res['data']) {
        // print(item);
        peternakan.add(Peternakan.fromJson(item));
      }

      // print(peternakan);
    });

    this.isLoading.value = false;
    update();
  }
}
