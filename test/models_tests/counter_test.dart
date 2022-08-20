import 'package:flutter_test/flutter_test.dart';
import 'package:f_testing/models/counter.dart';

main() {
  group('Counter', () {
    test('Initial value is 0', () {
      // Arrange
      final counter = Counter();
      // Act
      // Assert
      expect(counter.value, 0);
    });

    test('Increment function 1', () {
      // Arrange
      final counter = Counter();
      // Act
      counter.increment();
      // Assert
      expect(counter.value, 1);
    });

    test('Decrement function -1', () {
      // Arrange
      final counter = Counter();
      // Act
      counter.decrement();
      // Assert
      expect(counter.value, -1);
    });
  });
}