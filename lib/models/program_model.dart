class Program {
  final String id;
  final String title;
  final String description;
  final String duration;
  final String difficulty;
  final String color;
  final double progress;
  final bool enrolled;
  final bool bookmarked;
  final List<Module> modules;
  final List<String> milestones;
  final List<String> badges;
  final List<String> skills;

  Program({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.difficulty,
    required this.color,
    required this.progress,
    required this.enrolled,
    required this.bookmarked,
    required this.modules,
    required this.milestones,
    required this.badges,
    required this.skills,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      duration: json['duration'] ?? '',
      difficulty: json['difficulty'] ?? '',
      color: json['color'] ?? '#2196F3',
      progress: (json['progress'] ?? 0.0).toDouble(),
      enrolled: json['enrolled'] ?? false,
      bookmarked: json['bookmarked'] ?? false,
      modules: (json['modules'] as List<dynamic>?)
          ?.map((module) => Module.fromJson(module))
          .toList() ?? [],
      milestones: (json['milestones'] as List<dynamic>?)
          ?.map((milestone) => milestone.toString())
          .toList() ?? [],
      badges: (json['badges'] as List<dynamic>?)
          ?.map((badge) => badge.toString())
          .toList() ?? [],
      skills: (json['skills'] as List<dynamic>?)
          ?.map((skill) => skill.toString())
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'duration': duration,
      'difficulty': difficulty,
      'color': color,
      'progress': progress,
      'enrolled': enrolled,
      'bookmarked': bookmarked,
      'modules': modules.map((module) => module.toJson()).toList(),
      'milestones': milestones,
      'badges': badges,
      'skills': skills,
    };
  }

  Program copyWith({
    String? id,
    String? title,
    String? description,
    String? duration,
    String? difficulty,
    String? color,
    double? progress,
    bool? enrolled,
    bool? bookmarked,
    List<Module>? modules,
    List<String>? milestones,
    List<String>? badges,
    List<String>? skills,
  }) {
    return Program(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      difficulty: difficulty ?? this.difficulty,
      color: color ?? this.color,
      progress: progress ?? this.progress,
      enrolled: enrolled ?? this.enrolled,
      bookmarked: bookmarked ?? this.bookmarked,
      modules: modules ?? this.modules,
      milestones: milestones ?? this.milestones,
      badges: badges ?? this.badges,
      skills: skills ?? this.skills,
    );
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
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      duration: json['duration'] ?? '',
      completed: json['completed'] ?? false,
      skills: (json['skills'] as List<dynamic>?)
          ?.map((skill) => skill.toString())
          .toList() ?? [],
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

  Module copyWith({
    String? id,
    String? title,
    String? description,
    String? duration,
    bool? completed,
    List<String>? skills,
  }) {
    return Module(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      completed: completed ?? this.completed,
      skills: skills ?? this.skills,
    );
  }
}

