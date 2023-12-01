class Pray {
  final String time;
  final String name;
  Pray({required this.name, required this.time});

  factory Pray.fajrFromJson(Map<String, dynamic> data) =>
      Pray(name: 'الفجر', time: data['Fajr']! as String);
  factory Pray.shrouqFromJson(Map<String, dynamic> data) =>
      Pray(name: "الشروق", time: data['Sunrise']! as String);
  factory Pray.dhuhrFromJson(Map<String, dynamic> data) =>
      Pray(name: "الظهر", time: data['Dhuhr']! as String);
  factory Pray.asrFromJson(Map<String, dynamic> data) =>
      Pray(name: "العصر", time: data['Asr']! as String);
  factory Pray.maghribFromJson(Map<String, dynamic> data) =>
      Pray(name: "المغرب", time: data['Maghrib']! as String);
  factory Pray.ishaFromJson(Map<String, dynamic> data) =>
      Pray(name: "العشاء", time: data['Isha']! as String);
}
