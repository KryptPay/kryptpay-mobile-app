import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solana/solana.dart';

part 'user_entity.freezed.dart';

part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String email,
    @Default('') String passcode,
    @Default('') String documentID,
    @Default('') String fiatCurrency,
    required Map<String, dynamic> userPublicKeyInfo,
  }) = _UserEntity;

  const UserEntity._();

  Ed25519HDPublicKey get publicKey {
    final decodedPublicKey = base64Url.decode(userPublicKeyInfo["publicKey"]);
    return Ed25519HDPublicKey(decodedPublicKey);
  }

  String get address => userPublicKeyInfo["address"];

  factory UserEntity.fromJson(Map<String, Object?> json) => _$UserEntityFromJson(json);
}
