import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/core/values/colors.dart';
import 'package:pemantauan_ternak/app/global_widgets/shape_button.dart';
import 'package:pemantauan_ternak/app/modules/rekap/rekap_controller.dart';

class RekapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String rekap = "ib";

    return GetBuilder<RekapController>(
        builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text("Rekap Data Sapi"),
            ),
            body: Padding(
              padding: EdgeInsets.all(16),
              child: ListView(
                children: <Widget>[
                  Align(
                    child: Image(
                      image: AssetImage("assets/images/report-2.png"),
                      width: 150,
                    ),
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                      items: [
                        DropdownMenuItem(value: "ib", child: Text("IB")),
                        DropdownMenuItem(
                            value: "cek1", child: Text("Cek Birahi 1")),
                        DropdownMenuItem(
                            value: "cek2", child: Text("Cek Birahi 2")),
                        DropdownMenuItem(value: "pkb1", child: Text("PKB 1")),
                        DropdownMenuItem(value: "pkb2", child: Text("PKB 2")),
                        DropdownMenuItem(value: "pkb3", child: Text("PKB 3")),
                        DropdownMenuItem(
                            value: "kelahiran", child: Text("Kelahiran")),
                        DropdownMenuItem(
                            value: "partus", child: Text("Post Partus")),
                      ],
                      value: "ib",
                      onChanged: (val) => rekap = val,
                      decoration: InputDecoration(
                          labelText: "Pilih Jenis Data",
                          border: OutlineInputBorder())),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      // TextFormField(
                      //   controller: TextEditingController(text: "aa"),
                      //   readOnly: true,
                      //   decoration: InputDecoration(
                      //       labelText: "Dari", border: OutlineInputBorder()),
                      //   onTap: () {
                      //     // showDatePicker(
                      //     //     context: context,
                      //     //     initialDate: DateTime.now(),
                      //     //     firstDate: DateTime(2020),
                      //     //     lastDate: DateTime(2025));
                      //   },
                      // ),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      // TextFormField(
                      //   readOnly: true,
                      //   decoration: InputDecoration(
                      //       labelText: "Sampai", border: OutlineInputBorder()),
                      //   onTap: () => showDatePicker(
                      //       context: context,
                      //       initialDate: DateTime.now(),
                      //       firstDate: DateTime(2020),
                      //       lastDate: DateTime(2025)),
                      // ),
                    ],
                  ),
                  ShapeButton(
                      label: "Ekspor ke Excel",
                      action: () => _.openExcel(
                          "http://117.121.204.12/bptu/export/$rekap"),
                      color: ColorsPallete.PRIMARY)
                ],
              ),
            )));
  }
}
