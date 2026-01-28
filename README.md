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
│   ├── blocs/               # Global BLoCs (CharactersBloc, SearchedCharactersBloc)
│   ├── errors/              # Error definitions (domain, infrastructure, presentation)
│   ├── http/                # HTTP client configuration (Dio)
│   ├── interfaces/          # Abstract classes (FormField, UseCases)
│   ├── theme/               # App theming
│   ├── widgets/             # Reusable UI components (CustomDropdown, CustomTextFormField)
│   └── enums/               # Shared enums (PaginatedDataStatus)
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
│       │   ├── base/        # Page structure, listeners, and body views
│       │   ├── bloc/        # Local page state management (_HomeBloc)
│       │   └── widgets/     # UI components (cards, filters, app bar)
│       ├── character_details/ # Character detail screen
│       └── router/          # Navigation configuration (GoRouter)
```

### Architecture Layers

| Layer | Responsibility |
|-------|----------------|
| **Presentation** | UI widgets, BLoC for state management, user interactions |
| **Domain** | Business entities, use cases, repository interfaces |
| **Infrastructure** | API calls, DTOs, repository implementations |

### Key Design Decisions

- **BLoC Pattern**: Used for state management with `flutter_bloc`
- **Result Type**: Functional error handling using `Result<T, E>` instead of exceptions
- **Repository Pattern**: Abstraction between domain and data layers
- **Dependency Injection**: Clean separation allows easy testing and mocking
- **Part/Part Of Pattern**: Organizing related widgets within the same page context

## Request Cancellation

Request cancellation is implemented using Dio's `CancelToken` to prevent stale data from updating the UI when filters or search parameters change.

### Implementation Details

**Locations**: 
- `lib/core/blocs/characters/characters_bloc.dart`
- `lib/core/blocs/searched_characters/searched_characteres_bloc.dart`

```dart
class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CancelToken? _cancelToken;
  GetCharactersParams _currentParams = GetCharactersParams();

  void _cancelCurrentRequest() {
    _cancelToken?.cancel(HttpConstants.cancelRequestMessage);
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

1. User changes a filter (status/gender) or modifies search inputs
2. `CharactersNextPageRequested` or `SearchedCharactersNextPageRequested` event is dispatched
3. BLoC detects parameter change and calls `_cancelCurrentRequest()`
4. Previous `CancelToken` is cancelled, new one is created
5. New request is made with the fresh token
6. If cancelled request completes, error is silently ignored based on error message check

### Propagation Through Layers

The `CancelToken` is passed as a method parameter through all layers:

```
BLoC → UseCase → Repository → DataSource (API) → Dio
```

This design keeps the `CancelToken` separate from business parameters and allows cancellation at any layer.

## Features

### Implemented
- [x] Character search by name, species, and type (three separate inputs)
- [x] Filter by status (Alive, Dead, Unknown, All)
- [x] Filter by gender (Male, Female, Genderless, Unknown, All)
- [x] Grid view showing character image and name
- [x] Infinite scroll pagination for main list and search results
- [x] Loading states (initial load, pagination with "loading more" indicator)
- [x] Empty state ("No results found")
- [x] Error handling (network failures, API errors, 404)
- [x] Request cancellation on filter/search changes
- [x] Character detail view
  - Character image, name, status, species, type, gender
  - Last known location
  - First seen location
- [x] Debounced search inputs (300ms)
- [x] Search state caching (inputs preserved when closing/reopening search)
- [x] Scroll to top functionality (tap app bar title)
- [x] Clear individual search inputs
- [x] Clear all filters button

### UI/UX Features
- Two distinct views: main character list and search results
- Search inputs appear in app bar with smooth animation
- Filters applied to both main list and search results
- Responsive grid layout (2 columns)
- Character status indicator with color coding
- Navigation to detail view via character card tap

## Search & Filter Logic

### Main Character List (`_CharactersList`)
- Displays all characters from the API
- Respects status and gender filters
- Supports infinite scroll pagination
- Reloads when filters change

### Search Results (`_SearchedCharactersList`)
- Only shown when search inputs are open AND at least one input has content
- Searches by name, species, and/or type simultaneously
- Also respects status and gender filters
- Independent pagination from main list
- Uses `restartable()` transformer to cancel previous searches

### Filter Behavior
- Filters persist across both views
- Changing filters triggers a new API request with page reset
- "Clear" button resets both status and gender to "All"

## Assumptions & Tradeoffs

### Assumptions

1. **Network availability**: The app assumes the device has network connectivity. Offline mode is not implemented.

2. **API stability**: The Rick and Morty API structure is assumed to remain stable.

3. **Pagination behavior**: The API returns 20 items per page. Infinite scroll triggers at 80% scroll position.

4. **Search debounce**: 300ms debounce provides good balance between responsiveness and reducing API calls.

5. **"All" filter option**: When "All" is selected for status or gender, the parameter is sent as `null` to the API to fetch unfiltered results.

### Tradeoffs

| Decision | Tradeoff |
|----------|----------|
| **BLoC over Riverpod** | More boilerplate but clearer separation of events/states |
| **No local caching** | Simpler implementation but requires network for each search. Search state is cached in memory. |
| **Droppable transformer for main list** | Prevents duplicate pagination requests but may drop rapid scroll events (acceptable) |
| **Restartable transformer for search** | Cancels previous search requests for latest input; better UX for search |
| **Filters in _HomeBloc** | Keeps filter state local to home screen; simpler than global state |
| **Part/Part Of structure** | Reduces file count and keeps related widgets together, but files can become large |
| **Two separate BLoCs for lists** | CharactersBloc and SearchedCharacteresBloc handle different data; more memory but clearer separation |
| **CancelToken as method parameter** | Passed separately from business logic params; more flexible than embedding in params |

## UI Layer Does Not Call HTTP Directly

The UI layer (`lib/src/presentation/`) does **not** make HTTP calls directly. All networking is handled by:

1. **BLoCs** (`lib/core/blocs/`): Dispatch use case calls
2. **Use Cases** (`lib/src/domain/uses_cases/`): Orchestrate business logic
3. **Repositories** (`lib/src/infrastructure/repository/`): Implement repository interfaces
4. **Data Sources** (`lib/src/infrastructure/data_sources/`): Make HTTP requests via `HttpManager` (Dio wrapper)

This separation ensures:
- Testability (mock repositories/data sources)
- Reusability (use cases can be called from different BLoCs)
- Single responsibility (UI only handles presentation logic)

## Dependencies

| Package | Purpose |
|---------|---------|
| `flutter_bloc` | State management |
| `bloc_concurrency` | Event transformers (droppable, restartable) |
| `dio` | HTTP client with cancellation support |
| `equatable` | Value equality for states/events |
| `cached_network_image` | Image caching |
| `go_router` | Navigation with path parameters |

## License

This project is for evaluation purposes only.
