import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/core/utils/message_provider.dart';
import 'package:pemantauan_ternak/app/core/utils/storage_provider.dart';
import 'package:pemantauan_ternak/app/core/values/colors.dart';
import 'package:pemantauan_ternak/app/data/model/sapi.dart';
import 'package:pemantauan_ternak/app/data/services/sapi_service.dart';
import 'package:pemantauan_ternak/app/global_widgets/shape_button.dart';
import 'package:pemantauan_ternak/app/modules/sapi/sapi_controller.dart';

Widget postPartusButton(
    {@required BuildContext context,
    @required Sapi sapi,
    @required SapiController controller}) {
  var metriChecking;

  return ShapeButton(
      label: "Input Post Partus",
      action: () async {
        bool result = await Get.defaultDialog(
            title: "Input Post Partus",
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
                    onChanged: (val) => metriChecking = val,
                    decoration: InputDecoration(
                        labelText: "Pilih Metritis Checking",
                        border: OutlineInputBorder()),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Metri Checking harus dipilih..";
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
          if (metriChecking != null) {
            SapiService service = SapiService();

            await service
                .postPartus(
                    idSapi: sapi.id,
                    metriChecking: metriChecking,
                    idPetugas: StorageProvider.getIdRoleAkun())
                .then((res) {
              if (res == 'ok') {
                controller.isChanged.value = true;

                MessageProvider.showSnackbar(
                    context: context,
                    message: "Berhasil menginput Post Partus");

                controller.getSapi();
              } else {
                MessageProvider.showSnackbar(
                    context: context,
                    message: "Terjadi kesalahan saat menginput Post Partus");
              }
            });
          }
        }
      },
      color: ColorsPallete.TERTIARY);
}
