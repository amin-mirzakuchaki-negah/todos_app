import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

import 'injection_container.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> init() => getIt.init();

@module
abstract class RegisterSharedPreferences {
  @lazySingleton
  @preResolve
  Future<SharedPreferences> get sh => SharedPreferences.getInstance();
}