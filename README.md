# Rick and Morty Character Explorer

A Flutter application that allows users to search and filter Rick and Morty characters using the [Rick and Morty API](https://rickandmortyapi.com/).

## How to Run

### Prerequisites
- Flutter SDK (3.0+)
- Dart SDK (3.0+)

### Steps

```bash
# Clone the repository
git clone <repository-url>
cd rick_and_morty

# Install dependencies
flutter pub get

# Run the app
flutter run
```

## Code Structure

The project follows **Clean Architecture** principles with a clear separation of concerns:

```
lib/
├── core/                    # Shared utilities and base classes
│   ├── blocs/               # Global BLoCs (CharactersBloc)
│   ├── errors/              # Error definitions (domain, infrastructure, presentation)
│   ├── http/                # HTTP client configuration (Dio)
│   ├── interfaces/          # Abstract classes (FormField, UseCases)
│   ├── theme/               # App theming
│   ├── widgets/             # Reusable UI components
│   └── pkgs/afp/            # Result type for functional error handling
│
├── src/
│   ├── domain/              # Business logic layer
│   │   ├── entities/        # Domain models (Character, PageInfo)
│   │   ├── params/          # Use case parameters
│   │   ├── repository/      # Repository interfaces
│   │   └── uses_cases/      # Application use cases
│   │
│   ├── infrastructure/      # Data layer
│   │   ├── data_sources/    # API clients (CharacterApiRest)
│   │   ├── models/          # DTOs and request models
│   │   └── repository/      # Repository implementations
│   │
│   └── presentation/        # UI layer
│       ├── home/            # Home screen (search, filters, grid)
│       │   ├── base/        # Page structure and listeners
│       │   ├── bloc/        # Local page state management
│       │   └── widgets/     # UI components (cards, filters, app bar)
│       └── router/          # Navigation configuration
```

### Architecture Layers

| Layer | Responsibility |
|-------|----------------|
| **Presentation** | UI widgets, BLoC for local state, user interactions |
| **Domain** | Business entities, use cases, repository interfaces |
| **Infrastructure** | API calls, DTOs, repository implementations |

### Key Design Decisions

- **BLoC Pattern**: Used for state management with `flutter_bloc`
- **Result Type**: Functional error handling using `Result<T, E>` instead of exceptions
- **Repository Pattern**: Abstraction between domain and data layers
- **Dependency Injection**: Clean separation allows easy testing and mocking

## Request Cancellation

Request cancellation is implemented using Dio's `CancelToken` to prevent stale data from updating the UI when filters change.

### Implementation Details

**Location**: `lib/core/blocs/characters/characters_bloc.dart`

```dart
class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CancelToken? _cancelToken;
  GetCharactersParams _currentParams = GetCharactersParams();

  void _cancelCurrentRequest() {
    _cancelToken?.cancel('New search initiated');
    _cancelToken = CancelToken();
  }

  Future<void> _onNextPageRequested(...) async {
    // Check if filters changed
    final filtersChanged = event.gender != _currentParams.gender ||
                           event.status != _currentParams.status;

    if (filtersChanged) {
      _cancelCurrentRequest();  // Cancel previous request
      emit(const CharactersState());  // Reset state
    }
    
    // Pass token to use case
    await _fetchCharacters(emit, params: params, cancelToken: _cancelToken);
  }
}
```

### Flow

1. User changes a filter (status/gender)
2. `CharactersNextPageRequested` event is dispatched
3. BLoC detects filter change and calls `_cancelCurrentRequest()`
4. Previous `CancelToken` is cancelled, new one is created
5. New request is made with the fresh token
6. If cancelled request completes, error is silently ignored

### Propagation Through Layers

The `CancelToken` is passed through all layers:

```
BLoC → UseCase → Repository → DataSource (API) → Dio
```

## Features

- [x] Character search by name
- [x] Filter by status (Alive, Dead, Unknown)
- [x] Filter by gender (Male, Female, Genderless, Unknown)
- [x] Grid view with character image and name
- [x] Infinite scroll pagination
- [x] Loading states (initial load, pagination)
- [x] Empty state ("No results found")
- [x] Error handling
- [x] Request cancellation on filter change
- [ ] Character detail view (planned)
- [ ] Species/Type filters (planned)

## Assumptions & Tradeoffs

### Assumptions

1. **Network availability**: The app assumes the device has network connectivity. Offline mode is not implemented.

2. **API stability**: The Rick and Morty API structure is assumed to remain stable.

3. **Pagination behavior**: The API returns 20 items per page. Infinite scroll triggers at 80% scroll position.

### Tradeoffs

| Decision | Tradeoff |
|----------|----------|
| **BLoC over Riverpod** | More boilerplate but clearer separation of events/states |
| **No local caching** | Simpler implementation but requires network for each search |
| **Droppable transformer** | Prevents duplicate requests but may drop valid rapid inputs |
| **Filters in HomeBloc** | Keeps filter state local to home screen; alternative would be global state |

### Technical Debt

- Search input debounce is implemented but not yet connected to the API
- Species and Type filters are supported by the API layer but not exposed in UI

## Dependencies

| Package | Purpose |
|---------|---------|
| `flutter_bloc` | State management |
| `bloc_concurrency` | Event transformers (droppable) |
| `dio` | HTTP client with cancellation support |
| `equatable` | Value equality for states/events |
| `cached_network_image` | Image caching |
| `go_router` | Navigation |

## License

This project is for evaluation purposes only.
