class TValidator {
  //Empty text validation
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  //Username validation
  static String? validateUsername(String? username) { 
    if (username == null || username.isEmpty) {
      return 'Username is required';
    }

    //define a regular expression pattern for the username
    const pattern = r"^[a-zA-Z0-9_-]{3,20}$";

    //Create a RegExp instance from the pattern
    final regex = RegExp(pattern);

    //Use the hasMatch method to check if the username matches the pattern
    bool isValid = regex.hasMatch(username);

    //Check if the username dosen't start or end with an underscore or hyphen.
    if (isValid) {
      isValid =
          !username.startsWith('_') &&
          !username.startsWith('-') &&
          !username.startsWith('_') &&
          !username.startsWith('-');
    }

    if (!isValid) {
      return 'Username is not valid';
    }

    return null;
  }

  //!email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    //Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }
    return null;
  }

  //!password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    //Check for minimum password length.
    if (value.length < 6) {
      return "Password must be at least 6 characters long.";
    }

    //Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain at least one uppercase letter.";
    }

    //Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one number.";
    }

    //Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password must contain at least one special character.";
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    //Regular expression for phone number validation (assuming a 10 digit US phone number formate)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required).';
    }
    return null;
  }
}
