import 'package:flutter/foundation.dart';
import 'enrolled_program.dart';
import 'achievement.dart';

class UserModel extends ChangeNotifier {
  String _id = '';
  String _name = '';
  String _email = '';
  String _password = '';
  String _registrationDate = '';
  bool _isLoggedIn = false;
  double _overallProgress = 0.0;
  List<EnrolledProgram> _enrolledPrograms = [];
  List<Achievement> _achievements = [];
  Map<String, dynamic> _preferences = {};

  String get id => _id;
  String get name => _name;
  String get email => _email;
  String get password => _password;
  String get registrationDate => _registrationDate;
  bool get isLoggedIn => _isLoggedIn;
  double get overallProgress => _overallProgress;
  List<EnrolledProgram> get enrolledPrograms => _enrolledPrograms;
  List<Achievement> get achievements => _achievements;
  Map<String, dynamic> get preferences => _preferences;

  void login(String name, String email) {
    _name = name;
    _email = email;
    _isLoggedIn = true;
    _overallProgress = 0.75; // Demo progress
    _enrolledPrograms = [
      EnrolledProgram(
        programId: 'data_analytics',
        enrollmentDate: '2024-01-20',
        progress: 0.3,
        currentModule: 'python_analysis',
        completedModules: ['excel_fundamentals', 'sql_database'],
      ),
      EnrolledProgram(
        programId: 'ux_design',
        enrollmentDate: '2024-02-01',
        progress: 0.1,
        currentModule: 'user_research',
        completedModules: ['design_thinking'],
      ),
    ];
    notifyListeners();
  }

  void register(String id, String name, String email, String password) {
    _id = id;
    _name = name;
    _email = email;
    _password = password;
    _registrationDate = DateTime.now().toIso8601String().split('T')[0];
    _isLoggedIn = true;
    _overallProgress = 0.0;
    _enrolledPrograms = [];
    _achievements = [];
    _preferences = {
      'notifications': true,
      'darkMode': false,
      'emailUpdates': true,
    };
    notifyListeners();
  }

  void logout() {
    _id = '';
    _name = '';
    _email = '';
    _password = '';
    _registrationDate = '';
    _isLoggedIn = false;
    _overallProgress = 0.0;
    _enrolledPrograms = [];
    _achievements = [];
    _preferences = {};
    notifyListeners();
  }

  void updateProgress(double progress) {
    _overallProgress = progress;
    notifyListeners();
  }

  void addEnrolledProgram(EnrolledProgram program) {
    _enrolledPrograms.add(program);
    notifyListeners();
  }

  void addAchievement(Achievement achievement) {
    _achievements.add(achievement);
    notifyListeners();
  }

  void updatePreferences(String key, dynamic value) {
    _preferences[key] = value;
    notifyListeners();
  }
}

