import 'package:get_storage/get_storage.dart';
import 'package:pemantauan_ternak/app/core/values/strings.dart';

class StorageProvider {
  static final _storage = GetStorage();

  static write(String key, dynamic value) => _storage.write(key, value);

  static read(String key) => _storage.read(key);

  static getToken() => _storage.read('token').toString();

  static getIdRole() => _storage.read('id_role');

  static getIdRoleAkun() => _storage.read('id_role_akun');

  static setNama(String nama) => _storage.write('nama', nama);

  static getNama() => _storage.read('nama');

  static setJadwal(String nama) => _storage.write('jadwal', nama);

  static getJadwal() => _storage.read('jadwal');

  static emptySession() => _storage.erase();

  static isPetugas(int idRole) => idRole == Strings.PETUGAS;

  static isManajerTernak(int idRole) => idRole == Strings.MANAJER_TERNAK;

  static isAdmin(int idRole) => idRole == Strings.ADMIN;
}
