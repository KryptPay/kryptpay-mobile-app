// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      passcode: json['passcode'] as String? ?? '',
      documentID: json['documentID'] as String? ?? '',
      fiatCurrency: json['fiatCurrency'] as String? ?? '',
      userPublicKeyInfo: json['userPublicKeyInfo'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'passcode': instance.passcode,
      'documentID': instance.documentID,
      'fiatCurrency': instance.fiatCurrency,
      'userPublicKeyInfo': instance.userPublicKeyInfo,
    };
