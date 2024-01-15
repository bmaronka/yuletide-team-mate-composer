import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yuletide_team_mate_composer/injectable/injectable.dart';
import 'package:yuletide_team_mate_composer/mobile_app.dart';
import 'package:yuletide_team_mate_composer/utils/logging_bloc_observer.dart';

void main() => run();

void run() {
  initializeApp();

  runApp(const MyApp());
}

@visibleForTesting
void initializeApp() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  Bloc.observer = LoggingBlocObserver();
}
