import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

class SignInParams {
  const SignInParams({
    required this.userId,
    required this.password,
  });

  final String userId;
  final String password;
}

class SignInUseCase {
  const SignInUseCase(this._repository);

  final AuthRepository _repository;

  Future<AppUser> call(SignInParams params) {
    return _repository.signIn(
      userId: params.userId,
      password: params.password,
    );
  }
}
