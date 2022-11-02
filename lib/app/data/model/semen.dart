class Semen {
  final int id;
  final String kode;
  final String nama;

  Semen({this.id, this.nama, this.kode});

  factory Semen.fromJson(Map<String, dynamic> map) {
    return Semen(id: map['id'], kode: map['kode'], nama: map['nama']);
  }
}
