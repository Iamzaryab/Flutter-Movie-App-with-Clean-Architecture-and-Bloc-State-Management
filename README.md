# Flutter Movie App with Clean Architecture and Bloc State Management - FilmKu

![Flutter Movie Application](/screenshots/screenshots.png)

[Watch the Video Demo](https://youtu.be/i4VrO4GgkuM?si=pTsVLC43wwNdvo0E)

FilmKu is an open-source Flutter movie application that exemplifies Clean architecture principles
while leveraging
the power of [Bloc](https://pub.dev/packages/flutter_bloc) for state management.
The app utilizes the [Movies Database API](https://developer.themoviedb.org/docs) to provide users
with an immersive movie discovery experience. With dependency injection powered
by [get_it](https://pub.dev/packages/get_it),
remote API calls managed by [dio](https://pub.dev/packages/dio), and local data storage
utilizing [Isar](https://pub.dev/packages/isar),
FilmKu offers a comprehensive solution for movie enthusiasts.
if you want to check same implementation in RiverPod check
this [Repository](https://github.com/Iamzaryab/Movie-Application-Flutter-Clean-Architecture-RiverPod)


[//]: # (Insert Getting Started Hyperlink Here)
Jump to the [Getting Started](#getting-started) section below to set up the application on your
local machine.

## Features

- **Browse Movies:** Dive into an expansive collection of films organized by popularity, top
  ratings.

- **Endless Scrolling:** Enjoy seamless and endless browsing of movies with the addition of an
  endless scrolling feature.

- **Movie Details:** Access comprehensive information for each movie, including release dates,
  ratings, casts, and more.

- **Favorites:** Bookmark movies as favorites for quick access and reference.

- **Responsive Design:** FilmKu's interface adapts seamlessly to various devices and screen sizes,
  powered by [flutter_screenutil](https://pub.dev/packages/flutter_screenutil).

- **Offline Access:** Enjoy access to recently viewed movies even without an active internet
  connection using [Isar](https://pub.dev/packages/isar).

- **Loading Animations:** Experience smooth loading animations
  with [Flutter Shimmer](https://pub.dev/packages/shimmer) as the app fetches data.

## Architecture and Libraries Used

The Flutter Movie Application embraces a variety of architectural principles and libraries to
enhance development and maintainability:

### Clean Architecture

The project follows the principles of clean architecture, categorizing code into distinct layers:

- **Data Layer:** This contains data sources and repository implementations, offering a clear
  separation between data retrieval methods.

- **Domain Layer:** The domain layer includes abstract repositories and use cases, representing the
  core business logic of the application.

- **Presentation Layer:** Here, you'll find the state management [Bloc](https://pub.dev/packages/flutter_bloc) implementation,screens and
  widgets responsible for rendering the user interface.

### State Management

- We are employing **[Bloc](https://pub.dev/packages/flutter_bloc)** for our state management
  solution.
- If you want to check Riverpod implementation for same application, you can review the code in
  this [Repository](https://github.com/Iamzaryab/Movie-Application-Flutter-Clean-Architecture-RiverPod)

### Dependency Injection

[get_it](https://pub.dev/packages/get_it) is used for dependency injection, ensuring the application
is decoupled and modular.

### Networking

[Dio](https://pub.dev/packages/dio) is employed to facilitate remote API calls, enhancing the
efficiency of data retrieval.

### Local Database

[Isar](https://pub.dev/packages/isar) is utilized for local database storage, enabling seamless
offline access to previously viewed movies.

### Functional Programming

[Dartz](https://pub.dev/packages/dartz) library is integrated to introduce functional programming concepts, resulting in more
predictable and expressive code.

### Code Generation

[Freezed](https://pub.dev/packages/freezed) is employed for code generation, simplifying the creation of data classes and reducing
boilerplate code.

### Other Libraries

- [flutter_svg](https://pub.dev/packages/flutter_svg) for loading SVG images.
- [equatable](https://pub.dev/packages/equatable) for efficient class comparisons.
- [go_router](https://pub.dev/packages/go_router) for handling application routing.
- [cached_network_image](https://pub.dev/packages/cached_network_image) for image caching.
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) for managing environment variables.

### Folder Structure

```
lib
├── app
│ ├── app_colors.dart 
│ ├── app_configs.dart
│ ├── app_constants.dart
│ ├── app_data.dart
│ ├── app_dimens.dart
│ ├── app_globals.dart
│ ├── app_strings.dart
│ ├── app_text_styles.dart
│ ├── app_text_theme.dart
│ └── app_theme.dart
├── core
│ ├── app.dart
│ ├── app_env.dart
│ └── app_observers.dart
├── di
│ └── Injector.dart
├── features
│ ├── bookmarks
│ │ ├── data
│ │ │ ├── datasource
│ │ │ │ ├── local
│ │ │ │ │ ├── bookmark_local_datasource.dart
│ │ │ │ │ └── bookmark_local_datasource_impl.dart
│ │ │ │ └── remote
│ │ │ │     └── bookmark_remote_datasource.dart
│ │ │ └── repositories
│ │ │     └── bookmark_repository_impl.dart
│ │ ├── domain
│ │ │ ├── repositories
│ │ │ │ └── bookmark_repository.dart
│ │ │ └── use_cases
│ │ │     ├── get_bookmarks_use_case.dart
│ │ │     └── remove_bookmarks_use_case.dart
│ │ └── presentation
│ │     ├── bloc
│ │     │ ├── bookmark_bloc.dart
│ │     │ ├── bookmark_event.dart
│ │     │ └── bookmark_state.dart
│ │     ├── screens
│ │     │ ├── bookmark_screen.dart
│ │     │ └── bookmark_screen_view.dart
│ │     └── widgets
│ │         └── bookmark_card.dart
│ ├── home
│ │ ├── data
│ │ │ ├── datasource
│ │ │ │ ├── local
│ │ │ │ │ ├── home_local_datasource.dart
│ │ │ │ │ └── home_local_datasource_impl.dart
│ │ │ │ └── remote
│ │ │ │     ├── home_remote_data_source.dart
│ │ │ │     └── home_remote_datasource.dart
│ │ │ └── repositories
│ │ │     └── home_repository_impl.dart
│ │ ├── domain
│ │ │ ├── repositories
│ │ │ │ └── home_repository.dart
│ │ │ └── use_cases
│ │ │     ├── fetch_and_cache_genre_use_case.dart
│ │ │     ├── fetch_and_cache_movies_use_case.dart
│ │ │     ├── fetch_cached_genre_use_case.dart
│ │ │     └── fetch_cached_movies_use_case.dart
│ │ └── presentation
│ │     ├── bloc
│ │     │ ├── genre
│ │     │ │ ├── genre_bloc.dart
│ │     │ │ ├── genre_event.dart
│ │     │ │ └── genre_state.dart
│ │     │ └── movie
│ │     │     ├── movie_bloc.dart
│ │     │     ├── movie_event.dart
│ │     │     └── movie_state.dart
│ │     ├── screens
│ │     │ ├── home_page.dart
│ │     │ ├── home_page_view.dart
│ │     │ ├── home_screen.dart
│ │     │ └── home_screen_view.dart
│ │     └── widgets
│ │         ├── now_showing_card.dart
│ │         ├── now_showing_movies.dart
│ │         ├── popular_card.dart
│ │         ├── popular_movies.dart
│ │         └── shimmer
│ │             ├── now_showing_shimmer.dart
│ │             └── popular_shimmer.dart
│ ├── movie_detail
│ │ ├── data
│ │ │ ├── datasource
│ │ │ │ ├── local
│ │ │ │ │ ├── movie_detail_local_datasource.dart
│ │ │ │ │ └── movie_detail_local_datasource_impl.dart
│ │ │ │ └── remote
│ │ │ │     ├── movie_detail_remote_data_source.dart
│ │ │ │     └── movie_detail_remote_datasource.dart
│ │ │ └── repositories
│ │ │     └── movie_detail_repository_impl.dart
│ │ ├── domain
│ │ │ ├── repositories
│ │ │ │ └── movie_detail_repository.dart
│ │ │ └── use_cases
│ │ │     ├── add_bookmark_use_case.dart
│ │ │     ├── get_casts_use_case.dart
│ │ │     ├── get_movie_details_use_case.dart
│ │ │     ├── is_bookmark_use_case.dart
│ │ │     └── remove_bookmark_use_case.dart
│ │ └── presentation
│ │     ├── bloc
│ │     │ ├── casts
│ │     │ │ ├── casts_bloc.dart
│ │     │ │ ├── casts_events.dart
│ │     │ │ └── casts_state.dart
│ │     │ └── movie_detail
│ │     │     ├── movie_detail_bloc.dart
│ │     │     ├── movie_detail_event.dart
│ │     │     └── movie_detail_state.dart
│ │     ├── screen
│ │     │ ├── movie_detail_screen.dart
│ │     │ └── movie_detail_screen_view.dart
│ │     └── widget
│ │         ├── cast_item.dart
│ │         ├── casts_list.dart
│ │         ├── movie_detail_body.dart
│ │         ├── movie_detail_header.dart
│ │         └── shimmer
│ │             └── movie_detail_shimmer.dart
│ └── notifications
│     ├── data
│     │ ├── datasource
│     │ │ ├── local
│     │ │ │ ├── notifications_local_datasource.dart
│     │ │ │ └── notifications_local_datasource_impl.dart
│     │ │ └── remote
│     │ │     ├── notifications_remote_datasource.dart
│     │ │     └── notifications_remote_datasource_impl.dart
│     │ ├── models
│     │ │ ├── notification.dart
│     │ │ ├── notification.freezed.dart
│     │ │ └── notification.g.dart
│     │ ├── repositories
│     │ └── repository
│     │     └── notifications_repository_impl.dart
│     ├── domain
│     │ ├── repository
│     │ │ └── notifications_repository.dart
│     │ └── use_cases
│     │     ├── clear_all_notifications_use_case.dart
│     │     └── get_all_notifications_use_case.dart
│     └── presentation
│         ├── bloc
│         │ ├── notification_bloc.dart
│         │ ├── notification_event.dart
│         │ └── notification_state.dart
│         ├── screen
│         │ ├── notification_screen.dart
│         │ └── notification_screen_view.dart
│         └── widget
│             └── notification_item.dart
├── main.dart
├── models
│ ├── domain
│ │ ├── movies.dart
│ ├── response
│ │ ├── casts_response.dart
│ │ ├── genre_response.dart
│ │ ├── movie_detail_response.dart
│ │ ├── movies_response.dart
│ │ └── response.dart
│ ├── cast.dart
│ ├── casts.dart
│ ├── genre.dart
│ ├── genres.dart
│ ├── message.dart
│ ├── movie.dart
│ ├── movie_detail.dart
├── routes
│ └── app_router.dart
└── shared
    ├── bloc
    │ └── theme
    │     ├── theme_bloc.dart
    │     ├── theme_event.dart
    │     └── theme_state.dart
    ├── extensions
    │ └── build_context_extensions.dart
    ├── local
    │ ├── cache
    │ │ ├── local_db.dart
    │ │ └── local_db_impl.dart
    │ └── shared_prefs
    │     ├── shared_pref.dart
    │     └── shared_pref_impl.dart
    ├── network
    │ ├── dio_network_service.dart
    │ ├── exception
    │ │ └── mixin
    │ │     └── network_handler_mixin.dart
    │ ├── network_service.dart
    │ ├── network_values.dart
    │ └── remote.dart
    ├── util
    │ ├── app_exception.dart
    │ └── message_queue.dart
    ├── utils
    └── widgets
        ├── animated_scroll_view_item.dart
        ├── app_bar.dart
        ├── app_bottom_navigation.dart
        ├── app_drawer.dart
        ├── drawer_item.dart
        ├── genre_chip.dart
        ├── heart_button.dart
        ├── rating_bar.dart
        ├── see_more.dart
        ├── shimmers
        │ └── skeleton.dart
        └── swipe_to_dismiss_wrap.dart
```

## Getting Started

To set up the FilmKu Flutter Movie Application on your local machine, follow these steps:

1. **Clone the Repository:** Open a terminal and run the following command to clone the project
   repository:

   ```bash
   git clone https://github.com/Iamzaryab/Movie-Application-Flutter-Clean-Architecture.git
2. Create a `.env` file in the root directory of the project. Add the following lines,
   replacing `ADD YOUR API KEY` with your actual API key. You can generate your API key
   from [here](https://www.themoviedb.org/settings/api):

   ```
   BASE_URL=https://api.themoviedb.org/3/
   API_KEY=ADD YOUR API KEY
   ```

3. Install project dependencies:
   ```bash
   flutter get pub
   ```
4. Generate necessary code using `build_runner`:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```


Now you're ready to explore the FilmKu Flutter Movie Application! Depending on your chosen state management, you can delve into the implementation. For any questions or issues, refer to the documentation or seek assistance from the project community.

Feel free to explore the various features and functionalities outlined in the README.

## Contributions

Contributions are welcome! If you want to contribute to the Flutter Movie Application, simply follow
these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix: `git checkout -b feature/your-feature-name`
   or `bugfix/issue-number`.
3. Make your changes and commit them: `git commit -m 'Add some feature'`.
4. Push your changes to the branch: `git push origin feature/your-feature-name`.
5. Open a pull request against the `master` branch of the original repository.

Your contributions help enhance the FilmKu Flutter Movie Application. Feel free to propose new
features, improve existing ones, or fix bugs. Together, we can make FilmKu even better!

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

- The Movies Database API provides the movie data that powers the application.

---

Experience the world of movies with the Flutter Movie Application! If you encounter issues or have
suggestions, please feel free to create an issue on the GitHub repository. Enjoy exploring and
watching movies with this versatile and feature-rich application!
