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
}