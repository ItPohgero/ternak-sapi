import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/core/utils/app_icons.dart';
import 'package:pemantauan_ternak/app/core/values/status_pemantauan.dart';
import 'package:pemantauan_ternak/app/core/values/colors.dart';
import 'package:pemantauan_ternak/app/data/model/sapi.dart';
import 'package:pemantauan_ternak/app/routes/app_routes.dart';

class ListSapiItem extends StatelessWidget {
  List items;

  ListSapiItem({@required List items}) {
    this.items = items;
  }

  @override
  Widget build(BuildContext context) {
    return (this.items.length == 0 || this.items.isEmpty)
        ? Center(
            child: Text("Belum ada Data Sapi.."),
          )
        : ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              Sapi item = items[index];
              String status = item.status.toString();
              int id = item.id;
              var icon = (item.jenis_kelamin == "jantan")
                  ? CustomIcons.male
                  : CustomIcons.female;

              var tglLahir = DateTime.parse(item.tanggal_lahir),
                  sekarang = DateTime.now(),
                  selisihHari = sekarang.difference(tglLahir).inDays,
                  selisihBulan = (selisihHari ~/ 30).toInt(),
                  selisihTahun = (selisihBulan ~/ 12).toInt(),
                  umur = (selisihTahun > 0)
                      ? "$selisihTahun tahun"
                      : "$selisihBulan bulan";

              // print(status);

              return Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 1))),
                child: InkWell(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            Icon(
                              icon,
                              color: Colors.grey[850],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.tag,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  umur,
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: StatusPemantauan.COLORS[
                                  status.replaceAll(' ', '_').toLowerCase()],
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              (status.isNull) ? '' : status,
                              style: TextStyle(color: ColorsPallete.DARK),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () => Get.toNamed(
                    "${AppRoutes.SAPI}/?id_sapi=${id}",
                  ),
                ),
              );
            });
  }
}
