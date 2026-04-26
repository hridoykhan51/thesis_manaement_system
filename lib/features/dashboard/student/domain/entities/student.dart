class Student {
  const Student({
    required this.id,
    required this.name,
    required this.department,
    required this.supervisor,
    required this.currentPhase,
    required this.completionRate,
    required this.teamMembers,
    required this.pendingTasks,
  });

  final String id;
  final String name;
  final String department;
  final String supervisor;
  final String currentPhase;
  final int completionRate;
  final List<String> teamMembers;
  final List<String> pendingTasks;
}
