import 'package:flutter_starter/data/name_feature/data_sources/local/name_feature_utils/pref_utils_keys.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/network/interceptor/AuthInterceptor.dart';

abstract class FeaturePrefUtils {
  void setPrefExample(String prefExample);
  String? getPrefExample();
}

@Injectable(as: FeaturePrefUtils)
class PrefUtilsImpl implements FeaturePrefUtils {
  final SharedPreferences sharedPreferences;
  final AuthenticatedHttpClient httpClientInterceptor;

  PrefUtilsImpl(
      {required this.sharedPreferences, required this.httpClientInterceptor});

  @override
  void setPrefExample(String prefExample) {
    sharedPreferences.setString(PREF_EXAMPLE, prefExample);
  }

  @override
  String? getPrefExample() {
    return sharedPreferences.getString(PREF_EXAMPLE);
  }
}
