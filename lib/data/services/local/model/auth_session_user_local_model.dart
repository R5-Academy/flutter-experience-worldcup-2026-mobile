import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_session_user_local_model.g.dart';

@JsonSerializable()
class const AuthSessionUserLocalModel({
  required final String name,
  required final String email,
}) extends Equatable {
  factory AuthSessionUserLocalModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionUserLocalModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthSessionUserLocalModelToJson(this);

  @override
  List<Object?> get props => [name, email];
}
