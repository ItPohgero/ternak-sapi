import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/core/values/status_pemantauan.dart';
import 'package:pemantauan_ternak/app/data/model/pemantauan.dart';
import 'package:pemantauan_ternak/app/routes/app_routes.dart';

PemantauanItem({@required Pemantauan item}) {
  return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                      backgroundColor: StatusPemantauan.COLORS[
                          item.status.replaceAll(' ', '_').toLowerCase()]),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.status,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        item.jumlah_sapi.toString() +
                            " sapi siap untuk " +
                            item.lanjut,
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  )
                ],
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       shape: BoxShape.circle, color: ColorsPallete.PRIMARY),
              //   child: Padding(
              //       padding: EdgeInsets.all(5),
              //       child: Center(
              //         child: Text(
              //           item.jumlah_sapi.toString(),
              //           style:
              //               TextStyle(fontSize: 12, color: ColorsPallete.LIGHT),
              //         ),
              //       )),
              // )
            ],
          ),
        ),
        onTap: () => Get.toNamed(AppRoutes.LIST_NOTIFIKASI_PEMANTAUAN +
            "/?id_status=${item.id_status_pemantauan}&nama=${item.status}"),
      ));
}
