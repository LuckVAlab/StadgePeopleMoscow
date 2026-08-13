// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get specialty => throw _privateConstructorUsedError;
  String get specialties => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get reviewsCount => throw _privateConstructorUsedError;
  List<String> get equipment => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;
  Map<int, bool?>? get calendar => throw _privateConstructorUsedError;
  String get subscription => throw _privateConstructorUsedError;
  DateTime? get subscriptionExpiresAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String phoneNumber,
      String specialty,
      String specialties,
      double rating,
      int reviewsCount,
      List<String> equipment,
      List<String> skills,
      Map<int, bool?>? calendar,
      String subscription,
      DateTime? subscriptionExpiresAt,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? specialty = null,
    Object? specialties = null,
    Object? rating = null,
    Object? reviewsCount = null,
    Object? equipment = null,
    Object? skills = null,
    Object? calendar = freezed,
    Object? subscription = null,
    Object? subscriptionExpiresAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: null == specialty
          ? _value.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      specialties: null == specialties
          ? _value.specialties
          : specialties // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewsCount: null == reviewsCount
          ? _value.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as List<String>,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      calendar: freezed == calendar
          ? _value.calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as Map<int, bool?>?,
      subscription: null == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionExpiresAt: freezed == subscriptionExpiresAt
          ? _value.subscriptionExpiresAt
          : subscriptionExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String phoneNumber,
      String specialty,
      String specialties,
      double rating,
      int reviewsCount,
      List<String> equipment,
      List<String> skills,
      Map<int, bool?>? calendar,
      String subscription,
      DateTime? subscriptionExpiresAt,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? specialty = null,
    Object? specialties = null,
    Object? rating = null,
    Object? reviewsCount = null,
    Object? equipment = null,
    Object? skills = null,
    Object? calendar = freezed,
    Object? subscription = null,
    Object? subscriptionExpiresAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: null == specialty
          ? _value.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      specialties: null == specialties
          ? _value.specialties
          : specialties // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewsCount: null == reviewsCount
          ? _value.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int,
      equipment: null == equipment
          ? _value._equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as List<String>,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      calendar: freezed == calendar
          ? _value._calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as Map<int, bool?>?,
      subscription: null == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionExpiresAt: freezed == subscriptionExpiresAt
          ? _value.subscriptionExpiresAt
          : subscriptionExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.specialty,
      required this.specialties,
      this.rating = 0.0,
      this.reviewsCount = 0,
      final List<String> equipment = const [],
      final List<String> skills = const [],
      final Map<int, bool?>? calendar,
      this.subscription = 'Free',
      this.subscriptionExpiresAt,
      this.createdAt,
      this.updatedAt})
      : _equipment = equipment,
        _skills = skills,
        _calendar = calendar;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final String specialty;
  @override
  final String specialties;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final int reviewsCount;
  final List<String> _equipment;
  @override
  @JsonKey()
  List<String> get equipment {
    if (_equipment is EqualUnmodifiableListView) return _equipment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_equipment);
  }

  final List<String> _skills;
  @override
  @JsonKey()
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  final Map<int, bool?>? _calendar;
  @override
  Map<int, bool?>? get calendar {
    final value = _calendar;
    if (value == null) return null;
    if (_calendar is EqualUnmodifiableMapView) return _calendar;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final String subscription;
  @override
  final DateTime? subscriptionExpiresAt;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, phoneNumber: $phoneNumber, specialty: $specialty, specialties: $specialties, rating: $rating, reviewsCount: $reviewsCount, equipment: $equipment, skills: $skills, calendar: $calendar, subscription: $subscription, subscriptionExpiresAt: $subscriptionExpiresAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.specialties, specialties) ||
                other.specialties == specialties) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewsCount, reviewsCount) ||
                other.reviewsCount == reviewsCount) &&
            const DeepCollectionEquality()
                .equals(other._equipment, _equipment) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            const DeepCollectionEquality().equals(other._calendar, _calendar) &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription) &&
            (identical(other.subscriptionExpiresAt, subscriptionExpiresAt) ||
                other.subscriptionExpiresAt == subscriptionExpiresAt) &&
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
      name,
      email,
      phoneNumber,
      specialty,
      specialties,
      rating,
      reviewsCount,
      const DeepCollectionEquality().hash(_equipment),
      const DeepCollectionEquality().hash(_skills),
      const DeepCollectionEquality().hash(_calendar),
      subscription,
      subscriptionExpiresAt,
      createdAt,
      updatedAt);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final String id,
      required final String name,
      required final String email,
      required final String phoneNumber,
      required final String specialty,
      required final String specialties,
      final double rating,
      final int reviewsCount,
      final List<String> equipment,
      final List<String> skills,
      final Map<int, bool?>? calendar,
      final String subscription,
      final DateTime? subscriptionExpiresAt,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  String get specialty;
  @override
  String get specialties;
  @override
  double get rating;
  @override
  int get reviewsCount;
  @override
  List<String> get equipment;
  @override
  List<String> get skills;
  @override
  Map<int, bool?>? get calendar;
  @override
  String get subscription;
  @override
  DateTime? get subscriptionExpiresAt;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
