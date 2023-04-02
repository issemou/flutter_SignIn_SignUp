
import 'package:equatable/equatable.dart';

import '../../../domain/entities/user.dart';

class UserResponse extends Equatable{
  final String email;
  final String first_name;
  final String last_name;
  final String address;

  const UserResponse({
    required this.email,
    required this.address,
    required this.last_name,
    required this.first_name
  });

  @override
  List<Object> get props => [
    email,
    first_name,
    last_name,
    address
  ];

  User toEntity(){
    return User(
        email: email,
        first_name: first_name,
        last_name: last_name,
        address: address);
  }

  factory UserResponse.fromMap(Map<String, dynamic>map){
    return UserResponse(
        email: map['email'] ?? '',
        address: map['address'] ?? '',
        last_name: map['last_name'] ?? '',
        first_name: map['first_name']??''
    );
  }
}