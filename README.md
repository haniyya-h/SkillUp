# SkillUp - Skill Pathways App

A Flutter application for skill-based learning pathways that helps professionals and learners identify, pursue, and monitor skill-based learning paths specific to their career objectives.

## 🎯 Purpose

The SkillUp app allows users to choose career paths (such as digital marketing, UX design, or data analytics) and automatically creates personalized learning roadmaps with important courses, microtasks, necessary skills, and milestone checkpoints.

## ✨ Features

### For Learners
- **Career Pathway Selection**: Choose from various career paths like Data Analytics, UX Design, Digital Marketing, etc.
- **Progress Tracking**: Visual progress indicators and completion rates
- **Interactive Learning**: Course modules with hands-on projects
- **Achievement System**: Badges and milestones for motivation
- **Personalized Dashboard**: Overview of enrolled programs and progress

### Core Screens
1. **Login Screen**: Secure authentication with email/password
2. **Home Dashboard**: Welcome screen with overall progress and enrolled programs
3. **Program Listing**: Browse all available learning pathways
4. **Program Details**: Detailed view of courses, modules, and milestones

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

## 📱 App Screenshots

### Login Screen

- Clean, minimalist design with custom SkillUp logo
- Email/password fields with validation
- Professional branding and user-friendly interface
  <img width="571" height="1280" alt="image" src="https://github.com/user-attachments/assets/4055dcb4-fa8c-46af-9f16-4db4e3767bc9" />


### Home Dashboard

- Welcome message with user personalization
- Circular progress indicator (75% complete)
- Enrolled program cards with progress bars
- Quick access to browse all programs
  <img width="571" height="1280" alt="image" src="https://github.com/user-attachments/assets/dd41f636-fb6b-4697-ad90-d1571710f26c" />


### Program Listing Screen

- Grid of available learning pathways
- Search functionality to filter programs
- Program cards with descriptions and duration
- Progress indicators for each pathway
  <img width="571" height="1280" alt="image" src="https://github.com/user-attachments/assets/f795914d-6c7e-4abd-96db-0c1a7e172964" />
  

### Profile Screen

- User profile with avatar and information
- Learning progress tracking
- Enrolled programs overview
- Settings and logout functionality
<img width="571" height="1280" alt="image" src="https://github.com/user-attachments/assets/41039ed9-b25d-476c-8171-5d2634f0ae1f" />




## 🏗️ Project Structure

```
lib/
├── main.dart                 # App entry point and routing
├── models/
│   └── user_model.dart      # User data and state management
├── services/
│   └── auth_service.dart    # Authentication logic
├── screens/
│   ├── login_screen.dart    # Login interface
│   ├── home_screen.dart     # Dashboard
│   ├── program_listing_screen.dart
│   └── program_details_screen.dart
└── widgets/                 # Reusable UI components
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

1. **Data Analytics Pathway**
   - Excel Fundamentals
   - SQL Database Management
   - Python for Data Analysis

2. **UX Design Pathway**
   - Design Thinking Fundamentals
   - User Research & Personas
   - Wireframing & Prototyping

3. **Digital Marketing Pathway**
   - Digital Marketing Fundamentals
   - Social Media Marketing
   - SEO & Analytics

4. **Project Management**
5. **Data Science**

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

## 📝 Development Notes

### Week 2 Deliverables ✅
- [x] Working UI Prototype with 4 core screens
- [x] Interactive navigation between screens
- [x] Clean, professional design matching wireframes
- [x] GitHub repository with meaningful commits
- [x] README documentation with screenshots

### Key Features Implemented
- Responsive design for different screen sizes
- Form validation and error handling
- State management with Provider
- Navigation with Go Router
- Consistent theming and branding
- Progress tracking and visualization

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is part of the Excelerate internship program and is developed for educational purposes.

## 👥 Team

- **Developer**: Haniyya Hussain
- **UI/UX Designer**: Aisha Irfan
- **Mentor**: Excelerate Team
- **Design**: Based on previously made wireframes

---

## 🚀 Week 3 Updates

### New Features Added
- **JSON Data Integration**: All program data now loads from JSON files instead of hardcoded values
- **Dynamic Program Loading**: Program listing and details screens fetch real data
- **Feedback Form System**: Complete feedback form with validation and submission
- **Enhanced Error Handling**: Loading states, error messages, and retry functionality
- **Form Validation**: Email validation, required fields, and input sanitization

### Technical Improvements
- **Service Layer**: Implemented `ProgramService` for data management
- **Data Models**: Created comprehensive models for programs, modules, and feedback
- **Loading States**: Added skeleton loading and progress indicators
- **Error Handling**: User-friendly error messages with retry options
- **Navigation**: Enhanced routing with feedback screen integration

### Data Structure
- **Programs JSON**: Contains 5 learning pathways with modules, instructors, and metadata
- **User Data JSON**: User profiles, enrolled programs, and feedback data
- **Dynamic Loading**: All screens now load data asynchronously from JSON files

### Form Features
- **Comprehensive Validation**: Email format, required fields, rating selection
- **User-Friendly Interface**: Star ratings, dropdown selections, text areas
- **Success Handling**: Form submission with confirmation messages
- **Error Recovery**: Clear error messages and retry functionality

**Note**: This is a prototype application developed for Week 3 deliverables. The app now demonstrates dynamic data loading, form handling, and professional error management for the SkillUp learning platform.
