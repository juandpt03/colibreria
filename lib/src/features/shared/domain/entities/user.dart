import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String password;

  const UserEntity({this.id = '', this.email = '', this.password = ''});

  UserEntity copyWith({
    final String? id,
    final String? email,
    final String? password,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [id, email, password];
}
