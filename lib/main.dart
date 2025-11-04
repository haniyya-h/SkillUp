import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/program_listing_screen.dart';
import 'screens/program_details_screen.dart';
import 'screens/profile_screen.dart';
import 'models/user_model.dart';
import 'models/program_provider.dart';
import 'services/auth_service.dart';
import 'services/registration_service.dart';
import 'screens/registration_screen.dart';

void main() {
  runApp(const SkillUpApp());
}

class SkillUpApp extends StatelessWidget {
  const SkillUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => ProgramProvider()),
        Provider(create: (_) => RegistrationService()),
      ],
      child: MaterialApp.router(
        title: 'SkillUp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF2E7D32), 
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E7D32),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        routerConfig: _router,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegistrationScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/programs',
      builder: (context, state) => const ProgramListingScreen(),
    ),
    GoRoute(
      path: '/program-details/:programId',
      builder: (context, state) {
        final programId = state.pathParameters['programId']!;
        return ProgramDetailsScreen(programId: programId);
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);
