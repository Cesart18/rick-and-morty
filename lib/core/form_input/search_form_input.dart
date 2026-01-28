import 'package:rick_and_morty/core/interfaces/form_field.dart';

/// Error types for the search form input.
enum SearchFormInputError {
  /// The search query is empty.
  empty,
}

/// A form field for search input.
///
/// This field validates that the search query is not empty.
/// If you don't need validation, you can override [validator] to return null.
class SearchFormInput extends FormField<String, SearchFormInputError> {
  const SearchFormInput.pure() : super.pure('');

  const SearchFormInput.dirty([super.value = '']) : super.dirty();

  @override
  SearchFormInputError? validator(String value) {
    return null;
  }
}
