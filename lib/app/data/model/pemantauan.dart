class Pemantauan {
  final String jumlah_sapi;
  final String id_status_pemantauan;
  final String status;
  final String lanjut;

  Pemantauan(
      {this.jumlah_sapi, this.id_status_pemantauan, this.status, this.lanjut});

  factory Pemantauan.fromJson(Map<String, dynamic> map) {
    return Pemantauan(
        jumlah_sapi: map['jumlah_sapi'],
        id_status_pemantauan: map['id_status_pemantauan'],
        status: map['status'],
        lanjut: map['lanjut']);
  }
}
