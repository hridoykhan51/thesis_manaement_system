import '../../domain/entities/app_user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<AppUser> signIn({
    required String userId,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    final normalizedId = userId.trim();
    final normalizedPassword = password.trim();

    if (normalizedId.isEmpty || normalizedPassword.isEmpty) {
      throw Exception('User ID and password are required.');
    }

    return AppUser(
      id: normalizedId,
      name: 'Student $normalizedId',
      email: '$normalizedId@university.edu',
      role: 'student',
    );
  }

  @override
  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 150));
  }
}
