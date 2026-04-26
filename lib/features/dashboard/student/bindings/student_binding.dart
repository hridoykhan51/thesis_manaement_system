import 'package:get/get.dart';

import '../controllers/student_controller.dart';
import '../data/repositories/student_repository_impl.dart';
import '../domain/repositories/student_repository.dart';
import '../domain/usecases/get_student_profile_usecase.dart';

class StudentBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<StudentRepository>()) {
      Get.lazyPut<StudentRepository>(StudentRepositoryImpl.new, fenix: true);
    }

    if (!Get.isRegistered<GetStudentProfileUseCase>()) {
      Get.lazyPut<GetStudentProfileUseCase>(
        () => GetStudentProfileUseCase(Get.find<StudentRepository>()),
        fenix: true,
      );
    }

    if (!Get.isRegistered<StudentController>()) {
      Get.lazyPut<StudentController>(
        () => StudentController(
          getStudentProfileUseCase: Get.find<GetStudentProfileUseCase>(),
        ),
      );
    }
  }
}
