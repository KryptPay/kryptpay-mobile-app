// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return _UserEntity.fromJson(json);
}

/// @nodoc
mixin _$UserEntity {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get passcode => throw _privateConstructorUsedError;
  String get documentID => throw _privateConstructorUsedError;
  String get fiatCurrency => throw _privateConstructorUsedError;
  Map<String, dynamic> get userPublicKeyInfo =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call(
      {String id,
      String email,
      String passcode,
      String documentID,
      String fiatCurrency,
      Map<String, dynamic> userPublicKeyInfo});
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? passcode = null,
    Object? documentID = null,
    Object? fiatCurrency = null,
    Object? userPublicKeyInfo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      passcode: null == passcode
          ? _value.passcode
          : passcode // ignore: cast_nullable_to_non_nullable
              as String,
      documentID: null == documentID
          ? _value.documentID
          : documentID // ignore: cast_nullable_to_non_nullable
              as String,
      fiatCurrency: null == fiatCurrency
          ? _value.fiatCurrency
          : fiatCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      userPublicKeyInfo: null == userPublicKeyInfo
          ? _value.userPublicKeyInfo
          : userPublicKeyInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserEntityImplCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$UserEntityImplCopyWith(
          _$UserEntityImpl value, $Res Function(_$UserEntityImpl) then) =
      __$$UserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String passcode,
      String documentID,
      String fiatCurrency,
      Map<String, dynamic> userPublicKeyInfo});
}

/// @nodoc
class __$$UserEntityImplCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$UserEntityImpl>
    implements _$$UserEntityImplCopyWith<$Res> {
  __$$UserEntityImplCopyWithImpl(
      _$UserEntityImpl _value, $Res Function(_$UserEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? passcode = null,
    Object? documentID = null,
    Object? fiatCurrency = null,
    Object? userPublicKeyInfo = null,
  }) {
    return _then(_$UserEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      passcode: null == passcode
          ? _value.passcode
          : passcode // ignore: cast_nullable_to_non_nullable
              as String,
      documentID: null == documentID
          ? _value.documentID
          : documentID // ignore: cast_nullable_to_non_nullable
              as String,
      fiatCurrency: null == fiatCurrency
          ? _value.fiatCurrency
          : fiatCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      userPublicKeyInfo: null == userPublicKeyInfo
          ? _value._userPublicKeyInfo
          : userPublicKeyInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserEntityImpl extends _UserEntity with DiagnosticableTreeMixin {
  const _$UserEntityImpl(
      {required this.id,
      required this.email,
      this.passcode = '',
      this.documentID = '',
      this.fiatCurrency = '',
      required final Map<String, dynamic> userPublicKeyInfo})
      : _userPublicKeyInfo = userPublicKeyInfo,
        super._();

  factory _$UserEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  @JsonKey()
  final String passcode;
  @override
  @JsonKey()
  final String documentID;
  @override
  @JsonKey()
  final String fiatCurrency;
  final Map<String, dynamic> _userPublicKeyInfo;
  @override
  Map<String, dynamic> get userPublicKeyInfo {
    if (_userPublicKeyInfo is EqualUnmodifiableMapView)
      return _userPublicKeyInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_userPublicKeyInfo);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEntity(id: $id, email: $email, passcode: $passcode, documentID: $documentID, fiatCurrency: $fiatCurrency, userPublicKeyInfo: $userPublicKeyInfo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEntity'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('passcode', passcode))
      ..add(DiagnosticsProperty('documentID', documentID))
      ..add(DiagnosticsProperty('fiatCurrency', fiatCurrency))
      ..add(DiagnosticsProperty('userPublicKeyInfo', userPublicKeyInfo));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.passcode, passcode) ||
                other.passcode == passcode) &&
            (identical(other.documentID, documentID) ||
                other.documentID == documentID) &&
            (identical(other.fiatCurrency, fiatCurrency) ||
                other.fiatCurrency == fiatCurrency) &&
            const DeepCollectionEquality()
                .equals(other._userPublicKeyInfo, _userPublicKeyInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, passcode, documentID,
      fiatCurrency, const DeepCollectionEquality().hash(_userPublicKeyInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      __$$UserEntityImplCopyWithImpl<_$UserEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserEntityImplToJson(
      this,
    );
  }
}

abstract class _UserEntity extends UserEntity {
  const factory _UserEntity(
          {required final String id,
          required final String email,
          final String passcode,
          final String documentID,
          final String fiatCurrency,
          required final Map<String, dynamic> userPublicKeyInfo}) =
      _$UserEntityImpl;
  const _UserEntity._() : super._();

  factory _UserEntity.fromJson(Map<String, dynamic> json) =
      _$UserEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get passcode;
  @override
  String get documentID;
  @override
  String get fiatCurrency;
  @override
  Map<String, dynamic> get userPublicKeyInfo;
  @override
  @JsonKey(ignore: true)
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
