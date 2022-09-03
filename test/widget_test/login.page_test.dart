import 'package:f_testing/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:f_testing/pages/login.page.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Login must have a title', (widgetTester) async {
    // Arrange
    await widgetTester.pumpWidget(const MaterialApp(
      home: LoginPage(),
    ));
    // Act
    final titleFinder = find.text('Login');
    // Assert
    expect(titleFinder, findsOneWidget);
  });

  group('Login must have credentials', () {
    testWidgets('Login must have an email', (widgetTester) async {
      await widgetTester.pumpWidget(const MaterialApp(
        home: LoginPage(),
      ));
      final passwordFinder = find.widgetWithText(TextField, 'Email');

      expect(passwordFinder, findsOneWidget);
    });

    testWidgets('Login must have a password', (widgetTester) async {
      await widgetTester.pumpWidget(const MaterialApp(
        home: LoginPage(),
      ));
      final passwordFinder = find.widgetWithText(TextField, 'Password');

      expect(passwordFinder, findsOneWidget);
    });

    testWidgets('Login must have a login button', (tester) async {
      // ARRANGE
      await tester.pumpWidget(const MaterialApp(
        home: LoginPage(),
      ));
      // ACT
      Finder loginButtonFinder = find.byType(ElevatedButton);

      // ASSERT
      expect(loginButtonFinder, findsOneWidget);
    });

    testWidgets('Must show error if fields are empty', (tester) async {
      // ARRANGE
      await tester.pumpWidget(const MaterialApp(
        home: LoginPage(),
      ));
      // ACT
      Finder loginButtonFinder = find.byType(ElevatedButton);
      await tester.tap(loginButtonFinder);
      await tester.pumpAndSettle();

      Finder error = find.text('El Mail es requerido');

      // ASSERT
      expect(error, findsWidgets);
    });

    testWidgets('Must submit if everything is ok', (tester) async {
      // ARRANGE
      await tester.pumpWidget(const MaterialApp(
        home: LoginPage(),
      ));
      // ACT
      Finder userTextName = find.byKey(const ValueKey('email_id'));
      Finder userTextPassword = find.byKey(const ValueKey('password_id'));

      await tester.enterText(userTextName, "nenrique0112@gmail.com");
      await tester.enterText(userTextPassword, "password");

      Finder loginButtonFinder = find.byType(ElevatedButton);
      await tester.tap(loginButtonFinder);
      await tester.pumpAndSettle();

      Finder error = find.text('field required');

      // ASSERT
      expect(error, findsNothing);
    });
  });

  group('Integration Tests', (() {
    testWidgets('Must navigate between screens', ((widgetTester) async {
      await widgetTester.pumpWidget(const MaterialApp(
        home: LoginPage(),
      ));

      Finder usernameTextField = find.byKey(const ValueKey('email_id'));
      Finder passwordTextField = find.byKey(const ValueKey('password_id'));

      await widgetTester.enterText(usernameTextField, 'nenrique0112@gmail.com');
      await widgetTester.enterText(passwordTextField, 'Aabcde1');

      Finder loginButton = find.byType(ElevatedButton);
      await widgetTester.tap(loginButton);

      await widgetTester.pumpAndSettle(const Duration(seconds: 5));

      Finder welcomeText = find.byType(Text);
      expect(welcomeText, findsOneWidget);
    }));
  }));
}
