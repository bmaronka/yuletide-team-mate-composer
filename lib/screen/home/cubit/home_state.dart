part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  @Implements<HomeStateBuilder>()
  const factory HomeState.build() = _HomeStateBuild;
}

abstract class HomeStateBuilder {}
