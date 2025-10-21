import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/program_model.dart';

class ProgramService {
  static final ProgramService _instance = ProgramService._internal();
  factory ProgramService() => _instance;
  ProgramService._internal();

  List<Program>? _programs;
  List<EnrolledProgram>? _userPrograms;
  List<FeedbackModel>? _feedback;

  // Load all programs from JSON
  Future<List<Program>> getAllPrograms() async {
    if (_programs != null) return _programs!;

    try {
      final String jsonString = await rootBundle.loadString('assets/data/programs.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      
      _programs = (jsonData['programs'] as List)
          .map((program) => Program.fromJson(program))
          .toList();
      
      return _programs!;
    } catch (e) {
      throw Exception('Failed to load programs: $e');
    }
  }

  // Get a specific program by ID
  Future<Program?> getProgramById(String programId) async {
    final programs = await getAllPrograms();
    try {
      return programs.firstWhere((program) => program.id == programId);
    } catch (e) {
      return null;
    }
  }

  // Load user's enrolled programs
  Future<List<EnrolledProgram>> getUserPrograms() async {
    if (_userPrograms != null) return _userPrograms!;

    try {
      final String jsonString = await rootBundle.loadString('assets/data/user_data.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      
      final user = jsonData['users'][0]; // Get first user for demo
      _userPrograms = (user['enrolled_programs'] as List)
          .map((program) => EnrolledProgram.fromJson(program))
          .toList();
      
      return _userPrograms!;
    } catch (e) {
      throw Exception('Failed to load user programs: $e');
    }
  }

  // Get user's enrolled programs with full program details
  Future<List<Program>> getEnrolledProgramsWithDetails() async {
    final enrolledPrograms = await getUserPrograms();
    final allPrograms = await getAllPrograms();
    
    List<Program> enrolledProgramDetails = [];
    
    for (final enrolledProgram in enrolledPrograms) {
      final program = allPrograms.firstWhere(
        (p) => p.id == enrolledProgram.programId,
        orElse: () => throw Exception('Program not found: ${enrolledProgram.programId}'),
      );
      enrolledProgramDetails.add(program);
    }
    
    return enrolledProgramDetails;
  }

  // Load feedback data
  Future<List<FeedbackModel>> getAllFeedback() async {
    if (_feedback != null) return _feedback!;

    try {
      final String jsonString = await rootBundle.loadString('assets/data/user_data.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      
      _feedback = (jsonData['feedback'] as List)
          .map((feedback) => FeedbackModel.fromJson(feedback))
          .toList();
      
      return _feedback!;
    } catch (e) {
      throw Exception('Failed to load feedback: $e');
    }
  }

  // Submit new feedback
  Future<void> submitFeedback(FeedbackModel feedback) async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/user_data.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      
      // Add new feedback to the list
      jsonData['feedback'].add(feedback.toJson());
      
      // In a real app, this would be sent to a server
      // For now, we'll just update our local cache
      _feedback = (jsonData['feedback'] as List)
          .map((feedback) => FeedbackModel.fromJson(feedback))
          .toList();
    } catch (e) {
      throw Exception('Failed to submit feedback: $e');
    }
  }

  // Search programs by title or description
  Future<List<Program>> searchPrograms(String query) async {
    final programs = await getAllPrograms();
    final lowercaseQuery = query.toLowerCase();
    
    return programs.where((program) {
      return program.title.toLowerCase().contains(lowercaseQuery) ||
             program.description.toLowerCase().contains(lowercaseQuery) ||
             program.difficulty.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }

  // Get programs by difficulty level
  Future<List<Program>> getProgramsByDifficulty(String difficulty) async {
    final programs = await getAllPrograms();
    return programs.where((program) => program.difficulty.toLowerCase() == difficulty.toLowerCase()).toList();
  }

  // Clear cache (useful for testing or refreshing data)
  void clearCache() {
    _programs = null;
    _userPrograms = null;
    _feedback = null;
  }
}
