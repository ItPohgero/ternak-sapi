class Sapi {
  final int id;
  final String tag;
  final String nama;
  final String jenis_kelamin;
  final String tanggal_lahir;
  final String gambar;
  final String status;
  final String kandang;
  final String peternakan;
  final int sisa_hari;
  final String umur;
  final bool is_input;

  Sapi(
      {this.id,
      this.tag,
      this.nama,
      this.jenis_kelamin,
      this.tanggal_lahir,
      this.gambar,
      this.status,
      this.kandang,
      this.peternakan,
      this.sisa_hari,
      this.umur,
      this.is_input});

  factory Sapi.fromJson(Map<String, dynamic> map) {
    return Sapi(
        id: int.tryParse(map['id'].toString()),
        tag: map['tag'],
        nama: map['nama'],
        jenis_kelamin: map['jenis_kelamin'],
        tanggal_lahir: map['tanggal_lahir'],
        gambar: map['gambar'],
        status: map['status'],
        kandang: map['kandang'],
        peternakan: map['peternakan'],
        sisa_hari: int.tryParse(map['sisa_hari'].toString()),
        umur: map['umur'],
        is_input: map['is_input']);
  }
}
