class Program {
  final String id;
  final String title;
  final String description;
  final String duration;
  final Instructor instructor;
  final List<Module> modules;
  final List<String> milestones;
  final List<String> badges;
  final String color;
  final String difficulty;
  final List<String> prerequisites;

  Program({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.instructor,
    required this.modules,
    required this.milestones,
    required this.badges,
    required this.color,
    required this.difficulty,
    required this.prerequisites,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      duration: json['duration'],
      instructor: Instructor.fromJson(json['instructor']),
      modules: (json['modules'] as List)
          .map((module) => Module.fromJson(module))
          .toList(),
      milestones: List<String>.from(json['milestones']),
      badges: List<String>.from(json['badges']),
      color: json['color'],
      difficulty: json['difficulty'],
      prerequisites: List<String>.from(json['prerequisites']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'duration': duration,
      'instructor': instructor.toJson(),
      'modules': modules.map((module) => module.toJson()).toList(),
      'milestones': milestones,
      'badges': badges,
      'color': color,
      'difficulty': difficulty,
      'prerequisites': prerequisites,
    };
  }
}

class Instructor {
  final String name;
  final String title;
  final String experience;

  Instructor({
    required this.name,
    required this.title,
    required this.experience,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      name: json['name'],
      title: json['title'],
      experience: json['experience'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'experience': experience,
    };
  }
}

class Module {
  final String id;
  final String title;
  final String description;
  final String duration;
  final bool completed;
  final List<String> skills;

  Module({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.completed,
    required this.skills,
  });

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      duration: json['duration'],
      completed: json['completed'],
      skills: List<String>.from(json['skills']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'duration': duration,
      'completed': completed,
      'skills': skills,
    };
  }
}

class EnrolledProgram {
  final String programId;
  final String enrollmentDate;
  final double progress;
  final String currentModule;
  final List<String> completedModules;
  final List<String> badgesEarned;

  EnrolledProgram({
    required this.programId,
    required this.enrollmentDate,
    required this.progress,
    required this.currentModule,
    required this.completedModules,
    required this.badgesEarned,
  });

  factory EnrolledProgram.fromJson(Map<String, dynamic> json) {
    return EnrolledProgram(
      programId: json['program_id'],
      enrollmentDate: json['enrollment_date'],
      progress: json['progress'].toDouble(),
      currentModule: json['current_module'],
      completedModules: List<String>.from(json['completed_modules']),
      badgesEarned: List<String>.from(json['badges_earned']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'program_id': programId,
      'enrollment_date': enrollmentDate,
      'progress': progress,
      'current_module': currentModule,
      'completed_modules': completedModules,
      'badges_earned': badgesEarned,
    };
  }
}

class FeedbackModel {
  final String id;
  final String userId;
  final String programId;
  final int rating;
  final String name;
  final String email;
  final String comments;
  final String submittedDate;
  final bool helpful;

  FeedbackModel({
    required this.id,
    required this.userId,
    required this.programId,
    required this.rating,
    required this.name,
    required this.email,
    required this.comments,
    required this.submittedDate,
    required this.helpful,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      id: json['id'],
      userId: json['user_id'],
      programId: json['program_id'],
      rating: json['rating'],
      name: json['name'],
      email: json['email'],
      comments: json['comments'],
      submittedDate: json['submitted_date'],
      helpful: json['helpful'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'program_id': programId,
      'rating': rating,
      'name': name,
      'email': email,
      'comments': comments,
      'submitted_date': submittedDate,
      'helpful': helpful,
    };
  }
}
