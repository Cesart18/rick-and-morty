import 'package:rick_and_morty/core/typedefs/data_map.dart';
import 'package:rick_and_morty/src/domain/domain.dart';

class PageInfoDtoModel<T> extends PageInfo<T> {
  PageInfoDtoModel({
    required super.count,
    required super.pages,
    required super.next,
    required super.previous,
    required super.results,
  });

  /// Creates a [PageInfoDtoModel] from API response.
  ///
  /// The [data] should contain:
  /// - `info`: pagination metadata (count, pages, next, prev)
  /// - `results`: list of items to be mapped
  ///
  /// The [mapper] function maps each item in results to type [T].
  ///
  /// Example:
  /// ```dart
  /// final response = PageInfoDtoModel<Character>.fromMap(
  ///   map: json,
  ///   fromMap: CharacterDtoModel.fromMap,
  /// );
  /// ```
  factory PageInfoDtoModel.fromMap({
    required DataMap data,
    required T Function(DataMap) mapper,
  }) {
    final info = data['info'] as DataMap? ?? {};
    final resultsList = data['results'] as List<dynamic>? ?? [];

    final count = (info['count'] as num?)?.toInt() ?? 0;
    final pages = (info['pages'] as num?)?.toInt() ?? 0;
    final next = info['next'] as String?;
    final prev = info['prev'] as String?;
    final results = resultsList.map((item) => mapper(item as DataMap)).toList();

    return PageInfoDtoModel(
      count: count,
      pages: pages,
      next: next,
      previous: prev,
      results: results,
    );
  }
}
