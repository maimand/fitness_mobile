import 'package:json_annotation/json_annotation.dart';
part 'user.model.g.dart';

@JsonSerializable()
class LoginRequest {
  final String? username;
  final String? password;

  LoginRequest(this.username, this.password);

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

}

@JsonSerializable()
class LoginResult {
  @JsonKey(name:'access_token')
  final String? accessToken;

  LoginResult(this.accessToken);

  factory LoginResult.fromJson(Map<String, dynamic> json) =>
      _$LoginResultFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResultToJson(this);

}

@JsonSerializable()
class UserModel {
  final String? fullname;
  final String? email;
  final double? height;
  final double? weight;
  final int? age;
  final String? gender;

  UserModel(
      {this.fullname,
      this.email,
      this.height,
      this.weight,
      this.age,
      this.gender});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);


  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
