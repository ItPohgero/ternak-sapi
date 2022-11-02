import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/modules/list_kandang/list_kandang_controller.dart';
import 'package:pemantauan_ternak/app/routes/app_routes.dart';

class ListKandangPage extends StatefulWidget {
  @override
  _ListKandangPageState createState() => _ListKandangPageState();
}

class _ListKandangPageState extends State<ListKandangPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListKandangController>(
      builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text("Farm ${_.peternakan}"),
          ),
          body: (_.isLoading.value)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: _.kandangs.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        onTap: () {
                          if (_.kandangs[index].sapi_betina > 0 ||
                              _.kandangs[index].sapi_jantan > 0) {
                            Get.toNamed(AppRoutes.LIST_SAPI +
                                "/?id_kandang=${_.kandangs[index].id.toString()}&nama=${_.kandangs[index].nama}");
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Kandang ${_.kandangs[index].nama}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 23),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "Kode : ${_.kandangs[index].kode} | Kapasitas Maksimal : ${_.kandangs[index].kapasitas}"),
                              Text(
                                  "${_.kandangs[index].sapi_jantan.toString()} Sapi Jantan dan ${_.kandangs[index].sapi_betina.toString()} Sapi Betina")
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
    );
  }
}
