// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderModel {
  String get id;
  String get title;
  String get description;
  String get category;

  /// Raw price string for display (e.g. "25 000 ₽").
  String get price;

  /// Price in smallest currency unit for sorting/comparison.
  /// Defaults to 0 if the backend omits it.
  int? get priceCents;

  /// Raw date string for display (e.g. "15 авг").
  String get date;

  /// Parsed date for sorting/filtering.
  DateTime? get orderDate;
  String get location;
  String get time;
  List<OrderTagModel> get tags;
  String get clientId;
  String get clientName;
  String get clientPhone;
  double? get clientRating;
  List<String> get applicants;
  String? get selectedSpecialistId;
  String get status;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  bool get isUrgent;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderModelCopyWith<OrderModel> get copyWith =>
      _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.priceCents, priceCents) ||
                other.priceCents == priceCents) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.clientPhone, clientPhone) ||
                other.clientPhone == clientPhone) &&
            (identical(other.clientRating, clientRating) ||
                other.clientRating == clientRating) &&
            const DeepCollectionEquality()
                .equals(other.applicants, applicants) &&
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
        priceCents,
        date,
        orderDate,
        location,
        time,
        const DeepCollectionEquality().hash(tags),
        clientId,
        clientName,
        clientPhone,
        clientRating,
        const DeepCollectionEquality().hash(applicants),
        selectedSpecialistId,
        status,
        createdAt,
        updatedAt,
        isUrgent
      ]);

  @override
  String toString() {
    return 'OrderModel(id: $id, title: $title, description: $description, category: $category, price: $price, priceCents: $priceCents, date: $date, orderDate: $orderDate, location: $location, time: $time, tags: $tags, clientId: $clientId, clientName: $clientName, clientPhone: $clientPhone, clientRating: $clientRating, applicants: $applicants, selectedSpecialistId: $selectedSpecialistId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, isUrgent: $isUrgent)';
  }
}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) _then) =
      _$OrderModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String category,
      String price,
      int? priceCents,
      String date,
      DateTime? orderDate,
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
class _$OrderModelCopyWithImpl<$Res> implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

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
    Object? priceCents = freezed,
    Object? date = null,
    Object? orderDate = freezed,
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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      priceCents: freezed == priceCents
          ? _self.priceCents
          : priceCents // ignore: cast_nullable_to_non_nullable
              as int?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: freezed == orderDate
          ? _self.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<OrderTagModel>,
      clientId: null == clientId
          ? _self.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: null == clientName
          ? _self.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      clientPhone: null == clientPhone
          ? _self.clientPhone
          : clientPhone // ignore: cast_nullable_to_non_nullable
              as String,
      clientRating: freezed == clientRating
          ? _self.clientRating
          : clientRating // ignore: cast_nullable_to_non_nullable
              as double?,
      applicants: null == applicants
          ? _self.applicants
          : applicants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedSpecialistId: freezed == selectedSpecialistId
          ? _self.selectedSpecialistId
          : selectedSpecialistId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isUrgent: null == isUrgent
          ? _self.isUrgent
          : isUrgent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [OrderModel].
extension OrderModelPatterns on OrderModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_OrderModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_OrderModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderModel():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_OrderModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String title,
            String description,
            String category,
            String price,
            int? priceCents,
            String date,
            DateTime? orderDate,
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
            bool isUrgent)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderModel() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.description,
            _that.category,
            _that.price,
            _that.priceCents,
            _that.date,
            _that.orderDate,
            _that.location,
            _that.time,
            _that.tags,
            _that.clientId,
            _that.clientName,
            _that.clientPhone,
            _that.clientRating,
            _that.applicants,
            _that.selectedSpecialistId,
            _that.status,
            _that.createdAt,
            _that.updatedAt,
            _that.isUrgent);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String title,
            String description,
            String category,
            String price,
            int? priceCents,
            String date,
            DateTime? orderDate,
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
            bool isUrgent)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderModel():
        return $default(
            _that.id,
            _that.title,
            _that.description,
            _that.category,
            _that.price,
            _that.priceCents,
            _that.date,
            _that.orderDate,
            _that.location,
            _that.time,
            _that.tags,
            _that.clientId,
            _that.clientName,
            _that.clientPhone,
            _that.clientRating,
            _that.applicants,
            _that.selectedSpecialistId,
            _that.status,
            _that.createdAt,
            _that.updatedAt,
            _that.isUrgent);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String title,
            String description,
            String category,
            String price,
            int? priceCents,
            String date,
            DateTime? orderDate,
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
            bool isUrgent)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderModel() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.description,
            _that.category,
            _that.price,
            _that.priceCents,
            _that.date,
            _that.orderDate,
            _that.location,
            _that.time,
            _that.tags,
            _that.clientId,
            _that.clientName,
            _that.clientPhone,
            _that.clientRating,
            _that.applicants,
            _that.selectedSpecialistId,
            _that.status,
            _that.createdAt,
            _that.updatedAt,
            _that.isUrgent);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OrderModel implements OrderModel {
  const _OrderModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.price,
      this.priceCents,
      required this.date,
      this.orderDate,
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
  factory _OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String category;

  /// Raw price string for display (e.g. "25 000 ₽").
  @override
  final String price;

  /// Price in smallest currency unit for sorting/comparison.
  /// Defaults to 0 if the backend omits it.
  @override
  final int? priceCents;

  /// Raw date string for display (e.g. "15 авг").
  @override
  final String date;

  /// Parsed date for sorting/filtering.
  @override
  final DateTime? orderDate;
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

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderModelCopyWith<_OrderModel> get copyWith =>
      __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrderModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.priceCents, priceCents) ||
                other.priceCents == priceCents) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
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
        priceCents,
        date,
        orderDate,
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

  @override
  String toString() {
    return 'OrderModel(id: $id, title: $title, description: $description, category: $category, price: $price, priceCents: $priceCents, date: $date, orderDate: $orderDate, location: $location, time: $time, tags: $tags, clientId: $clientId, clientName: $clientName, clientPhone: $clientPhone, clientRating: $clientRating, applicants: $applicants, selectedSpecialistId: $selectedSpecialistId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, isUrgent: $isUrgent)';
  }
}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(
          _OrderModel value, $Res Function(_OrderModel) _then) =
      __$OrderModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String category,
      String price,
      int? priceCents,
      String date,
      DateTime? orderDate,
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
class __$OrderModelCopyWithImpl<$Res> implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? price = null,
    Object? priceCents = freezed,
    Object? date = null,
    Object? orderDate = freezed,
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
    return _then(_OrderModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      priceCents: freezed == priceCents
          ? _self.priceCents
          : priceCents // ignore: cast_nullable_to_non_nullable
              as int?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: freezed == orderDate
          ? _self.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<OrderTagModel>,
      clientId: null == clientId
          ? _self.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: null == clientName
          ? _self.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      clientPhone: null == clientPhone
          ? _self.clientPhone
          : clientPhone // ignore: cast_nullable_to_non_nullable
              as String,
      clientRating: freezed == clientRating
          ? _self.clientRating
          : clientRating // ignore: cast_nullable_to_non_nullable
              as double?,
      applicants: null == applicants
          ? _self._applicants
          : applicants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedSpecialistId: freezed == selectedSpecialistId
          ? _self.selectedSpecialistId
          : selectedSpecialistId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isUrgent: null == isUrgent
          ? _self.isUrgent
          : isUrgent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$OrderTagModel {
  String get text;
  bool get isUrgent;
  bool get isGreen;

  /// Create a copy of OrderTagModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderTagModelCopyWith<OrderTagModel> get copyWith =>
      _$OrderTagModelCopyWithImpl<OrderTagModel>(
          this as OrderTagModel, _$identity);

  /// Serializes this OrderTagModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderTagModel &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isUrgent, isUrgent) ||
                other.isUrgent == isUrgent) &&
            (identical(other.isGreen, isGreen) || other.isGreen == isGreen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, isUrgent, isGreen);

  @override
  String toString() {
    return 'OrderTagModel(text: $text, isUrgent: $isUrgent, isGreen: $isGreen)';
  }
}

/// @nodoc
abstract mixin class $OrderTagModelCopyWith<$Res> {
  factory $OrderTagModelCopyWith(
          OrderTagModel value, $Res Function(OrderTagModel) _then) =
      _$OrderTagModelCopyWithImpl;
  @useResult
  $Res call({String text, bool isUrgent, bool isGreen});
}

/// @nodoc
class _$OrderTagModelCopyWithImpl<$Res>
    implements $OrderTagModelCopyWith<$Res> {
  _$OrderTagModelCopyWithImpl(this._self, this._then);

  final OrderTagModel _self;
  final $Res Function(OrderTagModel) _then;

  /// Create a copy of OrderTagModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? isUrgent = null,
    Object? isGreen = null,
  }) {
    return _then(_self.copyWith(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isUrgent: null == isUrgent
          ? _self.isUrgent
          : isUrgent // ignore: cast_nullable_to_non_nullable
              as bool,
      isGreen: null == isGreen
          ? _self.isGreen
          : isGreen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [OrderTagModel].
extension OrderTagModelPatterns on OrderTagModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_OrderTagModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderTagModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_OrderTagModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderTagModel():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_OrderTagModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderTagModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String text, bool isUrgent, bool isGreen)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderTagModel() when $default != null:
        return $default(_that.text, _that.isUrgent, _that.isGreen);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String text, bool isUrgent, bool isGreen) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderTagModel():
        return $default(_that.text, _that.isUrgent, _that.isGreen);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String text, bool isUrgent, bool isGreen)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderTagModel() when $default != null:
        return $default(_that.text, _that.isUrgent, _that.isGreen);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OrderTagModel implements OrderTagModel {
  const _OrderTagModel(
      {required this.text, this.isUrgent = false, this.isGreen = false});
  factory _OrderTagModel.fromJson(Map<String, dynamic> json) =>
      _$OrderTagModelFromJson(json);

  @override
  final String text;
  @override
  @JsonKey()
  final bool isUrgent;
  @override
  @JsonKey()
  final bool isGreen;

  /// Create a copy of OrderTagModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderTagModelCopyWith<_OrderTagModel> get copyWith =>
      __$OrderTagModelCopyWithImpl<_OrderTagModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrderTagModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderTagModel &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isUrgent, isUrgent) ||
                other.isUrgent == isUrgent) &&
            (identical(other.isGreen, isGreen) || other.isGreen == isGreen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, isUrgent, isGreen);

  @override
  String toString() {
    return 'OrderTagModel(text: $text, isUrgent: $isUrgent, isGreen: $isGreen)';
  }
}

/// @nodoc
abstract mixin class _$OrderTagModelCopyWith<$Res>
    implements $OrderTagModelCopyWith<$Res> {
  factory _$OrderTagModelCopyWith(
          _OrderTagModel value, $Res Function(_OrderTagModel) _then) =
      __$OrderTagModelCopyWithImpl;
  @override
  @useResult
  $Res call({String text, bool isUrgent, bool isGreen});
}

/// @nodoc
class __$OrderTagModelCopyWithImpl<$Res>
    implements _$OrderTagModelCopyWith<$Res> {
  __$OrderTagModelCopyWithImpl(this._self, this._then);

  final _OrderTagModel _self;
  final $Res Function(_OrderTagModel) _then;

  /// Create a copy of OrderTagModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
    Object? isUrgent = null,
    Object? isGreen = null,
  }) {
    return _then(_OrderTagModel(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isUrgent: null == isUrgent
          ? _self.isUrgent
          : isUrgent // ignore: cast_nullable_to_non_nullable
              as bool,
      isGreen: null == isGreen
          ? _self.isGreen
          : isGreen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
