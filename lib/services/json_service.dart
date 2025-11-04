import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/program_model.dart';
import '../models/enrolled_program.dart';
import '../models/achievement.dart';

class JsonService {
  static const String _programsPath = 'assets/data/programs.json';
  static const String _usersPath = 'assets/data/users.json';
  static const String _milestonesPath = 'assets/data/milestones.json';

  // Load programs from JSON
  static Future<List<Program>> loadPrograms() async {
    try {
      final String jsonString = await rootBundle.loadString(_programsPath);
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> programsJson = jsonData['programs'] ?? [];
      
      return programsJson.map((json) => Program.fromJson(json)).toList();
    } catch (e) {
      throw JsonServiceException('Failed to load programs: $e');
    }
  }

  // Load users from JSON
  static Future<List<UserData>> loadUsers() async {
    try {
      final String jsonString = await rootBundle.loadString(_usersPath);
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> usersJson = jsonData['users'] ?? [];
      
      return usersJson.map((json) => UserData.fromJson(json)).toList();
    } catch (e) {
      throw JsonServiceException('Failed to load users: $e');
    }
  }

  // Load milestones from JSON
  static Future<Map<String, dynamic>> loadMilestones() async {
    try {
      final String jsonString = await rootBundle.loadString(_milestonesPath);
      return json.decode(jsonString);
    } catch (e) {
      throw JsonServiceException('Failed to load milestones: $e');
    }
  }

  // Find user by email
  static Future<UserData?> findUserByEmail(String email) async {
    try {
      final List<UserData> users = await loadUsers();
      return users.firstWhere(
        (user) => user.email.toLowerCase() == email.toLowerCase(),
        orElse: () => throw StateError('User not found'),
      );
    } catch (e) {
      return null;
    }
  }

  // Validate user credentials
  static Future<UserData?> validateUser(String email, String password) async {
    try {
      final UserData? user = await findUserByEmail(email);
      if (user != null && user.password == password) {
        return user;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // Get program by ID
  static Future<Program?> getProgramById(String programId) async {
    try {
      final List<Program> programs = await loadPrograms();
      return programs.firstWhere(
        (program) => program.id == programId,
        orElse: () => throw StateError('Program not found'),
      );
    } catch (e) {
      return null;
    }
  }

  // Search programs
  static Future<List<Program>> searchPrograms(String query) async {
    try {
      final List<Program> programs = await loadPrograms();
      if (query.isEmpty) return programs;
      
      return programs.where((program) {
        return program.title.toLowerCase().contains(query.toLowerCase()) ||
               program.description.toLowerCase().contains(query.toLowerCase()) ||
               program.skills.any((skill) => skill.toLowerCase().contains(query.toLowerCase()));
      }).toList();
    } catch (e) {
      throw JsonServiceException('Failed to search programs: $e');
    }
  }

  // Filter programs by difficulty
  static Future<List<Program>> filterProgramsByDifficulty(String difficulty) async {
    try {
      final List<Program> programs = await loadPrograms();
      if (difficulty.isEmpty) return programs;
      
      return programs.where((program) => program.difficulty.toLowerCase() == difficulty.toLowerCase()).toList();
    } catch (e) {
      throw JsonServiceException('Failed to filter programs: $e');
    }
  }
}

// User data model for JSON parsing
class UserData {
  final String id;
  final String name;
  final String email;
  final String password;
  final String registrationDate;
  final double overallProgress;
  final List<EnrolledProgram> enrolledPrograms;
  final List<Achievement> achievements;
  final Map<String, dynamic> preferences;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.registrationDate,
    required this.overallProgress,
    required this.enrolledPrograms,
    required this.achievements,
    required this.preferences,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      registrationDate: json['registrationDate'] ?? '',
      overallProgress: (json['overallProgress'] ?? 0.0).toDouble(),
      enrolledPrograms: (json['enrolledPrograms'] as List<dynamic>?)
          ?.map((program) => EnrolledProgram.fromJson(program))
          .toList() ?? [],
      achievements: (json['achievements'] as List<dynamic>?)
          ?.map((achievement) => Achievement.fromJson(achievement))
          .toList() ?? [],
      preferences: json['preferences'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'registrationDate': registrationDate,
      'overallProgress': overallProgress,
      'enrolledPrograms': enrolledPrograms.map((program) => program.toJson()).toList(),
      'achievements': achievements.map((achievement) => achievement.toJson()).toList(),
      'preferences': preferences,
    };
  }
}

// Custom exception for JSON service errors
class JsonServiceException implements Exception {
  final String message;
  JsonServiceException(this.message);

  @override
  String toString() => 'JsonServiceException: $message';
}
