// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventModel _$EventModelFromJson(Map<String, dynamic> json) {
  return _EventModel.fromJson(json);
}

/// @nodoc
mixin _$EventModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String get organizer => throw _privateConstructorUsedError;
  List<String> get requiredSpecialists => throw _privateConstructorUsedError;
  Map<String, List<String>> get teamMembers =>
      throw _privateConstructorUsedError;
  double get budget => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this EventModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventModelCopyWith<EventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventModelCopyWith<$Res> {
  factory $EventModelCopyWith(
          EventModel value, $Res Function(EventModel) then) =
      _$EventModelCopyWithImpl<$Res, EventModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String type,
      String location,
      DateTime startDate,
      DateTime endDate,
      String organizer,
      List<String> requiredSpecialists,
      Map<String, List<String>> teamMembers,
      double budget,
      String status,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$EventModelCopyWithImpl<$Res, $Val extends EventModel>
    implements $EventModelCopyWith<$Res> {
  _$EventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? location = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? organizer = null,
    Object? requiredSpecialists = null,
    Object? teamMembers = null,
    Object? budget = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      organizer: null == organizer
          ? _value.organizer
          : organizer // ignore: cast_nullable_to_non_nullable
              as String,
      requiredSpecialists: null == requiredSpecialists
          ? _value.requiredSpecialists
          : requiredSpecialists // ignore: cast_nullable_to_non_nullable
              as List<String>,
      teamMembers: null == teamMembers
          ? _value.teamMembers
          : teamMembers // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventModelImplCopyWith<$Res>
    implements $EventModelCopyWith<$Res> {
  factory _$$EventModelImplCopyWith(
          _$EventModelImpl value, $Res Function(_$EventModelImpl) then) =
      __$$EventModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String type,
      String location,
      DateTime startDate,
      DateTime endDate,
      String organizer,
      List<String> requiredSpecialists,
      Map<String, List<String>> teamMembers,
      double budget,
      String status,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$EventModelImplCopyWithImpl<$Res>
    extends _$EventModelCopyWithImpl<$Res, _$EventModelImpl>
    implements _$$EventModelImplCopyWith<$Res> {
  __$$EventModelImplCopyWithImpl(
      _$EventModelImpl _value, $Res Function(_$EventModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? location = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? organizer = null,
    Object? requiredSpecialists = null,
    Object? teamMembers = null,
    Object? budget = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$EventModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      organizer: null == organizer
          ? _value.organizer
          : organizer // ignore: cast_nullable_to_non_nullable
              as String,
      requiredSpecialists: null == requiredSpecialists
          ? _value._requiredSpecialists
          : requiredSpecialists // ignore: cast_nullable_to_non_nullable
              as List<String>,
      teamMembers: null == teamMembers
          ? _value._teamMembers
          : teamMembers // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventModelImpl implements _EventModel {
  const _$EventModelImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.type,
      required this.location,
      required this.startDate,
      required this.endDate,
      required this.organizer,
      final List<String> requiredSpecialists = const [],
      final Map<String, List<String>> teamMembers = const {},
      this.budget = 0.0,
      this.status = 'planning',
      this.createdAt,
      this.updatedAt})
      : _requiredSpecialists = requiredSpecialists,
        _teamMembers = teamMembers;

  factory _$EventModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String type;
  @override
  final String location;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String organizer;
  final List<String> _requiredSpecialists;
  @override
  @JsonKey()
  List<String> get requiredSpecialists {
    if (_requiredSpecialists is EqualUnmodifiableListView)
      return _requiredSpecialists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requiredSpecialists);
  }

  final Map<String, List<String>> _teamMembers;
  @override
  @JsonKey()
  Map<String, List<String>> get teamMembers {
    if (_teamMembers is EqualUnmodifiableMapView) return _teamMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_teamMembers);
  }

  @override
  @JsonKey()
  final double budget;
  @override
  @JsonKey()
  final String status;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'EventModel(id: $id, title: $title, description: $description, type: $type, location: $location, startDate: $startDate, endDate: $endDate, organizer: $organizer, requiredSpecialists: $requiredSpecialists, teamMembers: $teamMembers, budget: $budget, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.organizer, organizer) ||
                other.organizer == organizer) &&
            const DeepCollectionEquality()
                .equals(other._requiredSpecialists, _requiredSpecialists) &&
            const DeepCollectionEquality()
                .equals(other._teamMembers, _teamMembers) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      type,
      location,
      startDate,
      endDate,
      organizer,
      const DeepCollectionEquality().hash(_requiredSpecialists),
      const DeepCollectionEquality().hash(_teamMembers),
      budget,
      status,
      createdAt,
      updatedAt);

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      __$$EventModelImplCopyWithImpl<_$EventModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventModelImplToJson(
      this,
    );
  }
}

abstract class _EventModel implements EventModel {
  const factory _EventModel(
      {required final String id,
      required final String title,
      required final String description,
      required final String type,
      required final String location,
      required final DateTime startDate,
      required final DateTime endDate,
      required final String organizer,
      final List<String> requiredSpecialists,
      final Map<String, List<String>> teamMembers,
      final double budget,
      final String status,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$EventModelImpl;

  factory _EventModel.fromJson(Map<String, dynamic> json) =
      _$EventModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get type;
  @override
  String get location;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String get organizer;
  @override
  List<String> get requiredSpecialists;
  @override
  Map<String, List<String>> get teamMembers;
  @override
  double get budget;
  @override
  String get status;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
