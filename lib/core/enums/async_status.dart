/// Status of async operations
abstract class AsyncStatus {}

/// Status of fetch async operations
enum FetchAsyncStatus implements AsyncStatus {
  initial,
  waiting,
  created,
  loaded,
  reloading,
  updating,
  failure;

  bool get isInitial => this == FetchAsyncStatus.initial;
  bool get isWaiting => this == FetchAsyncStatus.waiting;
  bool get isCreated => this == FetchAsyncStatus.created;
  bool get isLoaded => this == FetchAsyncStatus.loaded;
  bool get isReloading => this == FetchAsyncStatus.reloading;
  bool get isUpdating => this == FetchAsyncStatus.updating;
  bool get isFailure => this == FetchAsyncStatus.failure;
}

/// Status of send async operations
enum SendAsyncStatus implements AsyncStatus {
  initial,
  waiting,
  sent,
  failure;

  bool get isInitial => this == SendAsyncStatus.initial;
  bool get isWaiting => this == SendAsyncStatus.waiting;
  bool get isSent => this == SendAsyncStatus.sent;
  bool get isFailure => this == SendAsyncStatus.failure;
}
