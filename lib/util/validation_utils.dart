class ValidationUtils {
  static String? isValidEmail(String? email) {
    if (email == null) return 'please provide your email address';

    // Use a regular expression for basic email validation
    final emailRegExp = RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');

    return emailRegExp.hasMatch(email) ? null : 'please provide a valid email address';
  }

  static String? isValidField(String? field, {String? fieldName}) {
    if (field == null) return 'Field is required';

    return field.length > 8 ? null : "${fieldName ?? 'value'} name must be longer than 8 characters";
  }

  static String? isValidPassword(String? password) {
    // Check if the password contains at least one letter and one symbol
    final RegExp letterRegExp = RegExp(r'[a-zA-Z]');
    final RegExp symbolRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    if (password == null) return 'please provide your password';

    if (!letterRegExp.hasMatch(password)) {
      return 'Password must contain at least one letter';
    } else if (!symbolRegExp.hasMatch(password)) {
      return 'Password must contain at least one symbol';
    }

    return null;
  }
}
