// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/movies/data/repo/movies_repo.dart' as _i917;
import '../../features/movies/data/repo/movies_repo_impl.dart' as _i161;
import '../database/cache/app_cache_helper.dart' as _i756;
import '../database/network/api_consumer.dart' as _i742;
import '../database/network/dio_consumer.dart' as _i1062;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i756.AppCacheHelper>(() => _i756.AppCacheHelper());
    gh.lazySingleton<_i742.ApiConsumer>(
      () => _i1062.DioConsumer(appCacheHelper: gh<_i756.AppCacheHelper>()),
    );
    gh.lazySingleton<_i917.MoviesRepo>(
      () => _i161.MoviesRepoImpl(gh<_i742.ApiConsumer>()),
    );
    return this;
  }
}
