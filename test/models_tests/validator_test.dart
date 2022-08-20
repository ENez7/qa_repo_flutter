import 'package:flutter_test/flutter_test.dart';
import '../../lib/models/validator.dart';

void main() {
  group('Validator functions', () {
    test('Not void string', () {
      // ARRANGE
      var result = Validator.validarMail('');
      // ACT

      // ASSERT
      expect(result, 'El Mail es requerido');
    });
    test('Valid email string format', () {
      // ARRANGE
      var result = Validator.validarMail('a@a.com');
      // ACT

      // ASSERT
      expect(result, null);
    });
    test('Invalid email string format', () {
      // ARRANGE
      var result = Validator.validarMail('aaa;');
      // ACT

      // ASSERT
      expect(result, 'Introduzca un mail valido');
    });
  });

  group('Password functions', () {
    test('Non empty password', () {
      var result = Validator.validarPassword('');
      expect(result, 'Password es requerido');
    });
    test('Length error', () {
      var result = Validator.validarPassword('Password+10');
      expect(result, 'La longitud debe estar entre 6 y 10 caracteres');
    });
    test('Right password', () {
      var result = Validator.validarPassword('password');
      expect(result, null);
    });
  });
}