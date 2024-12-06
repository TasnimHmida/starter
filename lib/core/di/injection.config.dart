// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_starter/core/di/core_module.dart' as _i313;
import 'package:flutter_starter/core/network/interceptor/AuthInterceptor.dart'
    as _i807;
import 'package:flutter_starter/core/network/interceptor/HttpInterceptor.dart'
    as _i821;
import 'package:flutter_starter/data/auth/data_sources/local/auth_local_data_source.dart'
    as _i573;
import 'package:flutter_starter/data/auth/data_sources/local/pref_utils/auth_prefutils.dart'
    as _i813;
import 'package:flutter_starter/data/auth/data_sources/remote/auth_remote_data_source.dart'
    as _i973;
import 'package:flutter_starter/data/auth/repositories/auth_repository_impl.dart'
    as _i112;
import 'package:flutter_starter/data/name_feature/data_sources/local/name_feature_local_data_source.dart'
    as _i446;
import 'package:flutter_starter/data/name_feature/data_sources/local/name_feature_utils/name_feature_prefutils.dart'
    as _i649;
import 'package:flutter_starter/data/name_feature/data_sources/remote/name_feature_remote_data_source.dart'
    as _i445;
import 'package:flutter_starter/data/name_feature/repositories/name_feature_repository_impl.dart'
    as _i239;
import 'package:flutter_starter/domain/auth/repositories/auth_repository.dart'
    as _i515;
import 'package:flutter_starter/domain/name_feature/repositories/feature_name_repository.dart'
    as _i503;
import 'package:flutter_starter/presentation/auth/bloc/login_bloc/login_bloc.dart'
    as _i1022;
import 'package:flutter_starter/presentation/auth/bloc/register_bloc/register_bloc.dart'
    as _i584;
import 'package:flutter_starter/presentation/name_feature/bloc/name_bloc.dart'
    as _i616;
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreModule = _$CoreModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => coreModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i519.Client>(() => coreModule.httpClient);
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => coreModule.dataConnectionChecker);
    gh.factory<_i616.NameBloc>(
        () => _i616.NameBloc(gh<_i503.NameFeatureRepository>()));
    gh.singleton<_i807.AuthenticatedHttpClient>(() =>
        _i807.AuthenticatedHttpClient(
            sharedPref: gh<_i460.SharedPreferences>()));
    gh.factory<_i1022.LoginBloc>(
        () => _i1022.LoginBloc(authRepository: gh<_i515.AuthRepository>()));
    gh.factory<_i821.HttpInterceptor>(() => _i821.HttpInterceptorImpl(
        httpClient: gh<_i807.AuthenticatedHttpClient>()));
    gh.factory<_i445.NameFeatureRemoteDataSource>(
        () => _i445.NameFeatureRemoteDataSource(
              httpClient: gh<_i821.HttpInterceptor>(),
            ));
    gh.factory<_i973.AuthRemoteDataSource>(() => _i973.AuthRemoteDataSource(
          httpClient: gh<_i821.HttpInterceptor>(),
        ));
    gh.factory<_i584.RegisterBloc>(
        () => _i584.RegisterBloc(gh<_i515.AuthRepository>()));
    gh.factory<_i813.AuthPrefUtils>(() => _i813.PrefUtilsImpl(
          sharedPreferences: gh<_i460.SharedPreferences>(),
          httpClientInterceptor: gh<_i807.AuthenticatedHttpClient>(),
        ));
    gh.factory<_i649.FeaturePrefUtils>(() => _i649.PrefUtilsImpl(
          sharedPreferences: gh<_i460.SharedPreferences>(),
          httpClientInterceptor: gh<_i807.AuthenticatedHttpClient>(),
        ));
    gh.factory<_i239.NameFeatureRepositoryImpl>(
        () => _i239.NameFeatureRepositoryImpl(
              remoteDataSource: gh<_i445.NameFeatureRemoteDataSource>(),
            ));
    gh.factory<_i573.AuthLocalDataSource>(
        () => _i573.AuthLocalDataSource(prefUtils: gh<_i813.AuthPrefUtils>()));
    gh.factory<_i112.AuthRepositoryImpl>(() => _i112.AuthRepositoryImpl(
          remoteDataSource: gh<_i973.AuthRemoteDataSource>(),
          localDataSource: gh<_i573.AuthLocalDataSource>(),
        ));
    gh.factory<_i446.NameFeatureLocalDataSource>(() =>
        _i446.NameFeatureLocalDataSource(
            prefUtils: gh<_i649.FeaturePrefUtils>()));
    return this;
  }
}

class _$CoreModule extends _i313.CoreModule {}
