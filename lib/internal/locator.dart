import 'package:breaking_bad_app/data/api/core_api.dart';
import 'package:get_it/get_it.dart';

import '../data/services/actor_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  locator.registerLazySingleton(() => CoreApi());
  locator.registerLazySingleton(() => ActorService());
}