class AppRegex {
  AppRegex._();

  static bool isValidUsername(String username) =>
      RegExp(r'^[a-zA-Z0-9_]{3,}$').hasMatch(username);
  static bool isValidEmail(String email) => RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  ).hasMatch(email);
  static bool isValidEgyptianNumber(String phone) {
    phone = phone.replaceAll(' ', '');
    final egyptianPhoneRegex = RegExp(r'^(0)?1[0,1,2,5][0-9]{8}$');
    return egyptianPhoneRegex.hasMatch(phone);
  }
  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }
  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }
  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }
  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }
  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }
}
