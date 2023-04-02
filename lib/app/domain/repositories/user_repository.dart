import '../entities/user.dart';

abstract class UserRepository {
  Future<User> getUser({required String email, required String password});
}