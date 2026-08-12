class Order {
  final String id;
  final String title;
  final String description;
  final String category; // Звукорежиссёр, Бэклайнер, Техник, Мониторист
  final String price; // "25 000 ₽"
  final String date; // "15 авг" или "20–22 авг"
  final String location; // "Москва", "СПб"
  final String time; // "12:00–02:00" или "3 дня"
  final List<OrderTag> tags;
  final String clientId; // ID заказчика (User)
  final String clientName;
  final String clientPhone;
  final double? clientRating;
  final List<String> applicants; // список User ID кто откликнулся
  final String? selectedSpecialistId; // кто выбран для выполнения
  final String status; // "open", "in_progress", "completed", "cancelled"
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isUrgent;

  Order({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.date,
    required this.location,
    required this.time,
    required this.tags,
    required this.clientId,
    required this.clientName,
    required this.clientPhone,
    this.clientRating,
    required this.applicants,
    this.selectedSpecialistId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.isUrgent = false,
  });

  Order copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    String? price,
    String? date,
    String? location,
    String? time,
    List<OrderTag>? tags,
    String? clientId,
    String? clientName,
    String? clientPhone,
    double? clientRating,
    List<String>? applicants,
    String? selectedSpecialistId,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isUrgent,
  }) {
    return Order(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      date: date ?? this.date,
      location: location ?? this.location,
      time: time ?? this.time,
      tags: tags ?? this.tags,
      clientId: clientId ?? this.clientId,
      clientName: clientName ?? this.clientName,
      clientPhone: clientPhone ?? this.clientPhone,
      clientRating: clientRating ?? this.clientRating,
      applicants: applicants ?? this.applicants,
      selectedSpecialistId: selectedSpecialistId ?? this.selectedSpecialistId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isUrgent: isUrgent ?? this.isUrgent,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'date': date,
      'location': location,
      'time': time,
      'tags': tags.map((t) => t.toJson()).toList(),
      'clientId': clientId,
      'clientName': clientName,
      'clientPhone': clientPhone,
      'clientRating': clientRating,
      'applicants': applicants,
      'selectedSpecialistId': selectedSpecialistId,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isUrgent': isUrgent,
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      price: json['price'] as String,
      date: json['date'] as String,
      location: json['location'] as String,
      time: json['time'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((t) => OrderTag.fromJson(t as Map<String, dynamic>))
          .toList(),
      clientId: json['clientId'] as String,
      clientName: json['clientName'] as String,
      clientPhone: json['clientPhone'] as String,
      clientRating: json['clientRating'] as double?,
      applicants: List<String>.from(json['applicants'] as List),
      selectedSpecialistId: json['selectedSpecialistId'] as String?,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isUrgent: json['isUrgent'] as bool? ?? false,
    );
  }
}

class OrderTag {
  final String text;
  final bool isUrgent;
  final bool isGreen;

  OrderTag({
    required this.text,
    this.isUrgent = false,
    this.isGreen = false,
  });

  OrderTag copyWith({
    String? text,
    bool? isUrgent,
    bool? isGreen,
  }) {
    return OrderTag(
      text: text ?? this.text,
      isUrgent: isUrgent ?? this.isUrgent,
      isGreen: isGreen ?? this.isGreen,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'isUrgent': isUrgent,
      'isGreen': isGreen,
    };
  }

  factory OrderTag.fromJson(Map<String, dynamic> json) {
    return OrderTag(
      text: json['text'] as String,
      isUrgent: json['isUrgent'] as bool? ?? false,
      isGreen: json['isGreen'] as bool? ?? false,
    );
  }
}
