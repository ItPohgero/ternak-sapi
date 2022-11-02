import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pemantauan_ternak/app/core/utils/storage_provider.dart';
import 'package:pemantauan_ternak/app/modules/sapi/local_widgets/action_buttons.dart';
import 'package:pemantauan_ternak/app/modules/sapi/sapi_controller.dart';

class SapiPage extends StatefulWidget {
  @override
  _SapiPageState createState() => _SapiPageState();
}

class _SapiPageState extends State<SapiPage> {
  var _tagController = TextEditingController();
  var _jkController = TextEditingController();
  var _namaController = TextEditingController();
  var _lahirController = TextEditingController();
  var _umurController = TextEditingController();
  var _statusController = TextEditingController();
  var _lokasiController = TextEditingController();

  var is_input = false;

  // @override
  // void initState() {

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetBuilder<SapiController>(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text("Detail Informasi Sapi"),
                leading: BackButton(
                  onPressed: () => _.back(),
                ),
              ),
              body: Obx(() {
                if (_.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  _tagController.text = _.sapi.value.tag;
                  _jkController.text = _.sapi.value.jenis_kelamin;
                  _namaController.text = _.sapi.value.nama;
                  _lahirController.text = _.sapi.value.tanggal_lahir;
                  _umurController.text = _.umur.value;
                  _lokasiController.text =
                      "Farm ${_.sapi.value.peternakan} - Kandang ${_.sapi.value.kandang}";

                  if (_.sapi.value.jenis_kelamin == "betina") {
                    String sisa_hari = (_.sapi.value.sisa_hari.isNull)
                        ? ''
                        : (_.sapi.value.sisa_hari <= 0)
                            ? (_.sapi.value.sisa_hari == 0)
                                ? " sudah selesai"
                                : " sudah selesai (${_.sapi.value.sisa_hari * -1} hari yang lalu)"
                            : " (selesai pada ${DateFormat('dd MMM yyyy').format(DateTime.now().add(Duration(days: _.sapi.value.sisa_hari)))})";

                    if (_.sapi.value.status != null) {
                      _statusController.text = _.sapi.value.status + sisa_hari;
                    } else {
                      _statusController.text = "Siap untuk IB";
                    }

                    if (_.sapi.value.is_input != null) {
                      is_input = _.sapi.value.is_input;

                      print("hakkk");
                      print(is_input);
                    }
                  }

                  return ListView(
                    children: [
                      (_.sapi.value.gambar.isNotEmpty)
                          ? Stack(
                              children: <Widget>[
                                Container(
                                  height: size.height / 3,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                                Container(
                                    height: size.height / 3,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                _.sapi.value.gambar),
                                            fit: BoxFit.fill)))
                              ],
                            )
                          : Container(
                              height: size.height / 3,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  flex: 10,
                                  child: TextField(
                                    controller: _tagController,
                                    readOnly: true,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        labelText: "Tag",
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                Flexible(flex: 1, child: SizedBox()),
                                Flexible(
                                  flex: 10,
                                  child: TextField(
                                    controller: _jkController,
                                    readOnly: true,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        labelText: "Kelamin",
                                        border: OutlineInputBorder()),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            (_namaController.text.isNotEmpty)
                                ? TextField(
                                    controller: _namaController,
                                    readOnly: true,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        labelText: "Nama Sapi",
                                        border: OutlineInputBorder()),
                                  )
                                : SizedBox(),
                            (_namaController.text.isNotEmpty)
                                ? SizedBox(
                                    height: 25,
                                  )
                                : SizedBox(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  flex: 10,
                                  child: TextField(
                                    controller: _lahirController,
                                    readOnly: true,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        labelText: "Taggal Lahir",
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                Flexible(flex: 1, child: SizedBox()),
                                Flexible(
                                  flex: 10,
                                  child: TextField(
                                    controller: _umurController,
                                    readOnly: true,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        labelText: "Umur",
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            TextField(
                              controller: _lokasiController,
                              readOnly: true,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  labelText: "Lokasi",
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            (_.sapi.value.jenis_kelamin == "betina")
                                ? TextField(
                                    controller: _statusController,
                                    readOnly: true,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        labelText: "Status",
                                        border: OutlineInputBorder()),
                                  )
                                : Text(""),
                            SizedBox(
                              height: 30,
                            ),
                            (_.sapi.value.jenis_kelamin == "betina" &&
                                    StorageProvider.isPetugas(
                                        StorageProvider.getIdRole()) &&
                                    is_input)
                                ? actionButtons(
                                    context: context,
                                    sapi: _.sapi.value,
                                    controller: _)
                                : SizedBox()
                          ],
                        ),
                      )
                    ],
                  );
                }
              }),
            ));
  }
}
