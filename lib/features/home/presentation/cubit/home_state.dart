part of 'home_cubit.dart';

@immutable
abstract class HomeState extends Equatable {
  final Result result;

  const HomeState({
    required this.result,
  });
  @override
  List<Object?> get props => [result];
}

class HomeWithValuesState extends HomeState {
  const HomeWithValuesState({required super.result});

  @override
  List<Object?> get props => [result];
}
