import 'package:get/route_manager.dart';
import 'package:pemantauan_ternak/app/modules/akun/akun_binding.dart';
import 'package:pemantauan_ternak/app/modules/akun/akun_page.dart';
import 'package:pemantauan_ternak/app/modules/home/home_binding.dart';
import 'package:pemantauan_ternak/app/modules/home/home_page.dart';
import 'package:pemantauan_ternak/app/modules/jadwal/jadwal_binding.dart';
import 'package:pemantauan_ternak/app/modules/jadwal/jadwal_page.dart';
import 'package:pemantauan_ternak/app/modules/list_kandang/list_kandang_binding.dart';
import 'package:pemantauan_ternak/app/modules/list_kandang/list_kandang_page.dart';
import 'package:pemantauan_ternak/app/modules/list_notifikasi_input/list_notifikasi_input_binding.dart';
import 'package:pemantauan_ternak/app/modules/list_notifikasi_input/list_notifikasi_input_page.dart';
import 'package:pemantauan_ternak/app/modules/list_notifikasi_pemantauan/list_notifikasi_pemantauan_binding.dart';
import 'package:pemantauan_ternak/app/modules/list_notifikasi_pemantauan/list_notifikasi_pemantauan_page.dart';
import 'package:pemantauan_ternak/app/modules/list_sapi/list_sapi_binding.dart';
import 'package:pemantauan_ternak/app/modules/list_sapi/list_sapi_page.dart';
import 'package:pemantauan_ternak/app/modules/list_semen/list_semen_binding.dart';
import 'package:pemantauan_ternak/app/modules/list_semen/list_semen_page.dart';
import 'package:pemantauan_ternak/app/modules/login/login_binding.dart';
import 'package:pemantauan_ternak/app/modules/login/login_page.dart';
import 'package:pemantauan_ternak/app/modules/notifikasi/notifikasi_binding.dart';
import 'package:pemantauan_ternak/app/modules/notifikasi/notifikasi_page.dart';
import 'package:pemantauan_ternak/app/modules/pencarian/pencarian_binding.dart';
import 'package:pemantauan_ternak/app/modules/pencarian/pencarian_page.dart';
import 'package:pemantauan_ternak/app/modules/peternakan/peternakan_binding.dart';
import 'package:pemantauan_ternak/app/modules/peternakan/peternakan_page.dart';
import 'package:pemantauan_ternak/app/modules/rekap/rekap_binding.dart';
import 'package:pemantauan_ternak/app/modules/rekap/rekap_page.dart';
import 'package:pemantauan_ternak/app/modules/sapi/sapi_binding.dart';
import 'package:pemantauan_ternak/app/modules/sapi/sapi_page.dart';
import 'package:pemantauan_ternak/app/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
        name: AppRoutes.PENCARIAN,
        page: () => PencarianPage(),
        binding: PencarianBinding()),
    GetPage(
        name: AppRoutes.AKUN, page: () => AkunPage(), binding: AkunBinding()),
    GetPage(
        name: AppRoutes.JADWAL,
        page: () => JadwalPage(),
        binding: JadwalBinding()),
    GetPage(
        name: AppRoutes.PETERNAKAN,
        page: () => PeternakanPage(),
        binding: PeternakanBinding()),
    GetPage(
        name: AppRoutes.LIST_KANDANG,
        page: () => ListKandangPage(),
        binding: ListKandangBinding()),
    GetPage(
        name: AppRoutes.LIST_SAPI,
        page: () => ListSapiPage(),
        binding: ListSapiBinding()),
    GetPage(
        name: AppRoutes.SAPI, page: () => SapiPage(), binding: SapiBinding()),
    GetPage(
        name: AppRoutes.LIST_SEMEN,
        page: () => ListSemenPage(),
        binding: ListSemenBinding()),
    GetPage(
        name: AppRoutes.NOTIFIKASI,
        page: () => NotifikasiPage(),
        binding: NotifikasiBinding()),
    GetPage(
        name: AppRoutes.REKAP,
        page: () => RekapPage(),
        binding: RekapBinding()),
    GetPage(
        name: AppRoutes.LIST_NOTIFIKASI_INPUT,
        page: () => ListNotifikasiInputPage(),
        binding: ListNotifikasiInputBinding()),
    GetPage(
        name: AppRoutes.LIST_NOTIFIKASI_PEMANTAUAN,
        page: () => ListNotifikasiPemantauanPage(),
        binding: ListNotifikasiPemantauanBinding())
  ];
}
