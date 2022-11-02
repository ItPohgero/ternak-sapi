import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/data/model/kandang.dart';
import 'package:pemantauan_ternak/app/data/services/list_kandang_service.dart';

class ListKandangController extends GetxController {
  final kandangs = <Kandang>[].obs;
  final isLoading = false.obs;
  int idPeternakan;
  String peternakan;

  @override
  void onInit() {
    super.onInit();

    this.idPeternakan = int.tryParse(Get.parameters['id_peternakan']);
    this.peternakan = Get.parameters['nama'];

    this.getKandang();
  }

  getKandang() async {
    this.isLoading.value = true;
    ListKandangService service = ListKandangService();

    await service.getAll(this.idPeternakan).then((res) {
      this.kandangs.value = [];

      for (var item in res['data']) {
        this.kandangs.add(Kandang.fromJson(item));
      }

      print(kandangs);
    });

    this.isLoading.value = false;
    update();
  }
}
