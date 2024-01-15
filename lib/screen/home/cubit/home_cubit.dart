import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yuletide_team_mate_composer/utils/mobile_cubit.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends MobileCubit<HomeState> {
  HomeCubit() : super(const HomeState.build());
}
