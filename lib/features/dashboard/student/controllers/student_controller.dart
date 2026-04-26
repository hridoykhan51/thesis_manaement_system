import 'package:get/get.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../domain/entities/student.dart';
import '../domain/usecases/get_student_profile_usecase.dart';

class StudentController extends GetxController {
  StudentController({
    required GetStudentProfileUseCase getStudentProfileUseCase,
  }) : _getStudentProfileUseCase = getStudentProfileUseCase;

  final GetStudentProfileUseCase _getStudentProfileUseCase;

  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final student = Rxn<Student>();

  @override
  void onReady() {
    super.onReady();
    loadCurrentStudent();
  }

  Future<void> loadCurrentStudent() async {
    final authController = Get.find<AuthController>();
    final appUser = authController.currentUser.value;

    if (appUser == null) {
      Get.offAllNamed(AppRoutes.auth);
      return;
    }

    await loadStudentProfile(appUser.id);
  }

  Future<void> loadStudentProfile(String studentId) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      student.value = await _getStudentProfileUseCase(studentId);
    } catch (error) {
      errorMessage.value = error.toString().replaceFirst('Exception: ', '');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    await Get.find<AuthController>().signOut();
  }
}
