import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  String _name = '';
  String _email = '';
  bool _isLoggedIn = false;
  double _overallProgress = 0.0;
  List<Map<String, dynamic>> _enrolledPrograms = [];

  String get name => _name;
  String get email => _email;
  bool get isLoggedIn => _isLoggedIn;
  double get overallProgress => _overallProgress;
  List<Map<String, dynamic>> get enrolledPrograms => _enrolledPrograms;

  void login(String name, String email) {
    _name = name;
    _email = email;
    _isLoggedIn = true;
    _overallProgress = 0.75; // Demo progress
    _enrolledPrograms = [
      {
        'id': 'data_analytics',
        'name': 'Data Analytics Pathway',
        'progress': 0.3,
        'description': 'Master data analysis skills',
      },
      {
        'id': 'ux_design',
        'name': 'UX Design Pathway',
        'progress': 0.1,
        'description': 'Learn user experience design',
      },
    ];
    notifyListeners();
  }

  void logout() {
    _name = '';
    _email = '';
    _isLoggedIn = false;
    _overallProgress = 0.0;
    _enrolledPrograms = [];
    notifyListeners();
  }
}

