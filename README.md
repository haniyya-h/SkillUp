# SkillUp - Skill Pathways App

A Flutter application for skill-based learning pathways that helps professionals and learners identify, pursue, and monitor skill-based learning paths specific to their career objectives.

## 🎯 Purpose

The SkillUp app allows users to choose career paths (such as digital marketing, UX design, or data analytics) and automatically creates personalized learning roadmaps with important courses, microtasks, necessary skills, and milestone checkpoints.

## ✨ Features

- **Career Pathway Selection**: Choose from various career paths like Data Analytics, UX Design, Digital Marketing, etc.
- **Progress Tracking**: Visual progress indicators and completion rates
- **Interactive Learning**: Course modules with hands-on projects
- **Achievement System**: Badges and milestones for motivation
- **User Registration**: Complete registration system with comprehensive form validation
- **Real-time Search**: JSON-powered program data with search and filtering
- **Bookmark Functionality**: Save programs for later viewing
- **Error Handling**: Comprehensive error handling with retry mechanisms

## 📱 App Screenshots

### Login Screen
![Login Screen](screenshots/Login%20Screen.jpg)
- Clean, minimalist design with custom SkillUp logo
- Email/password fields with validation
- Link to registration screen

### Registration Screen
![Registration Screen](screenshots/Registration%20Screen.jpg)
- Complete registration form with all fields
- Real-time password requirements checklist
- Password strength indicator
- Form validation with error messages

### Home Dashboard
![Home Dashboard](screenshots/Home%20Dashboard.jpg)
- Welcome message with user personalization
- Overall progress indicator
- Enrolled program cards with progress bars
- Quick access to browse all programs

### Program Listing Screen
![Program Listing](screenshots/Program%20Listing.jpg)
- Available learning pathways
- Search functionality to filter programs
- Difficulty filter dropdown
- Loading states and error handling

### Program Details Screen
![Program Details](screenshots/Program%20Details.jpg)
- Comprehensive program overview
- Course modules with completion status
- Skills, milestones, and badges sections
- Bookmark functionality

### Profile Screen
![Profile Screen](screenshots/Profile%20Screen.jpg)
- User profile with avatar and information
- Learning progress tracking
- Enrolled programs overview
- Settings and logout functionality

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

## 📋 Changelog

### [Week 4] - Final Version - 2024-10-23

#### Final Polish & Documentation
- **Finalized**: Complete app with all screens functional
- **Enhanced**: Overflow fixes and UI improvements
- **Documented**: Comprehensive README with screenshots
- **Polished**: Professional GitHub repository
- **Ready**: Portfolio-ready project for showcasing

### [Week 3] - 2024-10-23

#### JSON Integration & Forms
- **Added**: JSON data integration for programs
- **Added**: Registration form with comprehensive validation
- **Added**: Search and filtering capabilities
- **Added**: Bookmark functionality
- **Added**: Loading states and error handling
- **Added**: Enhanced password validation with requirements checklist

#### Bug Fixes
- **Fixed**: Program Details screen overflow issues
- **Fixed**: Password validation enforcement
- **Fixed**: Submit button state management

### [Week 2] - 2024-10-16

#### Initial Release
- **Added**: Basic app structure with 4 core screens
- **Added**: Navigation between screens
- **Added**: Login functionality
- **Added**: Program listing and details
- **Added**: Profile screen
- **Added**: Basic UI/UX design

## ✅ Week 4 Deliverables Status

| Requirement | Status |
|------------|--------|
| All Key Screens (Login, Registration, Home, Program Listing, Program Details, Profile) | ✅ Complete |
| Smooth Navigation | ✅ Complete |
| Consistent Branding | ✅ Complete |
| Working Data Integration | ✅ Complete |
| Working Form Submissions | ✅ Complete |
| Updated GitHub Repository | ✅ Complete |
| Polished README | ✅ Complete |
| Screenshots | ✅ Complete |
| Clean Commit History | ✅ Complete |
| Changelog | ✅ Complete |

## 🚧 Future Enhancements

- **AI Recommendation Engine**: Personalized skill suggestions
- **Learning Platform Integration**: Excelerate, LinkedIn Learning, Udemy, Coursera
- **Community Features**: Discussion boards and mentorship
- **Offline Mode**: Continue learning without internet
- **Adaptive Difficulty**: Dynamic content based on performance

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
