import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/modules/list_sapi/local_widgets/list_sapi_item.dart';
// import 'package:pemantauan_ternak/app/modules/pencarian/local_widgets/list_sapi_item.dart';
import 'package:pemantauan_ternak/app/modules/pencarian/pencarian_controller.dart';

class PencarianPage extends StatefulWidget {
  @override
  _PencarianPageState createState() => _PencarianPageState();
}

class _PencarianPageState extends State<PencarianPage>
    with SingleTickerProviderStateMixin {
  PencarianController _ = Get.find();
  ScrollController _scrollController = ScrollController();

  static final GlobalKey<ScaffoldState> scaffholdKey =
      GlobalKey<ScaffoldState>();

  Timer searchOnStoppedTyping;
  TextEditingController _searchQuery;

  @override
  void initState() {
    _searchQuery = TextEditingController();

    print(_.pencarian.value.length);
    super.initState();
  }

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    _.startSearch();
  }

  void _stopSearching() {
    _clearSearchQuery();

    _.stopSearch();
  }

  void _clearSearchQuery() {
    setState(() {
      _.pencarian.value = "";
      _searchQuery.clear();
      _.clearItems();
    });
  }

  Widget _buildTitle(BuildContext context) {
    var horizontalTitleAlignment = CrossAxisAlignment.start;
    // Platform.isAndroid ? CrossAxisAlignment.center : CrossAxisAlignment.start;

    return InkWell(
      onTap: () => scaffholdKey.currentState.openDrawer(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: horizontalTitleAlignment,
          children: <Widget>[Text("Search Box")],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQuery,
      autofocus: true,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          // contentPadding: EdgeInsets.all(0),
          hintText: "Cari Sapi di sini..",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          hintStyle: TextStyle(color: Colors.black),
          fillColor: Colors.white,
          filled: true,
          suffixIcon: Visibility(
              visible: !_searchQuery.text.isEmpty,
              child: IconButton(
                  icon: Icon(Icons.clear),
                  color: Colors.black,
                  onPressed: () {
                    if (_searchQuery == null ||
                        _searchQuery.text.isEmpty ||
                        _searchQuery.text.length == 0) {
                      _clearSearchQuery();
                      return;
                    }

                    _clearSearchQuery();
                  }))),
      onChanged: updateSearchQuery,
      onEditingComplete: () => print("complete"),
    );
  }

  void updateSearchQuery(String newQuery) {
    const duration = Duration(milliseconds: 800);

    if (searchOnStoppedTyping != null) {
      setState(() {
        searchOnStoppedTyping.cancel();
      });
    }

    setState(() {
      searchOnStoppedTyping = new Timer(duration, () {
        if (newQuery.length > 0) {
          _.pencarian.value = newQuery;
          _startSearch();
        } else {
          _.clearItems();
        }
      });
    });

    // print("Search Query = $searchQuery");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: _.isLoading.value ? BackButton() : null,
          title: _buildSearchField(),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => Obx(() => (_.items.isNotEmpty)
                  ? Stack(
                      children: <Widget>[
                        ListView.separated(
                            controller: _scrollController,
                            itemBuilder: (context, index) =>
                                (index < _.items.length)
                                    ? ListSapiItem(
                                        item: _.items[index],
                                        onChanged: () {
                                          _.page.value += 1;
                                          _.startSearch();
                                        })
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
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ))
                        ]
                      ],
                    )
                  : Container(
                      child: Center(
                        child: Text(
                          (_.pencarian.value.length > 0 ||
                                  _.pencarian.isNotEmpty ||
                                  _.pencarian.value != "")
                              ? "Maaf, pencarian tidak ditemukan.."
                              : "Masukan Nomor Tag atau Nama Sapi untuk melakukan pencarian..",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
              // (controller.isLoading.value)
              //     ? Center(
              //         child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: <Widget>[
              //           CircularProgressIndicator(),
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Text("Dalam pencarian..")
              //         ],
              //       ))
              //     : (_.items.length > 0)
              //         ? ListSapiItem(items: controller.items)
              //         : Center(
              //             child: Padding(
              //               padding: EdgeInsets.all(20),
              //               child: Text(
              //                 (_.pencarian.value.length > 0 ||
              //                         _.pencarian.isNotEmpty ||
              //                         _.pencarian.value != "")
              //                     ? "Maaf, pencarian tidak ditemukan.."
              //                     : "Masukan Nomor Tag atau Nama Sapi untuk melakukan pencarian..",
              //                 textAlign: TextAlign.center,
              //               ),
              //             ),
              //           ),
              ),
        ));
  }
}
