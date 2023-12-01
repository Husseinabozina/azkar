import 'package:equatable/equatable.dart';

class Zekr extends Equatable {
  final String? category;
  final String? count;
  final String? description;
  final String? reference;
  final String? zekr;

  const Zekr({
    this.category,
    this.count,
    this.description,
    this.reference,
    this.zekr,
  });

  factory Zekr.fromJson(Map<String, dynamic> json) => Zekr(
        category: json['category'] as String?,
        count: json['count'] as String?,
        description: json['description'] as String?,
        reference: json['reference'] as String?,
        zekr: json['zekr'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'category': category,
        'count': count,
        'description': description,
        'reference': reference,
        'zekr': zekr,
      };

  Zekr copyWith({
    String? category,
    String? count,
    String? description,
    String? reference,
    String? zekr,
  }) {
    return Zekr(
      category: category ?? this.category,
      count: count ?? this.count,
      description: description ?? this.description,
      reference: reference ?? this.reference,
      zekr: zekr ?? this.zekr,
    );
  }

  @override
  List<Object?> get props {
    return [
      category,
      count,
      description,
      reference,
      zekr,
    ];
  }
}
