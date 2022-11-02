class Jadwal {
  final String nama;
  final String hari;
  final String keterangan;
  final String peternakan;
  final String tanggal;

  Jadwal(
      {this.nama, this.hari, this.keterangan, this.peternakan, this.tanggal});

  factory Jadwal.fromJson(Map<String, dynamic> map) {
    return Jadwal(
        nama: map['nama'],
        hari: map['hari'],
        keterangan: map['keterangan'],
        peternakan: map['peternakan']);
  }
}
