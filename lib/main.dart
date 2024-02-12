import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:yuletide_team_mate_composer/injectable/injectable.dart';
import 'package:yuletide_team_mate_composer/mobile_app.dart';
import 'package:yuletide_team_mate_composer/presentation/router/router.dart';
import 'package:yuletide_team_mate_composer/utils/logging_bloc_observer.dart';

void main() => run();

void run() {
  initializeApp();

  runApp(MyApp(MainRouter()));
}

@visibleForTesting
void initializeApp() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  configureDependencies();

  Bloc.observer = LoggingBlocObserver();
}
