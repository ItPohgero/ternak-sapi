class Peternakan {
  final int id;
  final String nama;
  final String gambar;
  final int jumlah_kandang;
  final int sapi_jantan;
  final int sapi_betina;

  Peternakan(
      {this.id,
      this.nama,
      this.gambar,
      this.jumlah_kandang,
      this.sapi_jantan,
      this.sapi_betina});

  factory Peternakan.fromJson(Map<String, dynamic> map) {
    return Peternakan(
        id: map['id'],
        nama: map['nama'],
        gambar: map['gambar'],
        jumlah_kandang: map['jumlah_kandang'],
        sapi_jantan: map['sapi_jantan'],
        sapi_betina: map['sapi_betina']);
  }
}
