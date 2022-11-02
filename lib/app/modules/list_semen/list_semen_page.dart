import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/modules/list_semen/list_semen_controller.dart';

class ListSemenPage extends StatefulWidget {
  @override
  _ListSemenPageState createState() => _ListSemenPageState();
}

class _ListSemenPageState extends State<ListSemenPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListSemenController>(
      builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text("Pilih Semen"),
            leading: IconButton(
                icon: Icon(Icons.clear), onPressed: () => Get.back()),
          ),
          body: Obx(() => (_.items.length > 0)
              ? ListView.builder(
                  itemCount: _.items.length,
                  itemBuilder: (BuildContext context, int index) => ListTile(
                        title: Text(_.items[index].nama),
                        leading: Text(_.items[index].kode),
                        onTap: () async {
                          Get.defaultDialog(
                              title: "Konfirmasi Input IB",
                              middleText:
                                  "Sapi dengan Tag ${_.tag} akan disuntik IB dengan Semen ${_.items[index].kode + "-" + _.items[index].nama}.\n\nSudah yakin benar ?",
                              radius: 10,
                              textCancel: "Batal",
                              textConfirm: "OK",
                              onConfirm: () {
                                Get.back();
                                Get.back(result: _.items[index].id);
                              });
                        },
                      ))
              : Center(
                  child: Text("Belum ada Data Semen.."),
                ))),
    );
  }
}
