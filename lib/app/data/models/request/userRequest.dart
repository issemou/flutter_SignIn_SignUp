
import 'package:equatable/equatable.dart';

class UserRequest extends Equatable{

  final String password;
  final String email;

  const UserRequest({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];

  Map<String, dynamic> toMap() {
    final queryParameters = {
      'email': email,
      'password': password
    };
    return queryParameters;
  }
}