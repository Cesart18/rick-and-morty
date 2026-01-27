part of 'package:rick_and_morty/src/presentation/home/base/home_page.dart';

enum _HomeStatus { 
  initial, 
  loading, 
  success, 
  failure;

  bool get isInitial => this == _HomeStatus.initial;
  bool get isLoading => this == _HomeStatus.loading;
  bool get isSuccess => this == _HomeStatus.success;
  bool get isFailure => this == _HomeStatus.failure;
}


/// {@template home_state}
/// _HomeState description
/// {@endtemplate}
class _HomeState extends Equatable {
  /// {@macro home_state}
  const _HomeState({
    this.status = _HomeStatus.initial,
  });

  /// Status of the state
  final _HomeStatus status;

  @override
  List<Object> get props => [status];

  /// Creates a copy of the current _HomeState with property changes
  _HomeState copyWith({
    _HomeStatus? status,
  }) {
    return _HomeState(
      status: status ?? this.status,
    );
  }
}
