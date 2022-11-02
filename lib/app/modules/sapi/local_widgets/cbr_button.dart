import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/core/utils/message_provider.dart';
import 'package:pemantauan_ternak/app/core/utils/storage_provider.dart';
import 'package:pemantauan_ternak/app/core/values/colors.dart';
import 'package:pemantauan_ternak/app/data/model/sapi.dart';
import 'package:pemantauan_ternak/app/data/services/sapi_service.dart';
import 'package:pemantauan_ternak/app/global_widgets/shape_button.dart';
import 'package:pemantauan_ternak/app/modules/sapi/sapi_controller.dart';

Widget cbr1Button(
    {@required BuildContext context,
    @required Sapi sapi,
    @required SapiController controller}) {
  var hasil;

  return ShapeButton(
      label: "Input CBR 1",
      action: () async {
        bool result = await Get.defaultDialog(
            title: "Input Cek Biarahi",
            content: DropdownButtonFormField(
                items: [
                  DropdownMenuItem(
                    child: Text("Birahi"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Tidak Birahi"),
                    value: 0,
                  )
                ],
                value: null,
                onChanged: (val) => hasil = val,
                decoration: InputDecoration(
                    labelText: "Pilih Hasil", border: OutlineInputBorder()),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Hasil Cek Birahi 1 harus dipilih..";
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
                .cekBirahi1(
                    idSapi: sapi.id,
                    hasil: hasil,
                    idPetugas: StorageProvider.getIdRoleAkun())
                .then((res) {
              if (res == 'ok') {
                controller.isChanged.value = true;

                MessageProvider.showSnackbar(
                    context: context, message: "Berhasil menginput CBR 1");

                controller.getSapi();
              } else {
                MessageProvider.showSnackbar(
                    context: context,
                    message: "Terjadi kesalahan saat menginput CBR 1");
              }
            });
          }
        }
      },
      color: ColorsPallete.WARNING);
}

Widget cbr2Button(
    {@required BuildContext context,
    @required Sapi sapi,
    @required SapiController controller}) {
  var hasil, hasil_usg;

  return ShapeButton(
      label: "Input CBR 2",
      action: () async {
        bool result = await Get.defaultDialog(
            title: "Input Cek Biarahi 2",
            content: Column(
              children: <Widget>[
                DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                        child: Text("Birahi"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Tidak Birahi"),
                        value: 0,
                      )
                    ],
                    value: null,
                    onChanged: (val) => hasil = val,
                    decoration: InputDecoration(
                        labelText: "Pilih Hasil", border: OutlineInputBorder()),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Hasil Cek Birahi 2 harus dipilih..";
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                        child: Text("Positif"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Negatif"),
                        value: 0,
                      ),
                    ],
                    value: null,
                    onChanged: (val) => hasil_usg = val,
                    decoration: InputDecoration(
                        labelText: "Pilih Hasil USG",
                        border: OutlineInputBorder()),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Hasil USG harus dipilih..";
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
          if (hasil != null && hasil_usg != null) {
            SapiService service = SapiService();

            await service
                .cekBirahi2(
                    idSapi: sapi.id,
                    hasil: hasil,
                    hasilUsg: hasil_usg,
                    idPetugas: StorageProvider.getIdRoleAkun())
                .then((res) {
              if (res == 'ok') {
                controller.isChanged.value = true;

                MessageProvider.showSnackbar(
                    context: context, message: "Berhasil menginput CBR 2");

                controller.getSapi();
              } else {
                MessageProvider.showSnackbar(
                    context: context,
                    message: "Terjadi kesalahan saat menginput CBR 2");
              }
            });
          }
        }
      },
      color: ColorsPallete.WARNING);
}
