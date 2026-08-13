// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  List<OrderTagModel> get tags => throw _privateConstructorUsedError;
  String get clientId => throw _privateConstructorUsedError;
  String get clientName => throw _privateConstructorUsedError;
  String get clientPhone => throw _privateConstructorUsedError;
  double? get clientRating => throw _privateConstructorUsedError;
  List<String> get applicants => throw _privateConstructorUsedError;
  String? get selectedSpecialistId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool get isUrgent => throw _privateConstructorUsedError;

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String category,
      String price,
      String date,
      String location,
      String time,
      List<OrderTagModel> tags,
      String clientId,
      String clientName,
      String clientPhone,
      double? clientRating,
      List<String> applicants,
      String? selectedSpecialistId,
      String status,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool isUrgent});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? price = null,
    Object? date = null,
    Object? location = null,
    Object? time = null,
    Object? tags = null,
    Object? clientId = null,
    Object? clientName = null,
    Object? clientPhone = null,
    Object? clientRating = freezed,
    Object? applicants = null,
    Object? selectedSpecialistId = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isUrgent = null,
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<OrderTagModel>,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: null == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      clientPhone: null == clientPhone
          ? _value.clientPhone
          : clientPhone // ignore: cast_nullable_to_non_nullable
              as String,
      clientRating: freezed == clientRating
          ? _value.clientRating
          : clientRating // ignore: cast_nullable_to_non_nullable
              as double?,
      applicants: null == applicants
          ? _value.applicants
          : applicants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedSpecialistId: freezed == selectedSpecialistId
          ? _value.selectedSpecialistId
          : selectedSpecialistId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isUrgent: null == isUrgent
          ? _value.isUrgent
          : isUrgent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String category,
      String price,
      String date,
      String location,
      String time,
      List<OrderTagModel> tags,
      String clientId,
      String clientName,
      String clientPhone,
      double? clientRating,
      List<String> applicants,
      String? selectedSpecialistId,
      String status,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool isUrgent});
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? price = null,
    Object? date = null,
    Object? location = null,
    Object? time = null,
    Object? tags = null,
    Object? clientId = null,
    Object? clientName = null,
    Object? clientPhone = null,
    Object? clientRating = freezed,
    Object? applicants = null,
    Object? selectedSpecialistId = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isUrgent = null,
  }) {
    return _then(_$OrderModelImpl(
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<OrderTagModel>,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: null == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      clientPhone: null == clientPhone
          ? _value.clientPhone
          : clientPhone // ignore: cast_nullable_to_non_nullable
              as String,
      clientRating: freezed == clientRating
          ? _value.clientRating
          : clientRating // ignore: cast_nullable_to_non_nullable
              as double?,
      applicants: null == applicants
          ? _value._applicants
          : applicants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedSpecialistId: freezed == selectedSpecialistId
          ? _value.selectedSpecialistId
          : selectedSpecialistId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isUrgent: null == isUrgent
          ? _value.isUrgent
          : isUrgent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl implements _OrderModel {
  const _$OrderModelImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.price,
      required this.date,
      required this.location,
      required this.time,
      final List<OrderTagModel> tags = const [],
      required this.clientId,
      required this.clientName,
      required this.clientPhone,
      this.clientRating,
      final List<String> applicants = const [],
      this.selectedSpecialistId,
      this.status = 'open',
      this.createdAt,
      this.updatedAt,
      this.isUrgent = false})
      : _tags = tags,
        _applicants = applicants;

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String category;
  @override
  final String price;
  @override
  final String date;
  @override
  final String location;
  @override
  final String time;
  final List<OrderTagModel> _tags;
  @override
  @JsonKey()
  List<OrderTagModel> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String clientId;
  @override
  final String clientName;
  @override
  final String clientPhone;
  @override
  final double? clientRating;
  final List<String> _applicants;
  @override
  @JsonKey()
  List<String> get applicants {
    if (_applicants is EqualUnmodifiableListView) return _applicants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applicants);
  }

  @override
  final String? selectedSpecialistId;
  @override
  @JsonKey()
  final String status;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final bool isUrgent;

  @override
  String toString() {
    return 'OrderModel(id: $id, title: $title, description: $description, category: $category, price: $price, date: $date, location: $location, time: $time, tags: $tags, clientId: $clientId, clientName: $clientName, clientPhone: $clientPhone, clientRating: $clientRating, applicants: $applicants, selectedSpecialistId: $selectedSpecialistId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, isUrgent: $isUrgent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.clientPhone, clientPhone) ||
                other.clientPhone == clientPhone) &&
            (identical(other.clientRating, clientRating) ||
                other.clientRating == clientRating) &&
            const DeepCollectionEquality()
                .equals(other._applicants, _applicants) &&
            (identical(other.selectedSpecialistId, selectedSpecialistId) ||
                other.selectedSpecialistId == selectedSpecialistId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isUrgent, isUrgent) ||
                other.isUrgent == isUrgent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        description,
        category,
        price,
        date,
        location,
        time,
        const DeepCollectionEquality().hash(_tags),
        clientId,
        clientName,
        clientPhone,
        clientRating,
        const DeepCollectionEquality().hash(_applicants),
        selectedSpecialistId,
        status,
        createdAt,
        updatedAt,
        isUrgent
      ]);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel(
      {required final String id,
      required final String title,
      required final String description,
      required final String category,
      required final String price,
      required final String date,
      required final String location,
      required final String time,
      final List<OrderTagModel> tags,
      required final String clientId,
      required final String clientName,
      required final String clientPhone,
      final double? clientRating,
      final List<String> applicants,
      final String? selectedSpecialistId,
      final String status,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final bool isUrgent}) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get category;
  @override
  String get price;
  @override
  String get date;
  @override
  String get location;
  @override
  String get time;
  @override
  List<OrderTagModel> get tags;
  @override
  String get clientId;
  @override
  String get clientName;
  @override
  String get clientPhone;
  @override
  double? get clientRating;
  @override
  List<String> get applicants;
  @override
  String? get selectedSpecialistId;
  @override
  String get status;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  bool get isUrgent;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderTagModel _$OrderTagModelFromJson(Map<String, dynamic> json) {
  return _OrderTagModel.fromJson(json);
}

/// @nodoc
mixin _$OrderTagModel {
  String get text => throw _privateConstructorUsedError;
  bool get isUrgent => throw _privateConstructorUsedError;
  bool get isGreen => throw _privateConstructorUsedError;

  /// Serializes this OrderTagModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderTagModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderTagModelCopyWith<OrderTagModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTagModelCopyWith<$Res> {
  factory $OrderTagModelCopyWith(
          OrderTagModel value, $Res Function(OrderTagModel) then) =
      _$OrderTagModelCopyWithImpl<$Res, OrderTagModel>;
  @useResult
  $Res call({String text, bool isUrgent, bool isGreen});
}

/// @nodoc
class _$OrderTagModelCopyWithImpl<$Res, $Val extends OrderTagModel>
    implements $OrderTagModelCopyWith<$Res> {
  _$OrderTagModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderTagModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? isUrgent = null,
    Object? isGreen = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isUrgent: null == isUrgent
          ? _value.isUrgent
          : isUrgent // ignore: cast_nullable_to_non_nullable
              as bool,
      isGreen: null == isGreen
          ? _value.isGreen
          : isGreen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderTagModelImplCopyWith<$Res>
    implements $OrderTagModelCopyWith<$Res> {
  factory _$$OrderTagModelImplCopyWith(
          _$OrderTagModelImpl value, $Res Function(_$OrderTagModelImpl) then) =
      __$$OrderTagModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, bool isUrgent, bool isGreen});
}

/// @nodoc
class __$$OrderTagModelImplCopyWithImpl<$Res>
    extends _$OrderTagModelCopyWithImpl<$Res, _$OrderTagModelImpl>
    implements _$$OrderTagModelImplCopyWith<$Res> {
  __$$OrderTagModelImplCopyWithImpl(
      _$OrderTagModelImpl _value, $Res Function(_$OrderTagModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderTagModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? isUrgent = null,
    Object? isGreen = null,
  }) {
    return _then(_$OrderTagModelImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isUrgent: null == isUrgent
          ? _value.isUrgent
          : isUrgent // ignore: cast_nullable_to_non_nullable
              as bool,
      isGreen: null == isGreen
          ? _value.isGreen
          : isGreen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderTagModelImpl implements _OrderTagModel {
  const _$OrderTagModelImpl(
      {required this.text, this.isUrgent = false, this.isGreen = false});

  factory _$OrderTagModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderTagModelImplFromJson(json);

  @override
  final String text;
  @override
  @JsonKey()
  final bool isUrgent;
  @override
  @JsonKey()
  final bool isGreen;

  @override
  String toString() {
    return 'OrderTagModel(text: $text, isUrgent: $isUrgent, isGreen: $isGreen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderTagModelImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isUrgent, isUrgent) ||
                other.isUrgent == isUrgent) &&
            (identical(other.isGreen, isGreen) || other.isGreen == isGreen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, isUrgent, isGreen);

  /// Create a copy of OrderTagModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderTagModelImplCopyWith<_$OrderTagModelImpl> get copyWith =>
      __$$OrderTagModelImplCopyWithImpl<_$OrderTagModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderTagModelImplToJson(
      this,
    );
  }
}

abstract class _OrderTagModel implements OrderTagModel {
  const factory _OrderTagModel(
      {required final String text,
      final bool isUrgent,
      final bool isGreen}) = _$OrderTagModelImpl;

  factory _OrderTagModel.fromJson(Map<String, dynamic> json) =
      _$OrderTagModelImpl.fromJson;

  @override
  String get text;
  @override
  bool get isUrgent;
  @override
  bool get isGreen;

  /// Create a copy of OrderTagModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderTagModelImplCopyWith<_$OrderTagModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
