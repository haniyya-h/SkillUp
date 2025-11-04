import 'json_service.dart';

class RegistrationService {

  // Register a new user
  Future<Map<String, dynamic>> register(
    String name,
    String email,
    String password,
  ) async {
    try {
      // Check if user already exists
      final existingUser = await JsonService.findUserByEmail(email);
      if (existingUser != null) {
        return {
          'success': false,
          'message': 'An account with this email already exists',
          'userId': null,
        };
      }

      // Validate input
      final validationResult = _validateRegistrationData(name, email, password);
      if (!validationResult['valid']) {
        return {
          'success': false,
          'message': validationResult['message'],
          'userId': null,
        };
      }

      // Generate user ID
      final userId = 'user_${DateTime.now().millisecondsSinceEpoch}';

      // Create new user data
      final newUser = {
        'id': userId,
        'name': name,
        'email': email,
        'password': password,
        'registrationDate': DateTime.now().toIso8601String().split('T')[0],
        'overallProgress': 0.0,
        'enrolledPrograms': [],
        'achievements': [],
        'preferences': {
          'notifications': true,
          'darkMode': false,
          'emailUpdates': true,
        },
      };

      // In a real app, this would save to a backend API
      // For now, we'll simulate success
      await _simulateApiCall();

      return {
        'success': true,
        'message': 'Account created successfully',
        'userId': userId,
        'userData': newUser,
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Registration failed: ${e.toString()}',
        'userId': null,
      };
    }
  }

  // Validate registration data
  Map<String, dynamic> _validateRegistrationData(
    String name,
    String email,
    String password,
  ) {
    // Name validation
    if (name.isEmpty) {
      return {
        'valid': false,
        'message': 'Name is required',
      };
    }
    if (name.length < 3) {
      return {
        'valid': false,
        'message': 'Name must be at least 3 characters',
      };
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)) {
      return {
        'valid': false,
        'message': 'Name can only contain letters and spaces',
      };
    }

    // Email validation
    if (email.isEmpty) {
      return {
        'valid': false,
        'message': 'Email is required',
      };
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return {
        'valid': false,
        'message': 'Please enter a valid email address',
      };
    }

    // Password validation
    if (password.isEmpty) {
      return {
        'valid': false,
        'message': 'Password is required',
      };
    }
    if (password.length < 8) {
      return {
        'valid': false,
        'message': 'Password must be at least 8 characters',
      };
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return {
        'valid': false,
        'message': 'Password must contain at least one lowercase letter',
      };
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return {
        'valid': false,
        'message': 'Password must contain at least one uppercase letter',
      };
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return {
        'valid': false,
        'message': 'Password must contain at least one number',
      };
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>_+\-=\[\]\\;]').hasMatch(password)) {
      return {
        'valid': false,
        'message': 'Password must contain at least one special character',
      };
    }

    return {
      'valid': true,
      'message': 'Valid data',
    };
  }

  // Simulate API call delay
  Future<void> _simulateApiCall() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  // Check if email is available
  Future<bool> isEmailAvailable(String email) async {
    try {
      final existingUser = await JsonService.findUserByEmail(email);
      return existingUser == null;
    } catch (e) {
      return false;
    }
  }

  // Get registration requirements
  Map<String, dynamic> getRegistrationRequirements() {
    return {
      'name': {
        'minLength': 3,
        'maxLength': 50,
        'pattern': r'^[a-zA-Z\s]+$',
        'message': 'Name can only contain letters and spaces',
      },
      'email': {
        'pattern': r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
        'message': 'Please enter a valid email address',
      },
      'password': {
        'minLength': 8,
        'requirements': [
          'At least 8 characters',
          'One uppercase letter',
          'One lowercase letter',
          'One number',
          'One special character',
        ],
        'pattern': r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>_+\-=\[\]\\;])',
      },
    };
  }

  // Get password strength
  Map<String, dynamic> getPasswordStrength(String password) {
    if (password.isEmpty) {
      return {
        'strength': 'Empty',
        'score': 0,
        'color': 'grey',
        'message': 'Enter a password',
      };
    }

    int score = 0;
    List<String> requirements = [];

    if (password.length >= 8) {
      score++;
      requirements.add('✓ At least 8 characters');
    } else {
      requirements.add('✗ At least 8 characters');
    }

    if (RegExp(r'[a-z]').hasMatch(password)) {
      score++;
      requirements.add('✓ Lowercase letter');
    } else {
      requirements.add('✗ Lowercase letter');
    }

    if (RegExp(r'[A-Z]').hasMatch(password)) {
      score++;
      requirements.add('✓ Uppercase letter');
    } else {
      requirements.add('✗ Uppercase letter');
    }

    if (RegExp(r'[0-9]').hasMatch(password)) {
      score++;
      requirements.add('✓ Number');
    } else {
      requirements.add('✗ Number');
    }

    if (RegExp(r'[!@#$%^&*(),.?":{}|<>_+\-=\[\]\\;]').hasMatch(password)) {
      score++;
      requirements.add('✓ Special character');
    } else {
      requirements.add('✗ Special character');
    }

    String strength;
    String color;
    String message;

    if (score < 2) {
      strength = 'Weak';
      color = 'red';
      message = 'Password is too weak';
    } else if (score < 4) {
      strength = 'Medium';
      color = 'orange';
      message = 'Password is moderately strong';
    } else {
      strength = 'Strong';
      color = 'green';
      message = 'Password is strong';
    }

    return {
      'strength': strength,
      'score': score,
      'color': color,
      'message': message,
      'requirements': requirements,
    };
  }
}
