class Reminder {
  final String nama;

  Reminder({this.nama});

  factory Reminder.fromJson(Map<String, dynamic> map) {
    return Reminder(nama: map['nama'].toString());
  }
}
