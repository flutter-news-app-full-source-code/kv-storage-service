# Key-Value Storage Service Interface

![coverage: xx](https://img.shields.io/badge/coverage-94-green)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)
[![License: PolyForm Free Trial](https://img.shields.io/badge/License-PolyForm%20Free%20Trial-blue)](https://polyformproject.org/licenses/free-trial/1.0.0)


A Dart package defining an abstract interface (`KVStorageService`) for key-value storage. This promotes consistency and allows for interchangeable storage implementations (like SharedPreferences, Hive, secure storage, etc.).

## Features ✨

*   Defines a clear contract for basic key-value operations (read, write, delete) for common data types (`String`, `bool`, `int`, `double`).
*   Includes a `clearAll` method for removing all entries.
*   Provides a `StorageKey` enum to avoid magic strings, promoting type safety. Use the `stringValue` getter for the actual key string.
*   Defines a set of custom `StorageException` subclasses (`StorageWriteException`, `StorageReadException`, `StorageDeleteException`, `StorageClearException`, `StorageKeyNotFoundException`, `StorageTypeMismatchException`) to handle specific storage errors.

## Getting Started 🚀

### Prerequisites

*   Dart SDK installed.

### Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  kv_storage_service:
    git:
      url: https://github.com/flutter-news-app-full-source-codet/kv-storage-service.git
      ref: main
```

### Usage

1.  **Implement the Interface:** Create a concrete class that implements `KVStorageService` using your desired storage mechanism (e.g., `shared_preferences`).

    ```dart
    import 'package:kv_storage_service/kv_storage_service.dart';
    import 'package:shared_preferences/shared_preferences.dart';

    class HtKVStorageSharedPreferences implements KVStorageService {
      HtKVStorageSharedPreferences(this._prefs);

      final SharedPreferences _prefs;

      @override
      Future<void> writeString({required String key, required String value}) async {
        await _prefs.setString(key, value);
      }

      @override
      Future<String?> readString({required String key}) async {
        return _prefs.getString(key);
      }

      // ... implement other methods (writeBool, readBool, etc.) ...

      @override
      Future<void> delete({required String key}) async {
        await _prefs.remove(key);
      }

      @override
      Future<void> clearAll() async {
        await _prefs.clear();
      }
    }
    ```

2.  **Use the Service:** Inject or provide an instance of your concrete implementation and use the `KVStorageService` interface methods.

    ```dart
    import 'package:kv_storage_service/kv_storage_service.dart';
    // import 'package:your_package/your_storage_implementation.dart';

    Future<void> main() async {
      // Obtain an instance of your KVStorageService implementation
      // (e.g., using dependency injection or direct instantiation)
      // final prefs = await SharedPreferences.getInstance();
      // final storageService = HtKVStorageSharedPreferences(prefs);

      // Example usage:
      try {
        // Use the stringValue getter for the key
        await storageService.writeBool(
          key: StorageKey.hasSeenOnboarding.stringValue,
          value: true,
        );
        final hasSeenOnboarding = await storageService.readBool(
          key: StorageKey.hasSeenOnboarding.stringValue,
        );
        print('Has seen onboarding: $hasSeenOnboarding');
      } on StorageWriteException catch (e) {
        print('Failed to write: ${e.message}, Key: ${e.key}');
      } on StorageReadException catch (e) {
        print('Failed to read: ${e.message}, Key: ${e.key}');
      } on StorageTypeMismatchException catch (e) {
        print('Type mismatch: ${e.message}, Key: ${e.key}, Expected: ${e.expectedType}, Found: ${e.actualType}');
      } catch (e) {
        // Handle other potential exceptions
        print('An unexpected error occurred: $e');
      }
    }
    ```

## Error Handling

The `KVStorageService` methods may throw specific exceptions derived from `StorageException` upon failure:

*   `StorageWriteException`: Thrown by `write*` methods on failure.
*   `StorageReadException`: Thrown by `read*` methods on general read failure.
*   `StorageDeleteException`: Thrown by `delete` on failure.
*   `StorageClearException`: Thrown by `clearAll` on failure.
*   `StorageKeyNotFoundException`: May be thrown by `delete` if the key doesn't exist (implementation-dependent). `read*` methods typically return `null` or a default value instead.
*   `StorageTypeMismatchException`: Thrown by `read*` methods if the stored data type doesn't match the expected type.

Implementations should handle these exceptions appropriately (e.g., using `try-catch` blocks).

## 🔑 Licensing

This package is source-available and licensed under the [PolyForm Free Trial 1.0.0](LICENSE). Please review the terms before use.

For commercial licensing options that grant the right to build and distribute unlimited applications, please visit the main [**Flutter News App - Full Source Code Toolkit**](https://github.com/flutter-news-app-full-source-code) organization.
