import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/modules/list_sapi/list_sapi_controller.dart';
import 'package:pemantauan_ternak/app/modules/list_sapi/local_widgets/list_sapi_item.dart';
import 'package:pemantauan_ternak/app/routes/app_routes.dart';

class ListSapiPage extends StatefulWidget {
  @override
  _ListSapiPageState createState() => _ListSapiPageState();
}

class _ListSapiPageState extends State<ListSapiPage> {
  final ScrollController _scrollController = ScrollController();

  ListSapiController _ = Get.find();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !_.isLoading.value) {
        _.getSapi();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sapi di Kandang ${_.kandang}"),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.PENCARIAN),
                child: Icon(Icons.search),
              ),
            )
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Obx(() => (_.items.isNotEmpty)
                ? Stack(
                    children: <Widget>[
                      ListView.separated(
                          controller: _scrollController,
                          itemBuilder: (context, index) =>
                              (index < _.items.length)
                                  ? ListSapiItem(
                                      item: _.items[index],
                                      onChanged: () => _.getSapi())
                                  : Container(
                                      width: constraints.maxWidth,
                                      height: 50,
                                      child: Center(
                                        child: Text(
                                            "Sudah tidak ada data sapi untuk ditampilkan.."),
                                      ),
                                    ),
                          separatorBuilder: (context, index) => Divider(
                                height: 1,
                              ),
                          itemCount:
                              _.items.length + (_.alloaded.value ? 1 : 0)),
                      if (_.isLoading.value) ...[
                        Positioned(
                            left: 0,
                            bottom: 0,
                            child: Container(
                              width: constraints.maxWidth,
                              height: 80,
                              child: Center(child: CircularProgressIndicator()),
                            ))
                      ]
                    ],
                  )
                : Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ));
          },
        ));
  }
}
