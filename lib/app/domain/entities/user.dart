import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String email;
  final String first_name;
  final String last_name;
  final String address;

  const User({
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.address
  });

  @override
  List<Object> get props => [
    email,
    first_name,
    last_name,
    address
  ];

}