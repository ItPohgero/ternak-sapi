import 'dart:convert';

import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/data/model/semen.dart';
import 'package:pemantauan_ternak/app/data/services/list_semen_service.dart';

class ListSemenController extends GetxController {
  final items = <Semen>[].obs;
  final isLoading = true.obs;
  final idSapi = 0.obs;
  final tag = "".obs;

  @override
  void onInit() {
    this.idSapi.value = int.tryParse(Get.parameters['id']);
    this.tag.value = Get.parameters['tag'];

    this.getSemen();

    super.onInit();
  }

  getSemen() async {
    ListSemenService service = ListSemenService();
    await service.getAll().then((res) {
      this.items.value = [];

      if (res['data'].length > 0)
        for (var item in res['data']) this.items.add(Semen.fromJson(item));
    });

    this.isLoading.value = false;
    update();
  }
}
