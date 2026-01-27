class PageInfo<T> {
  PageInfo({
    required this.count,
    required this.pages,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final int pages;
  final String? next;
  final String? previous;
  final List<T> results;

  bool get hasNext => next != null;
  bool get hasPrevious => previous != null;
}
