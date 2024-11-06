import 'package:email_validator/email_validator.dart';

class AppValidator {

  final String validEmail = "emuricardo@gmail.com";

  static String? validateEmail(String? value) {
    if (!EmailValidator.validate(value ?? "")) {
      return "Entrez un email valide";
    } else if (value != "emuricardo@gmail.com") {
      return "Email incorrect";
    }
    return null;
  }

  static String? validePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Le mot de passe est requis";
    } else if (value != "123456") {
      return "Le mot de passe est incorrect";
    }
    return null;
  }
}