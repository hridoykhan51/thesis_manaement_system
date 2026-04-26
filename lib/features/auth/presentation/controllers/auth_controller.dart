import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/routes/app_routes.dart';
import '../../domain/entities/app_user.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../../domain/usecases/sign_out_usecase.dart';

class AuthController extends GetxController {
  AuthController({
    required SignInUseCase signInUseCase,
    required SignOutUseCase signOutUseCase,
  })  : _signInUseCase = signInUseCase,
        _signOutUseCase = signOutUseCase;

  final SignInUseCase _signInUseCase;
  final SignOutUseCase _signOutUseCase;

  final userIdController = TextEditingController(text: 'ST-2026-001');
  final passwordController = TextEditingController(text: 'password123');
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final currentUser = Rxn<AppUser>();

  Future<void> signIn() async {
    if (isLoading.value) {
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final user = await _signInUseCase(
        SignInParams(
          userId: userIdController.text,
          password: passwordController.text,
        ),
      );

      currentUser.value = user;
      Get.offAllNamed(AppRoutes.studentDashboard);
    } catch (error) {
      errorMessage.value = error.toString().replaceFirst('Exception: ', '');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut({bool navigateToAuth = true}) async {
    await _signOutUseCase();
    currentUser.value = null;

    if (navigateToAuth) {
      Get.offAllNamed(AppRoutes.landing);
    }
  }

  @override
  void onClose() {
    userIdController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
