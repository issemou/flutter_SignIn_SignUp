import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repositories/userRepository.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';


final UserUseCaseProvider =Provider<UserUseCase>((ref)
=> UserUseCase(ref.read(UserRepositoryProvider)));

class UserUseCase {
  UserUseCase(this._repository);

  final UserRepository _repository;

  Future<User> Login(String eml, String pwd) {
    return _repository.getUser(email: eml , password: pwd);
  }
}