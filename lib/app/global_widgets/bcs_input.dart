import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/modules/sapi/sapi_controller.dart';

Widget bcsInput({@required SapiController controller}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      IconButton(
          icon: Icon(Icons.remove),
          onPressed: () =>
              (controller.bcs.value > 2) ? controller.bcs.value -= 0.25 : ''),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Body Condition Score (BCS)",
            style: TextStyle(fontSize: 12),
          ),
          Obx(() => Text(
                controller.bcs.value.toString(),
                style: TextStyle(fontSize: 24),
              )),
        ],
      ),
      IconButton(
          icon: Icon(Icons.add),
          onPressed: () =>
              (controller.bcs.value < 5) ? controller.bcs.value += 0.25 : '')
    ],
  );
}
