import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/data/model/sapi.dart';
import 'package:pemantauan_ternak/app/data/services/list_sapi_service.dart';

class ListSapiController extends GetxController {
  final items = [].obs;
  final isLoading = true.obs;
  final page = 1.obs;
  final alloaded = false.obs;

  int idKandang;
  String kandang;

  @override
  void onInit() {
    this.idKandang = int.tryParse(Get.parameters['id_kandang']);
    this.kandang = Get.parameters['nama'];

    this.getSapi();
    super.onInit();
  }

  getSapi() async {
    if (this.alloaded.value) {
      return;
    } else {
      this.isLoading.value = true;

      ListSapiService service = ListSapiService();
      await service.getAll(this.idKandang, this.page.value).then((res) {
        var data = res['data']['data'];
        // print(res['data']);

        this.page.value += 1;

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
}
