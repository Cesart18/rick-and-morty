/// {@template paginated_data_status}
/// Enum to represent the status of paginated data loading.
/// {@endtemplate}
enum PaginatedDataStatus {
  /// Initial state before any data is loaded
  initial,
  
  /// Loading first page of data
  waiting,
  
  /// Loading additional pages while data already exists
  waitingMore,
  
  /// Data successfully loaded
  loaded,
  
  /// Error occurred while loading data
  failure;

  /// Returns true if status is [initial]
  bool get isInitial => this == PaginatedDataStatus.initial;
  
  /// Returns true if status is [waiting]
  bool get isWaiting => this == PaginatedDataStatus.waiting;
  
  /// Returns true if status is [waitingMore]
  bool get isWaitingMore => this == PaginatedDataStatus.waitingMore;
  
  /// Returns true if status is [loaded]
  bool get isLoaded => this == PaginatedDataStatus.loaded;
  
  /// Returns true if status is [failure]
  bool get isFailure => this == PaginatedDataStatus.failure;
}
