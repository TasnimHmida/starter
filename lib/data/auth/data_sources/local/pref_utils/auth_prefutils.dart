import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/network/interceptor/AuthInterceptor.dart';
import '../../../../../core/strings/pref_utils_keys.dart';

abstract class AuthPrefUtils {
  String? getToken();

  String? getRefreshToken();

  void setToken(String token);

  void setRefreshToken(String refreshToken);

  void clear();
}

@Injectable(as: AuthPrefUtils)
class PrefUtilsImpl implements AuthPrefUtils {
  final SharedPreferences sharedPreferences;
  final AuthenticatedHttpClient httpClientInterceptor;

  PrefUtilsImpl({required this.sharedPreferences, required this.httpClientInterceptor});

  @override
  String? getToken() {
    return sharedPreferences.getString(TOKEN);
  }

  @override
  void setToken(String token) async {
    await sharedPreferences.setString(TOKEN, token);
  }

  @override
  String? getRefreshToken() {
    return sharedPreferences.getString(REFRESH_TOKEN);
  }

  @override
  void setRefreshToken(String refreshToken) {
    sharedPreferences.setString(REFRESH_TOKEN, refreshToken);
  }

  @override
  void clear() async {
    sharedPreferences.remove(TOKEN);
    sharedPreferences.remove(REFRESH_TOKEN);
  }
}
