import '../entities/app_user.dart';

abstract class AuthRepository {
  Future<AppUser> signIn({
    required String userId,
    required String password,
  });

  Future<void> signOut();
}
