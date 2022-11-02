class Kandang {
  final int id;
  final String kode;
  final String nama;
  final int kapasitas;
  final int sapi_jantan;
  final int sapi_betina;

  Kandang(
      {this.id,
      this.kode,
      this.nama,
      this.kapasitas,
      this.sapi_jantan,
      this.sapi_betina});

  factory Kandang.fromJson(Map<String, dynamic> map) {
    return Kandang(
        id: map['id'],
        kode: map['kode'],
        nama: map['nama'],
        kapasitas: map['kapasitas'],
        sapi_jantan: map['sapi_jantan'],
        sapi_betina: map['sapi_betina']);
  }
}
