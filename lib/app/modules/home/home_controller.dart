import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/core/utils/storage_provider.dart';
import 'package:pemantauan_ternak/app/data/services/home_service.dart';
import 'package:pemantauan_ternak/app/routes/app_routes.dart';

class HomeController extends GetxController {
  String nama;
  String role;
  final gambar = "".obs;
  List menus;

  @override
  void onInit() {
    nama = StorageProvider.getNama();

    if (StorageProvider.isPetugas(StorageProvider.getIdRole())) {
      role = "Petugas";

      menus = [
        {
          'color': Colors.blue,
          'image': 'cow.png',
          'title': "Pantau Sapi",
          'page': AppRoutes.PETERNAKAN,
        },
        {
          'color': Colors.red,
          'image': 'search.png',
          'title': "Cari Sapi",
          'page': AppRoutes.PENCARIAN,
        },
        {
          'color': Colors.yellow,
          'image': 'calendar.png',
          'title': "Jadwal",
          'page': AppRoutes.JADWAL,
        },
        {
          'color': Colors.green,
          'image': 'profil.png',
          'title': "Akun",
          'page': AppRoutes.AKUN
        }
      ];
    } else {
      role = "Manajer Ternak";

      menus = [
        {
          'color': Colors.blue,
          'image': 'cow.png',
          'title': "Pantau Sapi",
          'page': AppRoutes.PETERNAKAN,
        },
        {
          'color': Colors.red,
          'image': 'notification.png',
          'title': "Notifikasi",
          'page': AppRoutes.NOTIFIKASI,
        },
        {
          'color': Colors.yellow,
          'image': 'report.png',
          'title': "Rekap",
          'page': AppRoutes.REKAP,
        },
        {
          'color': Colors.green,
          'image': 'profil.png',
          'title': "Akun",
          'page': AppRoutes.AKUN
        }
      ];
    }

    this.getProfil();

    super.onInit();
  }

  getProfil() async {
    HomeService service = HomeService();

    await service.getAkun().then((res) {
      this.gambar.value = res['data']['gambar'];
      print(this.gambar.value);
    });
  }
}
