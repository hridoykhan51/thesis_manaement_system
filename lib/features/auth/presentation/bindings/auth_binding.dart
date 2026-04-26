import 'package:get/get.dart';

import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../../domain/usecases/sign_out_usecase.dart';
import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<AuthRepository>()) {
      Get.lazyPut<AuthRepository>(AuthRepositoryImpl.new, fenix: true);
    }

    if (!Get.isRegistered<SignInUseCase>()) {
      Get.lazyPut<SignInUseCase>(
        () => SignInUseCase(Get.find<AuthRepository>()),
        fenix: true,
      );
    }

    if (!Get.isRegistered<SignOutUseCase>()) {
      Get.lazyPut<SignOutUseCase>(
        () => SignOutUseCase(Get.find<AuthRepository>()),
        fenix: true,
      );
    }

    if (!Get.isRegistered<AuthController>()) {
      Get.put<AuthController>(
        AuthController(
          signInUseCase: Get.find<SignInUseCase>(),
          signOutUseCase: Get.find<SignOutUseCase>(),
        ),
        permanent: true,
      );
    }
  }
}
