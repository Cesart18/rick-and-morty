// Base for enums with associated values
// Allows creating enums with an associated string/int value for serialization/deserialization

// ignore_for_file: one_member_abstracts

/// {@template base_enum}
/// Base class for enums with associated values and mapping to domain entities.
///
/// [E] is the domain entity type the enum maps to
/// [V] is the value type (String, int, etc.) provided by the API
///
/// Usage example:
/// ```dart
/// enum TimeWindowTypeModel implements BaseEnum<TimeWindowType, String> {
///   day('day'),
///   week('week');
///
///   const TimeWindowTypeModel(this.value);
///
///   @override
///   final String value;
///
///   @override
///   TimeWindowType toEntity() {
///     switch (this) {
///       case TimeWindowTypeModel.day:
///         return TimeWindowType.day;
///       case TimeWindowTypeModel.week:
///         return TimeWindowType.week;
///     }
///   }
///
///   static TimeWindowTypeModel? fromValue(String value) {
///     return TimeWindowTypeModel.values.cast<BaseEnum<TimeWindowType,
///     String>>()
///         .findByValue(value) as TimeWindowTypeModel?;
///   }
/// }
/// ```
/// {@endtemplate}
abstract class BaseEnum<E, V> {
  /// Associated enum value (String, int, etc.)
  V get value;

  /// Converts the model enum to the domain entity
  E toEntity();
}

/// Extension to ease searching enums by value
extension BaseEnumExtension<E, V> on Iterable<BaseEnum<E, V>> {
  /// Finds the enum with the specified [value]
  BaseEnum<E, V>? findByValue(V value) {
    try {
      return firstWhere((e) => e.value == value);
    } catch (_) {
      return null;
    }
  }

  /// Converts a list of enums to a list of entities
  List<E> toEntities() {
    return map((e) => e.toEntity()).toList();
  }
}

/// Mixin to simplify converting from values
///
/// Usage example:
/// ```dart
/// enum StatusModel with BaseEnumMixin<Status, String>
///     implements BaseEnum<Status, String> {
///   active('active'),
///   inactive('inactive');
///
///   const StatusModel(this.value);
///
///   @override
///   final String value;
///
///   @override
///   Status toEntity() {
///     switch (this) {
///       case StatusModel.active:
///         return Status.active;
///       case StatusModel.inactive:
///         return Status.inactive;
///     }
///   }
///
///   static StatusModel? fromValue(String value) =>
///     StatusModel.values.cast<BaseEnum<Status, String>>()
///         .findByValue(value) as StatusModel?;
/// }
/// ```
mixin BaseEnumMixin<E, V> on Enum implements BaseEnum<E, V> {}

/// Use case with parameters
/// Example:
/// ```dart
/// abstract class UseCaseWithParams<Params, Result> {
///   Future<Result> execute(Params params);
/// }
/// ```
abstract class UseCaseWithParams<T, Params> {
  Future<T> execute(Params params);
}

/// Use case without parameters
/// Example:
/// ```dart
/// abstract class UseCaseWithoutParams<Result> {
///   Future<Result> execute();
/// }
/// ```
abstract class UseCaseWithoutParams<T> {
  Future<T> execute();
}
