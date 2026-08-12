class User {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String specialty; // Звукорежиссёр, Бэклайнер, Техник
  final String specialties; // Подробная специальность: FOH / Мониторы
  final double rating;
  final int reviewsCount;
  final List<String> equipment;
  final List<String> skills;
  final Map<int, bool?> calendar; // день месяца -> true(свободен), false(занят), null(обычный)
  final String subscription; // название подписки (EventOS Pro, Free)
  final DateTime subscriptionExpiresAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.specialty,
    required this.specialties,
    required this.rating,
    required this.reviewsCount,
    required this.equipment,
    required this.skills,
    required this.calendar,
    required this.subscription,
    required this.subscriptionExpiresAt,
    required this.createdAt,
    required this.updatedAt,
  });

  // Копирование с изменением
  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? specialty,
    String? specialties,
    double? rating,
    int? reviewsCount,
    List<String>? equipment,
    List<String>? skills,
    Map<int, bool?>? calendar,
    String? subscription,
    DateTime? subscriptionExpiresAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      specialty: specialty ?? this.specialty,
      specialties: specialties ?? this.specialties,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      equipment: equipment ?? this.equipment,
      skills: skills ?? this.skills,
      calendar: calendar ?? this.calendar,
      subscription: subscription ?? this.subscription,
      subscriptionExpiresAt: subscriptionExpiresAt ?? this.subscriptionExpiresAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // Преобразование в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'specialty': specialty,
      'specialties': specialties,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'equipment': equipment,
      'skills': skills,
      'calendar': calendar.map((k, v) => MapEntry(k.toString(), v)),
      'subscription': subscription,
      'subscriptionExpiresAt': subscriptionExpiresAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  // Преобразование из JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      specialty: json['specialty'] as String,
      specialties: json['specialties'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: json['reviewsCount'] as int,
      equipment: List<String>.from(json['equipment'] as List),
      skills: List<String>.from(json['skills'] as List),
      calendar: (json['calendar'] as Map<String, dynamic>).map(
        (k, v) => MapEntry(int.parse(k), v as bool?),
      ),
      subscription: json['subscription'] as String,
      subscriptionExpiresAt: DateTime.parse(json['subscriptionExpiresAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}
