class Petugas {
  final String id;
  final String nama;
  final String peternakan;
  final String gambar;
  final String notifikasi;

  Petugas({this.id, this.nama, this.peternakan, this.gambar, this.notifikasi});

  factory Petugas.fromJson(Map<String, dynamic> map) {
    return Petugas(
        id: map['id'],
        nama: map['nama'],
        peternakan: map['peternakan'],
        gambar: map['gambar'],
        notifikasi: map['notifikasi']);
  }
}
