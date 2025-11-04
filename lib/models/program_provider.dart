import 'package:flutter/foundation.dart';
import 'program_model.dart';
import '../services/json_service.dart';

enum LoadingState { idle, loading, success, error }

class ProgramProvider extends ChangeNotifier {
  List<Program> _programs = [];
  List<Program> _filteredPrograms = [];
  LoadingState _loadingState = LoadingState.idle;
  String _errorMessage = '';
  String _searchQuery = '';
  String _selectedDifficulty = '';

  // Getters
  List<Program> get programs => _programs;
  List<Program> get filteredPrograms => _filteredPrograms;
  LoadingState get loadingState => _loadingState;
  String get errorMessage => _errorMessage;
  String get searchQuery => _searchQuery;
  String get selectedDifficulty => _selectedDifficulty;

  // Check if data is loading
  bool get isLoading => _loadingState == LoadingState.loading;
  bool get hasError => _loadingState == LoadingState.error;
  bool get hasData => _loadingState == LoadingState.success && _programs.isNotEmpty;

  // Load programs from JSON
  Future<void> loadPrograms() async {
    _setLoadingState(LoadingState.loading);
    _errorMessage = '';

    try {
      final List<Program> loadedPrograms = await JsonService.loadPrograms();
      _programs = loadedPrograms;
      _filteredPrograms = loadedPrograms;
      _setLoadingState(LoadingState.success);
    } catch (e) {
      _errorMessage = 'Failed to load programs: ${e.toString()}';
      _setLoadingState(LoadingState.error);
    }
  }

  // Search programs
  Future<void> searchPrograms(String query) async {
    _searchQuery = query;
    
    if (query.isEmpty) {
      _filteredPrograms = _programs;
    } else {
      try {
        _filteredPrograms = await JsonService.searchPrograms(query);
      } catch (e) {
        _errorMessage = 'Search failed: ${e.toString()}';
        _setLoadingState(LoadingState.error);
        return;
      }
    }
    
    notifyListeners();
  }

  // Filter programs by difficulty
  Future<void> filterByDifficulty(String difficulty) async {
    _selectedDifficulty = difficulty;
    
    try {
      if (difficulty.isEmpty) {
        _filteredPrograms = _programs;
      } else {
        _filteredPrograms = await JsonService.filterProgramsByDifficulty(difficulty);
      }
    } catch (e) {
      _errorMessage = 'Filter failed: ${e.toString()}';
      _setLoadingState(LoadingState.error);
      return;
    }
    
    notifyListeners();
  }

  // Get program by ID
  Program? getProgramById(String programId) {
    try {
      return _programs.firstWhere((program) => program.id == programId);
    } catch (e) {
      return null;
    }
  }

  // Clear search and filters
  void clearFilters() {
    _searchQuery = '';
    _selectedDifficulty = '';
    _filteredPrograms = _programs;
    notifyListeners();
  }

  // Retry loading
  Future<void> retry() async {
    await loadPrograms();
  }

  // Get available difficulties
  List<String> get availableDifficulties {
    final Set<String> difficulties = _programs.map((program) => program.difficulty).toSet();
    return ['All', ...difficulties.toList()];
  }

  // Get programs by category (for future use)
  List<Program> getProgramsByCategory(String category) {
    return _programs.where((program) {
      // This can be extended based on your category logic
      return program.skills.any((skill) => skill.toLowerCase().contains(category.toLowerCase()));
    }).toList();
  }

  // Get featured programs (for home screen)
  List<Program> get featuredPrograms {
    // Return first 3 programs as featured
    return _programs.take(3).toList();
  }

  // Get enrolled programs (for user)
  List<Program> getEnrolledPrograms(List<String> enrolledProgramIds) {
    return _programs.where((program) => enrolledProgramIds.contains(program.id)).toList();
  }

  // Enroll in program
  void enrollInProgram(String programId) {
    final programIndex = _programs.indexWhere((program) => program.id == programId);
    if (programIndex != -1) {
      _programs[programIndex] = _programs[programIndex].copyWith(enrolled: true);
      _updateFilteredPrograms();
      notifyListeners();
    }
  }

  // Unenroll from program
  void unenrollFromProgram(String programId) {
    final programIndex = _programs.indexWhere((program) => program.id == programId);
    if (programIndex != -1) {
      _programs[programIndex] = _programs[programIndex].copyWith(enrolled: false);
      _updateFilteredPrograms();
      notifyListeners();
    }
  }

  // Update program progress
  void updateProgramProgress(String programId, double progress) {
    final programIndex = _programs.indexWhere((program) => program.id == programId);
    if (programIndex != -1) {
      _programs[programIndex] = _programs[programIndex].copyWith(progress: progress);
      _updateFilteredPrograms();
      notifyListeners();
    }
  }

  // Bookmark a program
  void bookmarkProgram(String programId) {
    final programIndex = _programs.indexWhere((program) => program.id == programId);
    if (programIndex != -1) {
      _programs[programIndex] = _programs[programIndex].copyWith(bookmarked: true);
      _updateFilteredPrograms();
      notifyListeners();
    }
  }

  // Unbookmark a program
  void unbookmarkProgram(String programId) {
    final programIndex = _programs.indexWhere((program) => program.id == programId);
    if (programIndex != -1) {
      _programs[programIndex] = _programs[programIndex].copyWith(bookmarked: false);
      _updateFilteredPrograms();
      notifyListeners();
    }
  }

  // Toggle bookmark
  void toggleBookmark(String programId) {
    final programIndex = _programs.indexWhere((program) => program.id == programId);
    if (programIndex != -1) {
      final isBookmarked = _programs[programIndex].bookmarked;
      _programs[programIndex] = _programs[programIndex].copyWith(bookmarked: !isBookmarked);
      _updateFilteredPrograms();
      notifyListeners();
    }
  }

  // Get bookmarked programs
  List<Program> get bookmarkedPrograms {
    return _programs.where((program) => program.bookmarked).toList();
  }

  // Private helper methods
  void _setLoadingState(LoadingState state) {
    _loadingState = state;
    notifyListeners();
  }

  void _updateFilteredPrograms() {
    if (_searchQuery.isNotEmpty) {
      searchPrograms(_searchQuery);
    } else if (_selectedDifficulty.isNotEmpty) {
      filterByDifficulty(_selectedDifficulty);
    } else {
      _filteredPrograms = _programs;
    }
  }
}
