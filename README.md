# Movie Task App 🎬

A Flutter application that displays popular movies from The Movie Database (TMDb) API with search functionality and detailed movie information.

## Features ✨

- 📱 Display popular movies in a responsive grid layout (2 columns)
- 🔍 Search movies by title
- 📄 Movie details screen with:
  - Movie poster with Hero animation
  - Title, release date, and rating
  - Vote count and runtime
  - Overview/description
  - Genres
- 🔄 Pull-to-refresh functionality
- ⚡ Pagination (loads first 2 pages of popular movies - 40 movies total)
- 🎨 Clean and modern UI design
- 💾 Cached network images for better performance

## Screenshots 📸

### Splash Screen
![Splash Screen](screenshots/splash.png)

### Movies List Screen
![Movies List](screenshots/movie_list.png)

### Movie Details Screen
![Movie Details](screenshots/movie_details.png)

## Setup Instructions 🚀

### Prerequisites

- Flutter SDK 
- Dart SDK
- Android Studio / VS Code
- A TMDb API key

### Getting Your TMDb API Key

1. Go to [The Movie Database (TMDb)](https://www.themoviedb.org/)
2. Create an account or sign in
3. Go to Settings > API
4. Request an API key (it's free!)
5. Copy your API key

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/salsabilelshiekh2022/Movie-task
   cd movie_task
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Create `.env` file**
   
   Create a `.env` file in the root directory of the project (same level as `pubspec.yaml`):
   ```env
   API_KEY=your_api_key_here
   BASE_URL=https://api.themoviedb.org/3
   ```

   Replace `your_api_key_here` with your actual TMDb API key.

   **Important:** The `.env` file is already added to `.gitignore` to keep your API key secure.

4. **Generate code**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## Project Structure 📁

```
lib/
├── core/
│   ├── database/
│   │   ├── cache/          # Local storage (Hive, Secure Storage)
│   │   └── network/        # API consumer (Dio)
│   ├── di/                 # Dependency Injection (GetIt, Injectable)
│   ├── enums/              # App enums (RequestStatus, etc.)
│   ├── helper/             # Extensions and helpers
│   ├── routing/            # App routing
│   └── theme/              # App theme and colors
│
├── features/
│   ├── movies/
│   │   ├── data/
│   │   │   ├── models/     # Data models (Movie, MovieDetails, etc.)
│   │   │   └── repo/       # Repository (Data layer)
│   │   └── presentation/
│   │       ├── controller/ # ViewModel/Cubit (Business logic)
│   │       │   ├── movies_cubit/        # Movies list state management
│   │       │   └── movie_details_cubit/ # Movie details state management
│   │       └── views/      # UI (View layer)
│   │           ├── widgets/             # Reusable widgets
│   │           └── movie_details_view.dart
│   │           └── movies_view.dart
│   │
│   └── splash/
│       └── presentations/
│           └── views/      # Splash screen
│
├── generated/              # Auto-generated files
└── main.dart              # App entry point
```

## Architecture 🏗️

This app follows the **MVVM (Model-View-ViewModel)** architecture pattern:

### MVVM Layers

1. **Model (Data Layer)**
   - Data models (`MovieModel`, `MovieDetailsModel`, `PaginatedMovies`)
   - Repository interfaces and implementations
   - API communication
   - Data transformation and mapping

2. **View (Presentation Layer)**
   - UI components (Screens and Widgets)
   - User interface rendering
   - User interactions (tap, scroll, etc.)
   - Observes ViewModel state changes

3. **ViewModel (Controller/Cubit)**
   - Business logic
   - State management using Cubit
   - Data fetching and processing
   - Exposing data to the View through states

### State Management

The app uses **flutter_bloc** with **Cubit** as the ViewModel layer:

- **MoviesCubit**: Manages popular movies list, search functionality, and pagination
- **MovieDetailsCubit**: Manages individual movie details fetching and state

### Benefits of MVVM in this project:

- **Separation of Concerns**: Clear separation between UI, business logic, and data
- **Testability**: ViewModels can be tested independently
- **Reusability**: Models and ViewModels can be reused across different views
- **Maintainability**: Easy to maintain and extend features

### Data Flow

```
View → ViewModel (Cubit) → Repository → API
                ↓
View ← State Updates ← ViewModel (Cubit)
```

1. **View** triggers an action (e.g., user taps on a movie)
2. **ViewModel (Cubit)** processes the action and calls the repository
3. **Repository** fetches data from the API
4. **ViewModel** updates its state
5. **View** rebuilds based on the new state

### Dependency Injection

**GetIt** with **Injectable** is used for dependency injection:
- Repository instances are registered as singletons
- Cubits are created with repository dependencies
- Makes the code testable and loosely coupled

### API Integration

- **Dio** for HTTP requests
- **DioConsumer** wrapper for consistent API calls
- **Either** (from dartz) for functional error handling
- Request/Response logging in debug mode with **PrettyDioLogger**

## Packages Used 📦

### Core Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_bloc` | ^9.1.1 | State management |
| `dio` | ^5.9.0 | HTTP client |
| `get_it` | ^8.2.0 | Dependency injection |
| `injectable` | ^2.5.2 | Code generation for DI |
| `dartz` | ^0.10.1 | Functional programming (Either, Option) |
| `equatable` | ^2.0.7 | Value equality |
| `cached_network_image` | ^3.4.1 | Image caching |
| `flutter_dotenv` | ^6.0.0 | Environment variables |
| `hive_flutter` | ^1.1.0 | Local storage |
| `flutter_secure_storage` | ^9.2.4 | Secure storage |
| `easy_localization` | ^3.0.8 | Internationalization |

### Development Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `build_runner` | ^2.3.3 | Code generation |
| `injectable_generator` | ^2.9.0 | DI code generation |
| `flutter_lints` | ^5.0.0 | Linting rules |

### Utilities

| Package | Version | Purpose |
|---------|---------|---------|
| `pretty_dio_logger` | ^1.4.0 | Network logging |
| `requests_inspector` | ^5.1.1 | Network debugging |
| `internet_connection_checker` | ^3.0.1 | Network connectivity |
| `flutter_animate` | ^4.5.2 | Animations |

## API Endpoints Used 🌐

### Base URL
```
https://api.themoviedb.org/3
```

### Endpoints

1. **Popular Movies**
   ```
   GET /movie/popular?api_key={API_KEY}&page={page}
   ```

2. **Search Movies**
   ```
   GET /search/movie?api_key={API_KEY}&query={search_term}&page={page}
   ```

3. **Movie Details**
   ```
   GET /movie/{movie_id}?api_key={API_KEY}
   ```

## Key Features Implementation 💡

### Pagination
- Loads 2 pages of popular movies (20 movies per page = 40 total)
- Automatic loading when scrolling to 80% of the list
- Loading indicator at the bottom during pagination

### Search
- Debounced search (500ms delay)
- Real-time search results
- Clear button to return to popular movies
- Pagination support for search results

### Caching
- Images cached using `cached_network_image`
- Placeholder images during loading
- Error fallback images

### Performance
- `GridView.builder` for efficient rendering
- Lazy loading of images
- Optimized API calls with pagination

## Security 🔒

- API key stored in `.env` file
- `.env` file excluded from Git via `.gitignore`
- Uses `flutter_secure_storage` for sensitive data
- Environment variables loaded at app startup

## Error Handling 🛠️

- Network error handling with user-friendly messages
- Retry mechanisms for failed requests
- Loading states and error states
- Proper null safety throughout the app

