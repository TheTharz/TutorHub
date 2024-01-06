class TValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    //apply a suitable regex and length should be at least 8
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    return null;
  }

  //validate phone number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Invalid phone number';
    }
    return null;
  }

  //validate empty string
  static String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
