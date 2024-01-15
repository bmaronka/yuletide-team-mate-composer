import 'package:fimber_io/fimber_io.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoggingBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    Fimber.d('onCreate => ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Fimber.d('onChange => ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Fimber.d('onError => ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    Fimber.d('onClose => ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}
