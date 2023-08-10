# <img src="https://github.com/mivalme/pokedex/assets/33386326/b6bb0c02-62e2-42ac-970d-da65e03ec27e" alt="App Logo" width="50"/> Pokedex Flutter App

The Pokedex Flutter App is your ultimate companion for exploring the world of Pokémon! This app allows you to discover and learn about a vast collection of Pokémon creatures. With its user-friendly interface and exciting features, Pokedex Flutter App is a must-have for Pokémon enthusiasts of all ages.

## 📸 Evidence
![ezgif com-video-to-gif-6](https://github.com/mivalme/pokedex/assets/33386326/87a7f44b-bd96-4206-9896-9d0027816e8f) ![ezgif com-video-to-gif-7](https://github.com/mivalme/pokedex/assets/33386326/861a1e4f-801e-46f9-8e56-9e2484b7e08c)


## 🚀 Features

Explore a range of exciting features that the Pokedex Flutter App has to offer:

### Pokémon Catalog
Browse through an extensive catalog of Pokémon species. Discover detailed information about each Pokémon, including its type, abilities, and more.

### Pokémon Details
Dive deeper into the world of a specific Pokémon by accessing its comprehensive details. Learn about its characteristics, health information, and statistics.

### Custom Pokémon Images
Unleash your creativity by customizing your favorite Pokémon images. You can change a Pokémon's image by selecting a picture from your device's gallery or taking a photo using your camera.

### Theme Selection
Personalize your Pokedex experience by choosing between dark and light themes. Whether you prefer an elegant dark mode or a bright light mode, the app adapts to your visual preferences.

### Pokémon Filter by Name
Easily find your favorite Pokémon by filtering them by name. The app's search functionality allows you to quickly locate specific Pokémon in the catalog based on their names.

### Offline Data Viewing

Enjoy uninterrupted access to cached data even when your device is not connected to the internet. The app intelligently watches and displays locally cached data, ensuring you can continue exploring Pokémon even in offline mode.


## 🏛️ Architecture - Clean with BLoC-Cubits

The Pokedex Flutter App is built using a clean architecture pattern that ensures a clear separation of concerns and promotes maintainability and scalability. The architecture consists of the following layers:

- **Data Sources:** Responsible for fetching data from various sources, such as APIs and databases. These data sources provide the raw data needed by the app.

- **Models:** Serve as data transfer objects (DTOs) between the data sources and repositories. Models are responsible for data transformation and conversion.

- **Repositories:** Act as intermediaries between the data sources and the business logic layer. Repositories abstract the data retrieval process and provide a clean API for accessing and managing data.
  
- **Entities:** Represent core domain models that define the structure and behavior of the different objects. They encapsulate the data business rules and data validation.

- **BLoC and Cubits:** Handle the app's business logic, manage state, and orchestrate interactions between the UI and the repositories. BLoCs and Cubits ensure that the UI remains responsive and consistent while managing complex logic.

- **UI:** Represents the user interface of the app. It displays data to the user, captures user input, and interacts with the BLoC or Cubit instances to update the UI state.

The clean architecture and BLoC-Cubits pattern promote code modularity, testability, and maintainability, making it easier to develop and evolve the Pokedex Flutter App.

## 🛢️ Local Storage Database - Using Isar

The Pokedex Flutter App employs the Isar database for local storage. Isar offers several advantages that contribute to the app's efficiency and user experience:

### Fast and Efficient

Isar is designed to provide high-performance data storage and retrieval. Its efficient indexing and querying mechanisms ensure that data operations remain responsive and swift, even when dealing with large datasets.

### Type-Safety

Isar is type-safe, meaning that it integrates seamlessly with Dart's type system. This eliminates runtime errors related to type mismatches and enhances the overall reliability of the app.

### Reactive Queries

Isar supports reactive queries, allowing UI components to automatically update in response to changes in the database. This feature simplifies data synchronization and keeps the UI in sync with the underlying data.

### Minimal Boilerplate

Isar reduces the amount of boilerplate code required for data manipulation. Its concise API and intuitive syntax streamline database interactions and make it easier to work with persistent data.

### Data Integrity

Isar ensures data integrity through its transactional and ACID-compliant design. This guarantees that data remains consistent and accurate, even in the presence of concurrent operations or app crashes.


## 🛠️ Main Dependencies

The Pokedex Flutter App utilizes several main dependencies to enhance its functionality and user experience:

### [animate_do](https://pub.dev/packages/animate_do)

The `animate_do` package provides a variety of animations and transitions that add visual appeal to the app. It allows for easy implementation of stunning animations and delightful UI interactions.

### [dio](https://pub.dev/packages/dio)

The `dio` package is a powerful HTTP client for making network requests. It simplifies the process of sending and receiving data from APIs and external services, contributing to efficient data retrieval and synchronization.

### [go_router](https://pub.dev/packages/go_router)

The `go_router` package is a flexible and feature-rich routing library that enhances navigation within the app. It enables dynamic routing and deep linking, making it easy to manage different app screens and user flows.

### [isar](https://pub.dev/packages/isar)

The `isar` package is a fast, efficient, and type-safe NoSQL database for Flutter. It simplifies data persistence and storage, enabling seamless data management and access throughout the app.

### [flutter_bloc](https://pub.dev/packages/flutter_bloc) and [equatable](https://pub.dev/packages/equatable)

The `flutter_bloc` package provides a powerful state management solution based on the BLoC pattern. Paired with `equatable`, it simplifies state comparison and helps prevent unnecessary UI updates, enhancing app performance and reliability.


## 🛠️ Installation

> Get started with the Pokedex Flutter App in just a few steps:

```bash
# Clone the repository
git clone https://github.com/mivalme/pokedex.git

# Navigate to the project directory
cd yourapp

# Install dependencies
flutter pub get

# Run the app
flutter run
