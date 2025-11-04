class Achievement {
  final String id;
  final String name;
  final String description;
  final String earnedDate;
  final String badgeColor;

  Achievement({
    required this.id,
    required this.name,
    required this.description,
    required this.earnedDate,
    required this.badgeColor,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) {
    return Achievement(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      earnedDate: json['earnedDate'] ?? '',
      badgeColor: json['badgeColor'] ?? '#2196F3',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'earnedDate': earnedDate,
      'badgeColor': badgeColor,
    };
  }

  Achievement copyWith({
    String? id,
    String? name,
    String? description,
    String? earnedDate,
    String? badgeColor,
  }) {
    return Achievement(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      earnedDate: earnedDate ?? this.earnedDate,
      badgeColor: badgeColor ?? this.badgeColor,
    );
  }
}
