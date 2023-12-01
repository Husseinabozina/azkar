import 'package:equatable/equatable.dart';

import 'array.dart';

class Surah extends Equatable {
  final int? id;
  final String? name;
  final String? nameEn;
  final String? nameTranslation;
  final int? words;
  final int? letters;
  final String? type;
  final String? typeEn;
  final String? ar;
  final String? en;
  final List<Array>? array;

  const Surah({
    this.id,
    this.name,
    this.nameEn,
    this.nameTranslation,
    this.words,
    this.letters,
    this.type,
    this.typeEn,
    this.ar,
    this.en,
    this.array,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        id: json['id'] as int?,
        name: json['name'] as String?,
        nameEn: json['name_en'] as String?,
        nameTranslation: json['name_translation'] as String?,
        words: json['words'] as int?,
        letters: json['letters'] as int?,
        type: json['type'] as String?,
        typeEn: json['type_en'] as String?,
        ar: json['ar'] as String?,
        en: json['en'] as String?,
        array: (json['array'] as List<dynamic>?)
            ?.map((e) => Array.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'name_en': nameEn,
        'name_translation': nameTranslation,
        'words': words,
        'letters': letters,
        'type': type,
        'type_en': typeEn,
        'ar': ar,
        'en': en,
        'array': array?.map((e) => e.toJson()).toList(),
      };

  Surah copyWith({
    int? id,
    String? name,
    String? nameEn,
    String? nameTranslation,
    int? words,
    int? letters,
    String? type,
    String? typeEn,
    String? ar,
    String? en,
    List<Array>? array,
  }) {
    return Surah(
      id: id ?? this.id,
      name: name ?? this.name,
      nameEn: nameEn ?? this.nameEn,
      nameTranslation: nameTranslation ?? this.nameTranslation,
      words: words ?? this.words,
      letters: letters ?? this.letters,
      type: type ?? this.type,
      typeEn: typeEn ?? this.typeEn,
      ar: ar ?? this.ar,
      en: en ?? this.en,
      array: array ?? this.array,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      nameEn,
      nameTranslation,
      words,
      letters,
      type,
      typeEn,
      ar,
      en,
      array,
    ];
  }
}
