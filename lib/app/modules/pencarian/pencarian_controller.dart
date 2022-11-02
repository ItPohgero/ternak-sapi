import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/data/model/sapi.dart';
import 'package:pemantauan_ternak/app/data/services/pencarian_service.dart';

class PencarianController extends GetxController {
  final items = <Sapi>[].obs;
  final isLoading = false.obs;
  final pencarian = "".obs;
  final page = 1.obs;
  final alloaded = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  startSearch() async {
    if (this.alloaded.value) {
      return;
    } else {
      this.isLoading.value = true;

      PencarianService service = PencarianService();
      await service.getAll(this.pencarian.value, this.page.value).then((res) {
        var data = res['data']['data'];
        // print(res['data']);

        if (this.page.value < 2) items.value = [];

        // this.page.value += 1;

        if (data.length > 0) {
          for (var item in data) {
            items.add(Sapi.fromJson(item));
          }
        } else {
          this.alloaded.value = true;
        }
      });

      this.isLoading.value = false;
      update();
    }
  }

  stopSearch() {
    this.isLoading.value = false;

    update();
  }

  clearItems() {
    this.items.value = [];
    this.page.value = 1;

    update();
  }
}
