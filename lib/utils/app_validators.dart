import 'app_constants.dart';

//validation for email
String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Invalid Email';
  } else {
    return null;
  }
}

//validation for password
String validatePassword(String value) {
  Pattern patternForOneUpperCase = '(?=.*[A-Z])';
  Pattern patternForOneSpecialChar = '(?=.*[!@#\$&*])';
  Pattern patternForOneDigit = '(?=.*[0-9])';
  Pattern patternForOneSmallCase = '(?=.*[a-z])';

  RegExp regexUppercaseCheck = new RegExp(patternForOneUpperCase);
  RegExp regexSpecialCharCheck = new RegExp(patternForOneSpecialChar);
  RegExp regexDigitCharCheck = new RegExp(patternForOneDigit);
  RegExp regexSmallCaseCheck = new RegExp(patternForOneSmallCase);

  if (!regexUppercaseCheck.hasMatch(value)) {
    return AppConstants.PASSWORD_FIELD_INPUT_PROTOCOL;
  } else if (!regexSpecialCharCheck.hasMatch(value)) {
    return AppConstants.PASSWORD_FIELD_INPUT_PROTOCOL;
  } else if (!regexDigitCharCheck.hasMatch(value)) {
    return AppConstants.PASSWORD_FIELD_INPUT_PROTOCOL;
  } else if (!regexSmallCaseCheck.hasMatch(value)) {
    return AppConstants.PASSWORD_FIELD_INPUT_PROTOCOL;
  } else {
    return null;
  }
}

//validate the given url
String validateUrl(String url) {
  Pattern urlPattern = r"(https?|ftp)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
  var result = new RegExp(urlPattern, caseSensitive: false).firstMatch(url);

  if (result != null) {
    return ' Invalid URL';
  } else {
    return ' Valid URL';
  }
}

// Empty Check feature and minimum required length condition Validation(like CVV, Minimum Name Field of Character Length, Message field of Minimum content length etc...)
int validateEmptyAndLengthCheck(String stringValue, int maxLength, {int minLength = 0}) {
  // 0 = null
  // 1 = Empty Field
  // 4 = requiredLength

  int errorFlag = 0;

  if (stringValue.length > 0) {
    if (minLength != 0 && stringValue.length < minLength) {
      errorFlag = 4;
    } else {
      errorFlag = 0;
    }
  } else {
    errorFlag = 1;
  }

  return errorFlag;
}

// validate new Password
int validateNewPasswordFieldEmptyAndLengthChecker(String value) {
  // 0 = null
  // 1 = Empty Field
  // 2 = length catch
  int errorFlag = 0;

  if (value.trim().length < 1) {
    errorFlag = 1;
  } else {
    if (value.length >= AppConstants.PASSWORD_FIELD_MIN_LENGTH) {
      errorFlag = 0;
    } else {
      errorFlag = 2;
    }
  }
  return errorFlag;
}

// validate confirm Password
int validateConfirmPasswordFieldEmptyCheck(String confirmPwd, String newPwd) {
  // 0 = null
  // 1 = Empty Field
  // 2 = length catch
  // 3 = not-matched

  int errorFlag = 0;

  if (confirmPwd.trim().length < 1) {
    errorFlag = 1;
  } else {
    if (confirmPwd.length >= AppConstants.PASSWORD_FIELD_MIN_LENGTH) {
      if (confirmPwd.trim().startsWith(newPwd.trim()) && (confirmPwd.trim().length == newPwd.trim().length)) {
        errorFlag = 0;
      } else {
        errorFlag = 3;
      }
    } else {
      errorFlag = 2;
    }
  }
  return errorFlag;
}
