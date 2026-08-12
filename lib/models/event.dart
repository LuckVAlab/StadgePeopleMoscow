class Event {
  final String id;
  final String title;
  final String description;
  final String type; // "concert", "conference", "festival", "other"
  final String location;
  final DateTime startDate;
  final DateTime endDate;
  final String organizer; // User ID
  final List<String> requiredSpecialists; // список требуемых специальностей
  final Map<String, List<String>> teamMembers; // специальность -> список User ID
  final double budget;
  final String status; // "planning", "recruiting", "ongoing", "completed", "cancelled"
  final DateTime createdAt;
  final DateTime updatedAt;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.organizer,
    required this.requiredSpecialists,
    required this.teamMembers,
    required this.budget,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  Event copyWith({
    String? id,
    String? title,
    String? description,
    String? type,
    String? location,
    DateTime? startDate,
    DateTime? endDate,
    String? organizer,
    List<String>? requiredSpecialists,
    Map<String, List<String>>? teamMembers,
    double? budget,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Event(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      location: location ?? this.location,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      organizer: organizer ?? this.organizer,
      requiredSpecialists: requiredSpecialists ?? this.requiredSpecialists,
      teamMembers: teamMembers ?? this.teamMembers,
      budget: budget ?? this.budget,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type,
      'location': location,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'organizer': organizer,
      'requiredSpecialists': requiredSpecialists,
      'teamMembers': teamMembers,
      'budget': budget,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      location: json['location'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      organizer: json['organizer'] as String,
      requiredSpecialists: List<String>.from(json['requiredSpecialists'] as List),
      teamMembers: (json['teamMembers'] as Map<String, dynamic>).map(
        (k, v) => MapEntry(k, List<String>.from(v as List)),
      ),
      budget: (json['budget'] as num).toDouble(),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}
