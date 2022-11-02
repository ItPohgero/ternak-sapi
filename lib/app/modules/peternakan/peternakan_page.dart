import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/core/values/colors.dart';
import 'package:pemantauan_ternak/app/data/model/peternakan.dart';
import 'package:pemantauan_ternak/app/modules/peternakan/peternakan_controller.dart';
import 'package:pemantauan_ternak/app/routes/app_routes.dart';

class PeternakanPage extends StatelessWidget {
  const PeternakanPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GetBuilder<PeternakanController>(
      builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text("Pilih Farm"),
          ),
          body: SafeArea(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Obx(
                    () => (_.isLoading.value)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: _.peternakan.length,
                            itemBuilder: (context, i) => Obx(() =>
                                CardPeternakan(
                                    size: size, peternakan: _.peternakan[i]))),
                  ))),
          backgroundColor: ColorsPallete.LIGHT),
    );
  }

  CardPeternakan({@required Size size, @required Peternakan peternakan}) {
    return Card(
      child: InkWell(
        onTap: () => (peternakan.jumlah_kandang > 0)
            ? Get.toNamed(AppRoutes.LIST_KANDANG +
                "/?id_peternakan=${peternakan.id}&nama=${peternakan.nama}")
            : '',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: size.width,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(peternakan.gambar),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4))),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    peternakan.nama.toUpperCase(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("${peternakan.jumlah_kandang} Kandang"),
                  Text(
                      "${peternakan.sapi_jantan} Sapi Jantan & ${peternakan.sapi_betina} Sapi Betina")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
