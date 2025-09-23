<div align="center">
  <img src="https://avatars.githubusercontent.com/u/202675624?s=400&u=dc72a2b53e8158956a3b672f8e52e39394b6b610&v=4" alt="Flutter News App Toolkit Logo" width="220">
  <h1>Key-Value Storage Service</h1>
  <p><strong>The core data models and utilities for the Flutter News App Toolkit.</strong></p>
</div>

<p align="center">
  <img src="https://img.shields.io/badge/coverage-100%25-green?style=for-the-badge" alt="coverage: 100%">
  <a href="https://flutter-news-app-full-source-code.github.io/docs/"><img src="https://img.shields.io/badge/LIVE_DOCS-VIEW-slategray?style=for-the-badge" alt="Live Docs: View"></a>
  <a href="https://github.com/flutter-news-app-full-source-code"><img src="https://img.shields.io/badge/MAIN_PROJECT-BROWSE-purple?style=for-the-badge" alt="Main Project: Browse"></a>
</p>

This `kv_storage_service` package defines an abstract interface (`KVStorageService`) for key-value storage within the [**Flutter News App Full Source Code Toolkit**](https://github.com/flutter-news-app-full-source-code). This promotes consistency and allows for interchangeable storage implementations (like SharedPreferences, Hive, secure storage, etc.), ensuring that application logic remains decoupled from the underlying storage mechanism. It provides a standardized way to interact with local data, crucial for managing user preferences, authentication tokens, and other application settings.

## ⭐ Feature Showcase: Flexible & Robust Local Storage

This package offers a comprehensive set of features for managing local key-value data.

<details>
<summary><strong>🧱 Core Functionality</strong></summary>

### 🚀 Abstract `KVStorageService` Interface
- **`KVStorageService`:** Defines a clear contract for basic key-value operations (read, write, delete) for common data types (`String`, `bool`, `int`, `double`).
- **`clearAll` Method:** Provides a method for efficiently removing all entries from the storage.

### 🔐 Type-Safe Key Management
- **`StorageKey` Enum:** Includes a `StorageKey` enum to avoid magic strings, promoting type safety and reducing errors. Use the `stringValue` getter for the actual key string.

### 🛡️ Standardized Error Handling
- **Custom `StorageException` Hierarchy:** Defines a comprehensive set of custom `StorageException` subclasses (`StorageWriteException`, `StorageReadException`, `StorageDeleteException`, `StorageClearException`, `StorageKeyNotFoundException`, `StorageTypeMismatchException`) to handle specific storage errors. This ensures predictable and consistent error management across the application layers.

### 💉 Implementation Agnostic
- **Interchangeable Implementations:** Designed to be implemented by various storage mechanisms (e.g., `shared_preferences`, `hive`, `flutter_secure_storage`), allowing developers to swap storage solutions without altering application logic.

> **💡 Your Advantage:** You get a meticulously designed, production-quality key-value storage interface that simplifies local data management, ensures type safety, provides robust error handling, and allows for flexible storage implementations. This package accelerates development by providing a solid foundation for local data persistence.

</details>

## 🔑 Licensing

This `kv_storage_service` package is an integral part of the [**Flutter News App Full Source Code Toolkit**](https://github.com/flutter-news-app-full-source-code). For comprehensive details regarding licensing, including trial and commercial options for the entire toolkit, please refer to the main toolkit organization page.
