import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:f_testing/pages/login.page.dart';

void main() {
  testWidgets('Login must have a title', (widgetTester) async {
    // Arrange
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: LoginPage(),
      )
    );
    // Act
    final titleFinder = find.text('Login');
    // Assert
    expect(titleFinder, findsOneWidget);
  });

  group('Login must have credentials', () {
    testWidgets('Login must have an email', (widgetTester) async {
      await widgetTester.pumpWidget(
          const MaterialApp(
            home: LoginPage(),
          )
      );
      final passwordFinder = find.widgetWithText(TextField, 'Email');

      expect(passwordFinder, findsOneWidget);
    });

    testWidgets('Login must have a password', (widgetTester) async {
      await widgetTester.pumpWidget(
          const MaterialApp(
            home: LoginPage(),
          )
      );
      final passwordFinder = find.widgetWithText(TextField, 'Password');

      expect(passwordFinder, findsOneWidget);
    });
  });
}