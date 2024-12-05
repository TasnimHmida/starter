import 'package:flutter_starter/data/auth/data_sources/local/pref_utils/auth_prefutils.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthLocalDataSource {
  final AuthPrefUtils prefUtils;

  AuthLocalDataSource({
    required this.prefUtils,
  });

  String? getToken() {
    return prefUtils.getToken();
  }

  void clear() {
    return prefUtils.clear();
  }

  void setToken(String token) {
    return prefUtils.setToken(token);
  }
  void setRefreshToken(String token) {
    return prefUtils.setRefreshToken(token);
  }
}
