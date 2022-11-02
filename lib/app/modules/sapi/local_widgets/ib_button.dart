import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/core/utils/message_provider.dart';
import 'package:pemantauan_ternak/app/core/utils/storage_provider.dart';
import 'package:pemantauan_ternak/app/core/values/colors.dart';
import 'package:pemantauan_ternak/app/core/values/status_pemantauan.dart';
import 'package:pemantauan_ternak/app/data/model/sapi.dart';
import 'package:pemantauan_ternak/app/data/services/sapi_service.dart';
import 'package:pemantauan_ternak/app/global_widgets/shape_button.dart';
import 'package:pemantauan_ternak/app/modules/sapi/sapi_controller.dart';
import 'package:pemantauan_ternak/app/routes/app_routes.dart';

Widget ibButton(
    {@required BuildContext context,
    @required Sapi sapi,
    @required SapiController controller}) {
  return ShapeButton(
      color: ColorsPallete.PRIMARY,
      label: "Input IB",
      action: () async {
        var result = await Get.toNamed(
            AppRoutes.LIST_SEMEN + "?id=${sapi.id}&tag=${sapi.tag}");

        // print(sapi.id.toString() +
        //     " " +
        //     result.toString() +
        //     " " +
        //     StorageProvider.getIdRoleAkun());

        if (result != null) {
          SapiService service = SapiService();

          await service
              .create(
                  idSapi: sapi.id,
                  idSemen: result,
                  idPetugas: StorageProvider.getIdRoleAkun())
              .then((res) {
            if (res == 'ok') {
              controller.isChanged.value = true;

              MessageProvider.showSnackbar(
                  context: context, message: "Berhasil menginput IB");
              controller.getSapi();
            } else {
              MessageProvider.showSnackbar(
                  context: context,
                  message: "Terjadi kesalahan saat menginput IB");
            }
          });
        }
      });
}

Widget ibUlangButton(
    {@required BuildContext context,
    @required Sapi sapi,
    @required SapiController controller}) {
  return ShapeButton(
      color: StatusPemantauan.COLORS[StatusPemantauan.IB_ULANG],
      label: "Input IB",
      action: () async {
        var result = await Get.toNamed(
            AppRoutes.LIST_SEMEN + "?id=${sapi.id}&tag=${sapi.tag}");

        if (result != null) {
          SapiService service = SapiService();

          await service
              .ibUlang(
                  idSapi: sapi.id,
                  idSemen: result,
                  idPetugas: StorageProvider.getIdRoleAkun())
              .then((res) {
            if (res == 'ok') {
              controller.isChanged.value = true;

              MessageProvider.showSnackbar(
                  context: context, message: "Berhasil menginput IB");
              controller.getSapi();
            } else {
              MessageProvider.showSnackbar(
                  context: context,
                  message: "Terjadi kesalahan saat menginput IB");
            }
          });
        }
      });
}
