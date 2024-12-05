import 'package:flutter_starter/data/auth/data_sources/local/pref_utils/auth_prefutils.dart';
import 'package:injectable/injectable.dart';

import 'name_feature_utils/name_feature_prefutils.dart';

@injectable
class NameFeatureLocalDataSource {
  final FeaturePrefUtils prefUtils;

  NameFeatureLocalDataSource({
    required this.prefUtils,
  });

  String? getPrefExample() {
    return prefUtils.getPrefExample();
  }

  void setPrefExample(String example) {
    return prefUtils.setPrefExample(example);
  }
}
