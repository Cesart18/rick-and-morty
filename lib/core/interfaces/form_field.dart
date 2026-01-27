/// A form field that can be pure or dirty.
///
/// [T] is the type of the value of the form field.
/// [E] is the type of the error returned by the validation function.
abstract class FormField<T, E> {
  const FormField._({required this.value, this.isPure = true});

  /// Creates a pure form field. A pure form field is one that has not been
  /// interacted with by the user yet.
  const FormField.pure(T value) : this._(value: value);

  /// Creates a dirty form field. A dirty form field is one that has been
  /// interacted with by the user.
  const FormField.dirty(T value) : this._(value: value, isPure: false);

  /// The value of the form field.
  final T value;

  /// Whether the form field is pure or dirty.
  final bool isPure;

  /// Returns the error if the form field is dirty and invalid.
  /// Returns null if the form field is pure or valid.
  E? get error => isPure ? null : validator(value);

  /// Returns true if the form field is valid, false otherwise.
  bool get isValid => validator(value) == null;

  /// The validation function that determines whether the form field is valid.
  /// Returns null if valid, or an error of type [E] if invalid.
  E? validator(T value);
}
