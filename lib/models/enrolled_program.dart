class EnrolledProgram {
  final String programId;
  final String enrollmentDate;
  final double progress;
  final String currentModule;
  final List<String> completedModules;

  EnrolledProgram({
    required this.programId,
    required this.enrollmentDate,
    required this.progress,
    required this.currentModule,
    required this.completedModules,
  });

  factory EnrolledProgram.fromJson(Map<String, dynamic> json) {
    return EnrolledProgram(
      programId: json['programId'] ?? '',
      enrollmentDate: json['enrollmentDate'] ?? '',
      progress: (json['progress'] ?? 0.0).toDouble(),
      currentModule: json['currentModule'] ?? '',
      completedModules: (json['completedModules'] as List<dynamic>?)
          ?.map((module) => module.toString())
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'programId': programId,
      'enrollmentDate': enrollmentDate,
      'progress': progress,
      'currentModule': currentModule,
      'completedModules': completedModules,
    };
  }

  EnrolledProgram copyWith({
    String? programId,
    String? enrollmentDate,
    double? progress,
    String? currentModule,
    List<String>? completedModules,
  }) {
    return EnrolledProgram(
      programId: programId ?? this.programId,
      enrollmentDate: enrollmentDate ?? this.enrollmentDate,
      progress: progress ?? this.progress,
      currentModule: currentModule ?? this.currentModule,
      completedModules: completedModules ?? this.completedModules,
    );
  }
}
