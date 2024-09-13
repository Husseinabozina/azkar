class SurahTafseer {
  String? id;
  String? sura;
  String? aya;
  String? arabicText;
  String? translation;
  dynamic footnotes;

  SurahTafseer({
    this.id,
    this.sura,
    this.aya,
    this.arabicText,
    this.translation,
    this.footnotes,
  });

  factory SurahTafseer.fromJson(Map<String, dynamic> json) => SurahTafseer(
        id: json['id'] as String?,
        sura: json['sura'] as String?,
        aya: json['aya'] as String?,
        arabicText: json['arabic_text'] as String?,
        translation: json['translation'] as String?,
        footnotes: json['footnotes'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'sura': sura,
        'aya': aya,
        'arabic_text': arabicText,
        'translation': translation,
        'footnotes': footnotes,
      };
}
