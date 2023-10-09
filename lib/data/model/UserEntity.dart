import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserEntity.freezed.dart';
part 'UserEntity.g.dart';
@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity(
      {required int id,
      required String name,
      required String desc,
      @Default(false) bool isExistUser
      }) = _UserEntity;

      factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}
