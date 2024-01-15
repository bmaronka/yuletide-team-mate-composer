import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MobileCubit<State> extends BlocBase<State> {
  MobileCubit(super.state);

  @override
  void emit(State state) {
    if (isClosed) {
      return;
    } else {
      super.emit(state);
    }
  }
}
