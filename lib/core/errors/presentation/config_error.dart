import 'package:rick_and_morty/core/foundation.dart';

abstract class ConfigError extends Equatable implements Exception, BaseError {
  const ConfigError([this.message]);

  final String? message;

  @override
  List<Object?> get props => [message];
}
