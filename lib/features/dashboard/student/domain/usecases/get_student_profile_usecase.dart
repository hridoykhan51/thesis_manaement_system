import '../entities/student.dart';
import '../repositories/student_repository.dart';

class GetStudentProfileUseCase {
  const GetStudentProfileUseCase(this._repository);

  final StudentRepository _repository;

  Future<Student> call(String studentId) {
    return _repository.getStudentProfile(studentId);
  }
}
