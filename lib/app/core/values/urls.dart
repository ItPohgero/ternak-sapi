class Urls {
  static const BASE_URL = "117.121.204.12"; // "api.pemantauan.pro2pray.com"
  static const SUB = "api_pemantauan_ternak/api/"; // "v1/"
  static const REFRESH_TOKEN = SUB + "refresh";

  static const LOGIN = SUB + "login";
  static const AKUN = SUB + "akun";
  static const JADWAL = SUB + "jadwal";
  static const LIST_PETERNAKAN = SUB + "peternakan";
  static const LIST_SAPI = SUB + "sapi";
  static const LIST_SEMEN = SUB + "semen";
  static const LIST_KANDANG = SUB + "kandang/";

  static const PEMANTAUAN = SUB + "pemantauan";
  static const CEK_BIRAHI1 = PEMANTAUAN + "/cek_birahi1";
  static const CEK_BIRAHI2 = PEMANTAUAN + "/cek_birahi2";
  static const PKB1 = PEMANTAUAN + "/pkb1";
  static const PKB2 = PEMANTAUAN + "/pkb2";
  static const PKB3 = PEMANTAUAN + "/pkb3";
  static const KELAHIRAN = PEMANTAUAN + "/kelahiran";
  static const POST_PARTUS = PEMANTAUAN + "/post_partus";
  static const IB_ULANG = PEMANTAUAN + "/ib_ulang";
  static const PENNGOBATAN = PEMANTAUAN + "/pemantauan";

  static const NOTIFIKASI_INPUT = SUB + "notifikasi/";
  static const NOTIFIKASI_PEMANTAUAN = SUB + "notifikasi/pemantauan/";
  static const NOTIFIKASI_REMINDER = SUB + "notifikasi/reminder/";
}
