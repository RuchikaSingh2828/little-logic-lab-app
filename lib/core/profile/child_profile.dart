import 'package:flutter/foundation.dart';

@immutable
class ChildProfile {
  const ChildProfile({
    required this.id,
    required this.name,
    required this.ageYears,
    required this.accentKey,
  });

  final String id;
  final String name;
  final int ageYears;
  final String accentKey;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'ageYears': ageYears,
        'accentKey': accentKey,
      };

  factory ChildProfile.fromJson(Map<String, dynamic> json) {
    return ChildProfile(
      id: json['id'] as String,
      name: json['name'] as String,
      ageYears: json['ageYears'] as int,
      accentKey: json['accentKey'] as String,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is ChildProfile &&
      other.id == id &&
      other.name == name &&
      other.ageYears == ageYears &&
      other.accentKey == accentKey;

  @override
  int get hashCode => Object.hash(id, name, ageYears, accentKey);
}
