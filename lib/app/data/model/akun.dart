class Akun {
  final int id;
  final String nama;
  final String nohp;
  final String email;
  final bool aktif;
  final String nik;
  final String nip;
  final int id_role;
  final int id_role_akun;
  final String jenis_kelamin;
  final String alamat;
  final String gambar;

  Akun(
      {this.id,
      this.nama,
      this.nohp,
      this.email,
      this.aktif,
      this.nik,
      this.nip,
      this.id_role,
      this.id_role_akun,
      this.jenis_kelamin,
      this.alamat,
      this.gambar});

  factory Akun.fromJson(Map<String, dynamic> map) {
    return Akun(
      id: map['id'],
      nama: map['nama'],
      nohp: map['nohp'],
      email: map['email'],
      aktif: map['aktif'],
      nik: map['nik'],
      nip: map['nip'],
      id_role: map['id_role'],
      id_role_akun: map['id_role_alun'],
      jenis_kelamin: map['jenis_kelamin'],
      alamat: map['alamat'],
      gambar: map['gambar'],
    );
  }
}
