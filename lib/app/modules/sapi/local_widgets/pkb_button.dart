import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/core/utils/message_provider.dart';
import 'package:pemantauan_ternak/app/core/utils/storage_provider.dart';
import 'package:pemantauan_ternak/app/core/values/status_pemantauan.dart';
import 'package:pemantauan_ternak/app/data/model/sapi.dart';
import 'package:pemantauan_ternak/app/data/services/sapi_service.dart';
import 'package:pemantauan_ternak/app/global_widgets/bcs_input.dart';
import 'package:pemantauan_ternak/app/global_widgets/shape_button.dart';
import 'package:pemantauan_ternak/app/modules/sapi/sapi_controller.dart';

Widget pkb1Button(
    {@required BuildContext context,
    @required Sapi sapi,
    @required SapiController controller}) {
  var hasil;

  return ShapeButton(
      label: "Input PKB 1",
      action: () async {
        bool result = await Get.defaultDialog(
            title: "Input PKB 1",
            content: DropdownButtonFormField(
                items: [
                  DropdownMenuItem(
                    child: Text("Positif"),
                    value: 'positif',
                  ),
                  DropdownMenuItem(
                    child: Text("Negatif"),
                    value: 'negatif',
                  ),
                  DropdownMenuItem(
                    child: Text("Dubius"),
                    value: 'dubius',
                  )
                ],
                value: null,
                onChanged: (val) => hasil = val,
                decoration: InputDecoration(
                    labelText: "Pilih Hasil", border: OutlineInputBorder()),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Hasil PKB 1 harus dipilih..";
                  } else {
                    return null;
                  }
                }),
            textCancel: "Batal",
            textConfirm: "Pilih",
            onConfirm: () => Get.back(result: true));

        if (!result.isBlank && result == true) {
          if (hasil != null) {
            SapiService service = SapiService();

            await service
                .pkb1(
                    idSapi: sapi.id,
                    hasil: hasil,
                    idPetugas: StorageProvider.getIdRoleAkun())
                .then((res) {
              if (res == 'ok') {
                controller.isChanged.value = true;

                MessageProvider.showSnackbar(
                    context: context, message: "Berhasil menginput PKB 1");

                controller.getSapi();
              } else {
                MessageProvider.showSnackbar(
                    context: context,
                    message: "Terjadi kesalahan saat menginput PKB 1");
              }
            });
          }
        }
      },
      color: StatusPemantauan.COLORS[StatusPemantauan.PKB_1]);
}

Widget pkb2Button(
    {@required BuildContext context,
    @required Sapi sapi,
    @required SapiController controller}) {
  var hasil, hasilInduk, posisiFetus;

  return ShapeButton(
      label: "Input PKB 2",
      action: () async {
        bool result = await Get.defaultDialog(
            title: "Input PKB 2",
            content: Column(
              children: <Widget>[
                DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                        child: Text("Normal"),
                        value: 'normal',
                      ),
                      DropdownMenuItem(
                        child: Text("Abortus"),
                        value: 'abortus',
                      )
                    ],
                    value: null,
                    onChanged: (val) => hasil = val,
                    decoration: InputDecoration(
                        labelText: "Pilih Hasil", border: OutlineInputBorder()),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Hasil harus dipilih..";
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                        child: Text("Sehat"),
                        value: 'sehat',
                      ),
                      DropdownMenuItem(
                        child: Text("Tidak Sehat"),
                        value: 'tidak_sehat',
                      ),
                    ],
                    value: null,
                    onChanged: (val) => hasilInduk = val,
                    decoration: InputDecoration(
                        labelText: "Pilih Hasil Induk",
                        border: OutlineInputBorder()),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Hasil Induk harus dipilih..";
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                        child: Text("Normal"),
                        value: 'normal',
                      ),
                      DropdownMenuItem(
                        child: Text("Tidak Normal"),
                        value: 'tidak_normal',
                      ),
                    ],
                    value: null,
                    onChanged: (val) => posisiFetus = val,
                    decoration: InputDecoration(
                        labelText: "Pilih Posisi Fetus",
                        border: OutlineInputBorder()),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Posisi Fetus harus dipilih..";
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 15,
                ),
                bcsInput(controller: controller),
              ],
            ),
            textCancel: "Batal",
            textConfirm: "Pilih",
            onConfirm: () => Get.back(result: true));

        if (!result.isBlank && result == true) {
          if (hasil != null && hasilInduk != null && posisiFetus != null) {
            SapiService service = SapiService();

            await service
                .pkb2(
                    idSapi: sapi.id,
                    hasil: hasil,
                    hasilInduk: hasilInduk,
                    posisiFetus: posisiFetus,
                    bcs: controller.bcs.value,
                    idPetugas: StorageProvider.getIdRoleAkun())
                .then((res) {
              if (res == 'ok') {
                controller.isChanged.value = true;

                MessageProvider.showSnackbar(
                    context: context, message: "Berhasil menginput PKB 2");

                controller.getSapi();
              } else {
                MessageProvider.showSnackbar(
                    context: context,
                    message: "Terjadi kesalahan saat menginput PKB 2");
              }
            });
          }
        }
      },
      color: StatusPemantauan.COLORS[StatusPemantauan.PKB_2]);
}

Widget pkb3Button(
    {@required BuildContext context,
    @required Sapi sapi,
    @required SapiController controller}) {
  var hasilInduk, posisiFetus, prediksiKelahiran;

  return ShapeButton(
      label: "Input PKB 3",
      action: () async {
        bool result = await Get.defaultDialog(
            title: "Input PKB 3",
            content: Column(
              children: <Widget>[
                DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                        child: Text("Sehat"),
                        value: 'sehat',
                      ),
                      DropdownMenuItem(
                        child: Text("Tidak Sehat"),
                        value: 'tidak_sehat',
                      )
                    ],
                    value: null,
                    onChanged: (val) => hasilInduk = val,
                    decoration: InputDecoration(
                        labelText: "Pilih Hasil Induk",
                        border: OutlineInputBorder()),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Hasil Induk harus dipilih..";
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                        child: Text("Normal"),
                        value: 'normal',
                      ),
                      DropdownMenuItem(
                        child: Text("Tidak Normal"),
                        value: 'tidak_normal',
                      ),
                    ],
                    value: null,
                    onChanged: (val) => posisiFetus = val,
                    decoration: InputDecoration(
                        labelText: "Pilih Posisi Fetus",
                        border: OutlineInputBorder()),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Posisi Fetus harus dipilih..";
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 15,
                ),
                bcsInput(controller: controller),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                        child: Text("Normal"),
                        value: 'normal',
                      ),
                      DropdownMenuItem(
                        child: Text("Tidak Normal"),
                        value: 'tidak_normal',
                      ),
                    ],
                    value: null,
                    onChanged: (val) => prediksiKelahiran = val,
                    decoration: InputDecoration(
                        labelText: "Pilih Prediksi Kelahiran",
                        border: OutlineInputBorder()),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Prediksi Kelahiran harus dipilih..";
                      } else {
                        return null;
                      }
                    }),
              ],
            ),
            textCancel: "Batal",
            textConfirm: "Pilih",
            onConfirm: () => Get.back(result: true));

        if (!result.isBlank && result == true) {
          if (hasilInduk != null &&
              posisiFetus != null &&
              prediksiKelahiran != null) {
            SapiService service = SapiService();

            await service
                .pkb3(
                    idSapi: sapi.id,
                    hasilInduk: hasilInduk,
                    posisiFetus: posisiFetus,
                    bcs: controller.bcs.value,
                    prediksiKelahiran: prediksiKelahiran,
                    idPetugas: StorageProvider.getIdRoleAkun())
                .then((res) {
              if (res == 'ok') {
                controller.isChanged.value = true;

                MessageProvider.showSnackbar(
                    context: context, message: "Berhasil menginput PKB 3");

                controller.getSapi();
              } else {
                MessageProvider.showSnackbar(
                    context: context,
                    message: "Terjadi kesalahan saat menginput PKB 3");
              }
            });
          }
        }
      },
      color: StatusPemantauan.COLORS[StatusPemantauan.PKB_1]);
}
