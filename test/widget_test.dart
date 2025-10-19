import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skillup_app/main.dart';

void main() {
  testWidgets('App starts and shows login screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SkillUpApp());

    // Verify that the login screen is displayed
    expect(find.text('Skill Pathways'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Log In'), findsOneWidget);
  });
}

