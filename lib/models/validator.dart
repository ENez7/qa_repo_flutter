class Validator{
  static String? validarMail(String email){
    if(email.isEmpty) {
      return 'El Mail es requerido';
    }

    String emailPattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    if(RegExp(emailPattern).hasMatch(email)){
      return null;
    } else {
      return 'Introduzca un mail valido';
    }
  }

  static String? validarPassword(String password){
    if(password.isEmpty){
      return 'Password es requerido';
    }

    if(password.length > 10 || password.length < 6) {
      return 'La longitud debe estar entre 6 y 10 caracteres';
    }

    return null;
  }
}