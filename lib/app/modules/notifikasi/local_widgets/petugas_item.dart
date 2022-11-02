import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/core/values/colors.dart';
import 'package:pemantauan_ternak/app/data/model/petugas.dart';
import 'package:pemantauan_ternak/app/routes/app_routes.dart';

PetugasItem({@required Petugas item}) {
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
                      child: Image(
                          image: NetworkImage(
                              'https://cdn4.iconfinder.com/data/icons/people-avatar-filled-outline/64/boy_people_avatar_man_male_hat_handsome-256.png'))),
                  // item.gambar
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.nama,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Peternakan " + item.peternakan,
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
              //           item.notifikasi.toString(),
              //           style:
              //               TextStyle(fontSize: 12, color: ColorsPallete.LIGHT),
              //         ),
              //       )),
              // )
            ],
          ),
        ),
        onTap: () => Get.toNamed(AppRoutes.LIST_NOTIFIKASI_INPUT +
            "/?id_petugas=${item.id}&nama=${item.nama}"),
      ));
}
