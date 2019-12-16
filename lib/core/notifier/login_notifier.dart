import 'package:flutter_sample_code/core/data/local/app_shared_preference.dart';
import 'package:flutter_sample_code/core/data/remote/repository/auth_repository.dart';
import 'package:flutter_sample_code/core/data/remote/request_response/login/login_response.dart';
import 'package:flutter_sample_code/core/data/remote/request_response/login/request.dart';
import 'package:flutter_sample_code/utils/app_constants.dart';
import 'package:flutter_sample_code/utils/app_log_helper.dart';

import 'base/base_notifier.dart';
import 'common_notifier.dart';

class LoginNotifier extends BaseNotifier {
  final log = getLogger('LoginNotifier');

  final _repository = AuthRepository();

  bool _isPasswordVisible = false;
  bool _isTokenAvailable = false;
  String _emailId = '';
  String _password = '';

  //constructor
  LoginNotifier() {
    //get admin token & save in sp for future use
    callApiGetAdminToken("admin", "TestPassword@123");
  }

  // Getter Setter for Variables
  bool get isPasswordVisible => _isPasswordVisible;

  set isPasswordVisible(bool value) {
    _isPasswordVisible = value;
    notifyListeners();
  }

  bool get isTokenAvailable => _isTokenAvailable;

  set isTokenAvailable(bool value) {
    _isTokenAvailable = value;
    notifyListeners();
  }

  String get emailId => _emailId;

  set emailId(String value) {
    _emailId = value;
    notifyListeners();
  }

  String get password => _password;

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  //api: login
  Future<LoginResponse> callApiLoginUser(String email, String password) async {
    log.i('api ::: apiLoginUser called');
    super.isLoading = true;
    LoginResponse response = LoginResponse();
    try {
      response = await _repository.apiUserLogin(LoginRequest(username: email, password: password));
      super.isLoading = false;
    } catch (e) {
      log.e(e.toString());
      super.isLoading = false;
    }
    return response;
  }

  //api: getAdminToken
  Future<LoginResponse> callApiGetAdminToken(String email, String password) async {
    log.i('api ::: apiGetAdminToken called');
    LoginResponse response = await _repository.apiAdminToken(LoginRequest(username: email, password: password));
    String token = response.token;
    if (token != null && token.trim().length > 0) {
      log.i('GetAdminToken success with token : $token');
      //save user token to shared preference
      saveAdminToken(token);
    }
    return response;
  }

  //helper: save user token in sp
  void saveUserToken(String token) async {
    bool isTokenSaved = await AppSharedPreference().saveUserToken(token);
    log.i('user token saved satus: $isTokenSaved');
    String spUserToken = await AppSharedPreference().getUserToken();
    //update to common model for app use
    CommonNotifier().userToken = spUserToken;
    log.i('test saved value from SP: $spUserToken');
  }

  //helper: save admin token in sp
  void saveAdminToken(String token) async {
    bool isTokenSaved = await AppSharedPreference().saveAdminToken(token);
    log.i('Admin token saved satus: $isTokenSaved');
    String spAdminToken = await AppSharedPreference().getAdminToken();
    //update to common model for app use
    CommonNotifier().adminToken = spAdminToken;
    log.i('Admin saved value : $spAdminToken');
  }

  //helper: save user cred. in sp
  void saveUserCredential(bool shouldRemember, String emailId, String password) async {
    if (shouldRemember) {
      // if yes remember
      AppSharedPreference().saveStringValue(AppConstants.KEY_USER_EMAIL_ID, emailId);
      AppSharedPreference().saveStringValue(AppConstants.KEY_USER_PASSWORD, password);
      AppSharedPreference().saveBooleanValue(AppConstants.KEY_SHOULD_REMEMBER, true);
      log.e('UserCredential saved successfully');
    } else {
      log.e('UserCredential failed to save');
    }
  }
}
