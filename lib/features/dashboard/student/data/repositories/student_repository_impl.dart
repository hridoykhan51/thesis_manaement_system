import '../../domain/entities/student.dart';
import '../../domain/repositories/student_repository.dart';

class StudentRepositoryImpl implements StudentRepository {
  @override
  Future<Student> getStudentProfile(String studentId) async {
    await Future<void>.delayed(const Duration(milliseconds: 450));

    return Student(
      id: studentId,
      name: 'Hridoy Student',
      department: 'Computer Science and Engineering',
      supervisor: 'Souroav Sir',
      currentPhase: 'Prototype and performance evaluation',
      completionRate: 68,
      teamMembers: const [
        'Tauhid',
        'Mahi',
        'Sahansha',
      ],
      pendingTasks: const [
        'Upload chapter 3 draft',
        'Submit weekly progress report',
        'Review supervisor feedback',
      ],
    );
  }
}
