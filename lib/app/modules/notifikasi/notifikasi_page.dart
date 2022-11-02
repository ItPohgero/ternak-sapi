import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/data/model/pemantauan.dart';
import 'package:pemantauan_ternak/app/data/model/petugas.dart';
import 'package:pemantauan_ternak/app/data/model/reminder.dart';
import 'package:pemantauan_ternak/app/modules/notifikasi/local_widgets/pemantauan_item.dart';
import 'package:pemantauan_ternak/app/modules/notifikasi/local_widgets/petugas_item.dart';
import 'package:pemantauan_ternak/app/modules/notifikasi/local_widgets/reminder_item.dart';
import 'package:pemantauan_ternak/app/modules/notifikasi/notifikasi_controller.dart';

class NotifikasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotifikasiController>(
        builder: (_) => SafeArea(
            child: Obx(() => (_.isLoading.value)
                ? Scaffold(
                    appBar: AppBar(
                      title: Text("Notifikasi"),
                    ),
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : DefaultTabController(
                    length: _.segments.length,
                    child: Scaffold(
                        appBar: AppBar(
                          title: Text("Notifikasi"),
                          bottom:
                              TabBar(tabs: createTabbar(segments: _.segments)),
                        ),
                        body: TabBarView(children: <Widget>[
                          (_.listNotifikasiInput.length > 0)
                              ? createListNotifikasiInput(
                                  _.listNotifikasiInput.value)
                              : createEmptyMessage(
                                  "Belum ada input pemantauan untuk hari ini.."),
                          (_.listNotifikasiPemantauan.length > 0)
                              ? createListNotifikasiPemantauan(
                                  _.listNotifikasiPemantauan.value)
                              : createEmptyMessage(
                                  "Belum ada agenda pemantauan dalam waktu dekat.."),
                          (_.listNotifikasiReminder.length > 0)
                              ? createListNotifikasiReminder(
                                  _.listNotifikasiReminder.value)
                              : createEmptyMessage(
                                  "Belum ada jadwal tersedia.."),
                        ]))))));
  }

  createTabbar({@required segments}) {
    var tabs = <Widget>[];

    for (var i = 0; i < segments.length; i++) {
      tabs.add(Tab(text: segments[i]));
    }

    return tabs;
  }

  createEmptyMessage(String message) => Center(
        child: Text(
          message,
          style: TextStyle(fontSize: 16),
        ),
      );

  createListNotifikasiInput(List items) => ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        Petugas item = items[index];
        return PetugasItem(item: item);
      });

  createListNotifikasiPemantauan(List items) => ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        Pemantauan item = items[index];
        return PemantauanItem(item: item);
      });

  createListNotifikasiReminder(List items) => ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        Reminder item = items[index];
        return ReminderItem(item: item);
      });
}
