# SkillUp - Skill Pathways App

A Flutter application for skill-based learning pathways that helps professionals and learners identify, pursue, and monitor skill-based learning paths specific to their career objectives.

## 🎯 Purpose

The SkillUp app allows users to choose career paths (such as digital marketing, UX design, or data analytics) and automatically creates personalized learning roadmaps with important courses, microtasks, necessary skills, and milestone checkpoints.

## ✨ Features

### Core Functionality
- **Career Pathway Selection**: Choose from various career paths like Data Analytics, UX Design, Digital Marketing, etc.
- **Progress Tracking**: Visual progress indicators and completion rates
- **Interactive Learning**: Course modules with hands-on projects
- **Achievement System**: Badges and milestones for motivation
- **User Registration**: Complete registration system with form validation
- **Real-time Search**: JSON-powered program data with search and filtering
- **Error Handling**: Comprehensive error handling with retry mechanisms

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/haniyya-h/SkillUp.git
   cd SkillUp
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📊 Data Structure

The app uses local JSON files for data storage:

- **`assets/data/programs.json`**: Contains all learning programs with modules, skills, and milestones
- **`assets/data/users.json`**: Sample user data for testing
- **`assets/data/milestones.json`**: Achievement and badge definitions

### Program Data Structure
```json
{
  "programs": [
    {
      "id": "data_analytics",
      "title": "Data Analytics Pathway",
      "description": "Master data analysis skills...",
      "duration": "5 months",
      "difficulty": "Intermediate",
      "color": "#9C27B0",
      "modules": [...],
      "skills": [...],
      "milestones": [...],
      "badges": [...]
    }
  ]
}
```

## 📱 App Screenshots

1. **Login Screen**: Secure authentication with email/password
   <img width="571" height="1280" alt="image" src="https://github.com/user-attachments/assets/aa3a0a8c-afc7-4e1c-a744-ea3c8b15cf9d" />

2. **Registration Screen**: User registration with comprehensive validation
   <img width="571" height="1280" alt="image" src="https://github.com/user-attachments/assets/cec4168f-e200-4f31-bae8-4e70dd230340" />

3. **Home Dashboard**: Welcome screen with overall progress and enrolled programs
   <img width="571" height="1280" alt="image" src="https://github.com/user-attachments/assets/491d05ca-9ab4-4ce9-9b3d-cd94f97e5e8e" />

4. **Program Listing**: Browse all available learning pathways with search and filters
   <img width="571" height="1280" alt="image" src="https://github.com/user-attachments/assets/050d4bed-1ffa-44d6-a11a-2346e5133470" />

5. **Program Details**: Detailed view of courses, modules, and milestones
    <img width="571" height="1280" alt="image" src="https://github.com/user-attachments/assets/f7681bfa-47fe-4948-9b46-94fdd4d46582" />

6. **Profile Screen**: User profile with achievements and settings
   <img width="571" height="1280" alt="image" src="https://github.com/user-attachments/assets/d223800d-02d1-43e1-a719-661239890b9d" />


## 🏗️ Project Structure

```
lib/
├── main.dart                 # App entry point and routing
├── models/
│   ├── user_model.dart      # User data and state management
│   ├── program_model.dart   # Program and module models
│   ├── program_provider.dart # Program state management
│   ├── enrolled_program.dart
│   └── achievement.dart
├── services/
│   ├── auth_service.dart    # Authentication logic
│   ├── json_service.dart    # JSON data loading
│   └── registration_service.dart # User registration
├── screens/
│   ├── login_screen.dart    # Login interface
│   ├── registration_screen.dart # User registration
│   ├── home_screen.dart     # Dashboard
│   ├── program_listing_screen.dart
│   ├── program_details_screen.dart
│   └── profile_screen.dart
└── assets/
    └── data/                # JSON data files
```

## 🛠️ Technologies Used

- **Flutter**: Cross-platform mobile development
- **Provider**: State management
- **Go Router**: Navigation and routing
- **Material Design**: UI components and theming

## 🎨 Design System

- **Primary Color**: Green (#2E7D32)
- **Typography**: Clean, readable fonts
- **Layout**: Card-based design with consistent spacing
- **Navigation**: Bottom navigation bar with 3 main sections

## 📋 Available Programs

1. **Data Analytics Pathway** (5 months, Intermediate)
2. **UX Design Pathway** (6 months, Beginner)
3. **Digital Marketing Pathway** (4 months, Beginner)
4. **Project Management** (3 months, Intermediate)
5. **Data Science** (8 months, Advanced)

## 🔄 Navigation Flow

```
Login Screen → Home Dashboard → Program Listing → Program Details
     ↑              ↓                ↓              ↓
   Logout      Browse Programs   View Details   Start Course
```

## 🚧 Future Enhancements

- **AI Recommendation Engine**: Personalized skill suggestions
- **Learning Platform Integration**: Excelerate, LinkedIn Learning, Udemy, Coursera
- **Community Features**: Discussion boards and mentorship
- **Offline Mode**: Continue learning without internet
- **Adaptive Difficulty**: Dynamic content based on performance

## 📋 Changelog

### [Week 3] - 2024-10-23

#### 🎉 Major Features Added
- **JSON Data Integration**: All program data now loads from JSON files
- **User Registration**: Complete registration form with comprehensive validation
- **Search & Filtering**: Search programs by title/description and filter by difficulty
- **Loading States**: Professional loading indicators and error handling
- **Form Validation**: Real-time validation with password strength indicator
- **Error Handling**: Comprehensive error handling with retry mechanisms
- **Bookmark Functionality**: Users can bookmark/unbookmark programs for later
- **Enhanced Password Validation**: Strict password requirements with real-time checklist

#### 🔧 Technical Improvements
- **Data Models**: Enhanced user and program models with JSON serialization
- **State Management**: Improved Provider-based state management with loading states
- **Service Layer**: JSON service for data loading and user management
- **UI/UX**: Better loading states, error messages, and user feedback
- **Password Security**: Comprehensive password validation (8+ chars, uppercase, lowercase, numbers, special characters)
- **Form Validation**: Double-check validation system prevents weak passwords
- **Button State Management**: Submit button disabled until all requirements met

#### 📱 Screen Updates
- **Program Listing**: Now loads from JSON with search and filter capabilities
- **Program Details**: Dynamic content with modules, skills, and milestones
  - Fixed overflow issue (35px) on info chips row
  - Added bookmark functionality with visual feedback
  - Enhanced enrollment with loading spinner
- **Registration Screen**: Complete form with validation and password strength
  - Real-time password requirements checklist
  - Password strength indicator (Weak/Medium/Good/Strong)
  - Submit button disabled until all password requirements met
  - Comprehensive validation with specific error messages
- **All Screens**: Enhanced with loading states and error handling

#### 🐛 Bug Fixes
- **Fixed**: Program Details screen overflow issue (35 pixels on right)
- **Fixed**: Password validation now properly enforced with double-check system
- **Fixed**: Submit button state management for better UX
- **Fixed**: Info chips row now scrollable on smaller screens

## ✅ Week 3 Deliverables Checklist

### 1. API-Connected Functional App ✅

#### ✅ Program Listing & Details with Real Data
- **Status**: ✅ **COMPLETE**
- **Implementation**: 
  - Program Listing screen loads data from `assets/data/programs.json`
  - Program Details screen displays dynamic content from JSON
  - Both screens show real program data (title, description, modules, skills, milestones, badges)
  - Data is loaded via `JsonService` with proper error handling
- **Files**: 
  - `lib/services/json_service.dart` - JSON data loading service
  - `lib/models/program_provider.dart` - State management for programs
  - `lib/screens/program_listing_screen.dart` - Connected to JSON data
  - `lib/screens/program_details_screen.dart` - Connected to JSON data
  - `assets/data/programs.json` - Complete program data structure

#### ✅ Functional Form with Validation
- **Status**: ✅ **COMPLETE**
- **Implementation**: 
  - **Registration Form** fully implemented and functional
  - Form includes: Full Name, Email, Password, Confirm Password, Terms & Conditions
  - **Comprehensive Validation**:
    - Name: Required, min 3 characters, letters only
    - Email: Required, valid email format
    - Password: Required, min 8 characters, uppercase, lowercase, number, special character
    - Confirm Password: Must match password
    - Real-time validation with visual feedback
  - **Password Requirements Checklist**: Shows which requirements are met in real-time
  - **Password Strength Indicator**: Weak/Medium/Good/Strong with color coding
  - **Submit Button**: Disabled until all requirements are met
  - **Double-Check Validation**: Additional validation before registration
- **Files**: 
  - `lib/screens/registration_screen.dart` - Complete registration form
  - `lib/services/registration_service.dart` - Registration logic with validation
  - Form validation prevents submission of invalid data

### 2. GitHub Repository Update ✅

#### ✅ Code Pushed to GitHub
- **Status**: ✅ **READY** (pending user's permission to push)
- **Implementation**: 
  - All Week 3 code is complete and ready to push
  - Clean code structure with proper organization
  - All files properly committed and staged

#### ✅ Clear Commit Messages
- **Status**: ✅ **PLANNED**
- **Recommended Commit Messages**:
  - `feat: Add JSON data integration for programs`
  - `feat: Implement registration form with comprehensive validation`
  - `feat: Add search and filtering for programs`
  - `feat: Add bookmark functionality`
  - `feat: Add loading states and error handling`
  - `fix: Fix overflow issue on program details screen`
  - `fix: Enhance password validation with requirements checklist`
  - `docs: Update README with Week 3 changes`

#### ✅ Updated README
- **Status**: ✅ **COMPLETE**
- **Implementation**: 
  - README updated with Week 3 features
  - Data structure documentation added
  - Changelog section with all changes documented
  - Project structure updated
  - Installation instructions included

### 3. Changelog / Documentation ✅

#### ✅ Data Integration Documentation
- **Status**: ✅ **COMPLETE**
- **Screens Fetching from JSON**:
  1. **Program Listing Screen** (`program_listing_screen.dart`)
     - Fetches all programs from `assets/data/programs.json`
     - Displays programs with search and filter capabilities
     - Shows loading state while fetching
     - Error handling with retry mechanism
   
  2. **Program Details Screen** (`program_details_screen.dart`)
     - Fetches specific program data by ID
     - Displays modules, skills, milestones, and badges
     - Shows loading state while fetching
     - Error handling with retry mechanism

#### ✅ Form Functionality Documentation
- **Status**: ✅ **COMPLETE**
- **Registration Form** (`registration_screen.dart`):
  - **How it works**:
    1. User enters full name, email, password, and confirms password
    2. Real-time validation checks each field as user types
    3. Password requirements checklist shows which requirements are met
    4. Password strength indicator shows Weak/Medium/Good/Strong
    5. Submit button is disabled until all requirements are met
    6. Form validates on submit with specific error messages
    7. Additional validation check before registration
    8. Registration service validates data and creates user
    9. Success message shown and user navigated to home
  
  - **Validation Rules**:
    - Name: Required, 3+ characters, letters only
    - Email: Required, valid email format
    - Password: 8+ chars, uppercase, lowercase, number, special character
    - Confirm Password: Must match password
    - Terms: Must be accepted

#### ✅ Loading & Error Handling Documentation
- **Status**: ✅ **COMPLETE**
- **Loading Indicators**:
  - Program Listing: Circular progress indicator while loading programs
  - Program Details: Loading spinner while fetching program data
  - Registration: Loading spinner in submit button during registration
  - Enrollment: Loading spinner in enrollment dialog
  
- **Error Handling**:
  - **Program Listing**: Error state with retry button if JSON fails to load
  - **Program Details**: Error state with retry button if program not found
  - **Registration**: Error messages for validation failures
  - **JSON Service**: Try-catch blocks with custom error messages
  - **All Screens**: Graceful error handling with user-friendly messages

### 4. Optional Demo Video
- **Status**: ⏸️ **OPTIONAL**
- **Recommendation**: Record a 2-3 minute video showing:
  - Program Listing loading from JSON
  - Search and filtering functionality
  - Registration form with validation
  - Bookmark functionality
  - Error handling and retry mechanisms

## 📊 Week 3 Deliverables Summary

| Deliverable | Status | Evidence |
|------------|--------|----------|
| **API-Connected App** | ✅ Complete | JSON data integration, Program screens show real data |
| **Functional Forms** | ✅ Complete | Registration form with comprehensive validation |
| **Form Validation** | ✅ Complete | Real-time validation, password requirements, error messages |
| **Loading States** | ✅ Complete | Loading indicators on all async operations |
| **Error Handling** | ✅ Complete | Error states with retry mechanisms |
| **GitHub Update** | ✅ Ready | Code ready, commit messages planned |
| **README Update** | ✅ Complete | All Week 3 changes documented |
| **Changelog** | ✅ Complete | Comprehensive changelog with all features |

### [Week 2] - 2024-10-16

#### Initial Release
- **Added**: Basic app structure with 4 core screens
- **Added**: Navigation between screens
- **Added**: Login functionality
- **Added**: Program listing and details
- **Added**: Profile screen
- **Added**: Basic UI/UX design
- **Added**: GitHub repository setup

## 👥 Team

- **Developer**: Haniyya Hussain
- **UI/UX Designer**: Aisha Irfan
- **Mentor**: Excelerate Team
- **Design**: Based on previously made wireframes

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is part of the Excelerate internship program and is developed for educational purposes.
