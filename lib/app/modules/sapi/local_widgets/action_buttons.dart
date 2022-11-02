import 'package:flutter/material.dart';
import 'package:pemantauan_ternak/app/core/values/status_pemantauan.dart';
import 'package:pemantauan_ternak/app/data/model/sapi.dart';
import 'package:pemantauan_ternak/app/modules/sapi/local_widgets/cbr_button.dart';
import 'package:pemantauan_ternak/app/modules/sapi/local_widgets/ib_button.dart';
import 'package:pemantauan_ternak/app/modules/sapi/local_widgets/kelahiran_button.dart';
import 'package:pemantauan_ternak/app/modules/sapi/local_widgets/pkb_button.dart';
import 'package:pemantauan_ternak/app/modules/sapi/local_widgets/post_partus_button.dart';
import 'package:pemantauan_ternak/app/modules/sapi/sapi_controller.dart';

Widget actionButtons(
    {@required BuildContext context,
    @required Sapi sapi,
    @required SapiController controller}) {
  Widget widget;
  var status = sapi.status.toString().toLowerCase().replaceAll(" ", "_");

  if (sapi.status != null) {
    if (sapi.sisa_hari < 4 && status == StatusPemantauan.IB) {
      widget = cbr1Button(context: context, sapi: sapi, controller: controller);
    } else if (sapi.sisa_hari < 1) {
      switch (status) {
        case StatusPemantauan.IB:
          widget =
              cbr1Button(context: context, sapi: sapi, controller: controller);
          break;
        case StatusPemantauan.CBR_1:
          widget =
              cbr2Button(context: context, sapi: sapi, controller: controller);
          break;
        case StatusPemantauan.CBR_2:
          widget =
              pkb1Button(context: context, sapi: sapi, controller: controller);
          break;
        case StatusPemantauan.PKB_1:
          widget =
              pkb2Button(context: context, sapi: sapi, controller: controller);
          break;
        case StatusPemantauan.PKB_2:
          widget =
              pkb3Button(context: context, sapi: sapi, controller: controller);
          break;
        case StatusPemantauan.PKB_3:
          widget = kelahiranButton(
              context: context, sapi: sapi, controller: controller);
          break;
        case StatusPemantauan.KELAHIRAN:
          widget = postPartusButton(
              context: context, sapi: sapi, controller: controller);
          break;
        case StatusPemantauan.POST_PARTUS:
          widget = SizedBox();
          break;
        case StatusPemantauan.PKB_ULANG:
          widget =
              pkb1Button(context: context, sapi: sapi, controller: controller);
          break;
        case StatusPemantauan.PENGOBATAN:
          widget =
              pkb2Button(context: context, sapi: sapi, controller: controller);
          break;
        case StatusPemantauan.IB_ULANG:
          widget = ibUlangButton(
              context: context, sapi: sapi, controller: controller);
          break;
      }
    } else {
      widget = SizedBox();
    }
  } else {
    widget = ibButton(context: context, sapi: sapi, controller: controller);
  }

  return widget;
}
