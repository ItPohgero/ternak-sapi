import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/core/utils/message_provider.dart';
import 'package:pemantauan_ternak/app/core/utils/storage_provider.dart';
import 'package:pemantauan_ternak/app/core/values/colors.dart';
import 'package:pemantauan_ternak/app/data/model/sapi.dart';
import 'package:pemantauan_ternak/app/data/services/sapi_service.dart';
import 'package:pemantauan_ternak/app/global_widgets/bcs_input.dart';
import 'package:pemantauan_ternak/app/global_widgets/shape_button.dart';
import 'package:pemantauan_ternak/app/modules/sapi/sapi_controller.dart';

Widget kelahiranButton(
    {@required BuildContext context,
    @required Sapi sapi,
    @required SapiController controller}) {
  var proses, hasil, supportivePartus, jenisKelamin, beratLahir;

  return ShapeButton(
      label: "Input Kelahiran",
      action: () async {
        bool result = await Get.defaultDialog(
            title: "Input Kelahiran",
            content: Column(
              children: <Widget>[
                DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                        child: Text("Normal"),
                        value: 'normal',
                      ),
                      DropdownMenuItem(
                        child: Text("Tidak Normal"),
                        value: 'tidak_normal',
                      )
                    ],
                    value: null,
                    onChanged: (val) => proses = val,
                    decoration: InputDecoration(
                        labelText: "Pilih Proses",
                        border: OutlineInputBorder()),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Proses harus dipilih..";
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
                        child: Text("Hidup"),
                        value: 'hidup',
                      ),
                      DropdownMenuItem(
                        child: Text("Mati"),
                        value: 'mati',
                      ),
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
                bcsInput(controller: controller),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: DropdownButtonFormField(
                          items: [
                            DropdownMenuItem(
                              child: Text("Jantan"),
                              value: 'jantan',
                            ),
                            DropdownMenuItem(
                              child: Text("Betina"),
                              value: 'betina',
                            ),
                          ],
                          value: null,
                          onChanged: (val) => jenisKelamin = val,
                          decoration: InputDecoration(
                              labelText: "Pilih Jenis Kelamin",
                              border: OutlineInputBorder()),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Jenis Kelamin harus dipilih..";
                            } else {
                              return null;
                            }
                          }),
                    ),
                    Flexible(
                      flex: 1,
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (val) => beratLahir = val,
                          maxLines: 1,
                          decoration: InputDecoration(
                              labelText: "Berat Lahir",
                              border: OutlineInputBorder()),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Berat lahir tidak boleh kosong..";
                            } else {
                              return null;
                            }
                          }),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Obx(() => Checkbox(
                        value: controller.isChecked.value,
                        onChanged: (val) {
                          supportivePartus = (val) ? 1 : 0;
                          controller.isChecked.value = val;
                        })),
                    Text("Supportive Partus ?")
                  ],
                )
              ],
            ),
            textCancel: "Batal",
            textConfirm: "Pilih",
            onConfirm: () => Get.back(result: true));

        if (!result.isBlank && result == true) {
          if (proses != null && hasil != null && beratLahir != null) {
            SapiService service = SapiService();

            print({
              'idSapi': sapi.id,
              'proses': proses,
              'hasil': hasil,
              'bcs': controller.bcs.value,
              'jenisKelamin': jenisKelamin,
              'beratLahir': double.tryParse(beratLahir),
              'supportivePartus': supportivePartus,
              'idPetugas': StorageProvider.getIdRoleAkun()
            });

            await service
                .kelahiran(
                    idSapi: sapi.id,
                    proses: proses,
                    hasil: hasil,
                    bcs: controller.bcs.value,
                    jenisKelamin: jenisKelamin,
                    beratLahir: double.tryParse(beratLahir),
                    supportivePartus: supportivePartus,
                    idPetugas: StorageProvider.getIdRoleAkun())
                .then((res) {
              if (res == 'ok') {
                controller.isChanged.value = true;

                MessageProvider.showSnackbar(
                    context: context, message: "Berhasil menginput Kelahiran");

                controller.getSapi();
              } else {
                MessageProvider.showSnackbar(
                    context: context,
                    message: "Terjadi kesalahan saat menginput Kelahiran");
              }
            });
          }
        }
      },
      color: ColorsPallete.PRIMARY);
}
