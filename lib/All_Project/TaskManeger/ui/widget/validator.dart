class Validators {
  Validators._();
  // Required
  static String? requiredField(String? value,
      {String fieldName = 'This field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  // Full Name
  static String? fullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Full name is required';
    }

    if (value.trim().length < 3) {
      return 'Enter a valid full name';
    }

    return null;
  }

  // Email
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final regex =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!regex.hasMatch(value.trim())) {
      return 'Enter a valid email';
    }

    return null;
  }

  // Phone Number
  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }

    if (!RegExp(r'^[0-9]{11}$').hasMatch(value)) {
      return 'Enter a valid phone number';
    }

    return null;
  }

  // Password
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  // Strong Password
  static String? strongPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    final regex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$',
    );

    if (!regex.hasMatch(value)) {
      return 'Use uppercase, lowercase, number & special character';
    }

    return null;
  }

  // Confirm Password   validator: (value) => Validators.confirmPassword(
  //     value,
  //     passwordController.text,
  //   ),
  static String? confirmPassword(
      String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm your password';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }

  // Number
  static String? number(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Number is required';
    }

    if (double.tryParse(value) == null) {
      return 'Enter a valid number';
    }

    return null;
  }

  // OTP
  static String? otp(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    }

    if (value.length != 4) {
      return 'OTP must be 4 digits';
    }

    return null;
  }

  // URL
  static String? url(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'URL is required';
    }

    final uri = Uri.tryParse(value);

    if (uri == null || !uri.hasAbsolutePath) {
      return 'Enter a valid URL';
    }

    return null;
  }

  // Min Length
  static String? minLength(String? value, int length) {
    if (value == null || value.length < length) {
      return 'Minimum $length characters required';
    }
    return null;
  }

  // Max Length...use validator: (value) => Validators.maxLength(value, 20),
  static String? maxLength(String? value, int length) {
    if (value != null && value.length > length) {
      return 'Maximum $length characters allowed';
    }
    return null;
  }
}