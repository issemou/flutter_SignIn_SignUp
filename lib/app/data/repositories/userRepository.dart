import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../api/remote.dart';
import '../models/request/userRequest.dart';

final UserRepositoryProvider = Provider<UserRepository>((ref)=> UserRepositoryImpl(ref.read(remoteApiProvider)));

class UserRepositoryImpl extends UserRepository {
  final RemoteApi _remoteApi;

  UserRepositoryImpl(this._remoteApi);

  @override
  Future<User> getUser({required String email, required String password}) {
    return _remoteApi
        .getUser(UserRequest(email: email,password: password))
        .then((value) => value.toEntity());
  }
}
