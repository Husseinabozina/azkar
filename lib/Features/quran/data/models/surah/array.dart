import 'package:equatable/equatable.dart';

class Array extends Equatable {
  final int? id;
  final String? ar;
  final String? en;
  final String? filename;
  final String? path;
  final String? dir;
  final int? size;

  const Array({
    this.id,
    this.ar,
    this.en,
    this.filename,
    this.path,
    this.dir,
    this.size,
  });

  factory Array.fromJson(Map<String, dynamic> json) => Array(
        id: json['id'] as int?,
        ar: json['ar'] as String?,
        en: json['en'] as String?,
        filename: json['filename'] as String?,
        path: json['path'] as String?,
        dir: json['dir'] as String?,
        size: json['size'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'ar': ar,
        'en': en,
        'filename': filename,
        'path': path,
        'dir': dir,
        'size': size,
      };

  Array copyWith({
    int? id,
    String? ar,
    String? en,
    String? filename,
    String? path,
    String? dir,
    int? size,
  }) {
    return Array(
      id: id ?? this.id,
      ar: ar ?? this.ar,
      en: en ?? this.en,
      filename: filename ?? this.filename,
      path: path ?? this.path,
      dir: dir ?? this.dir,
      size: size ?? this.size,
    );
  }

  @override
  List<Object?> get props => [id, ar, en, filename, path, dir, size];
}
