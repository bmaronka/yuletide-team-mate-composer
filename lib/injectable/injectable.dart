import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:yuletide_team_mate_composer/injectable/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
