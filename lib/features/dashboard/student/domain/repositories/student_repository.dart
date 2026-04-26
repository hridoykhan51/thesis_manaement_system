import '../entities/student.dart';

abstract class StudentRepository {
  Future<Student> getStudentProfile(String studentId);
}
