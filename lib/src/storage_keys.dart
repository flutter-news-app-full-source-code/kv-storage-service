import 'package:kv_storage_service/src/kv_storage_service.dart';

/// {@template storage_key}
/// Defines enum members representing keys used for accessing values
/// stored within the [KVStorageService].
///
/// This enum prevents the use of magic strings for keys, promoting
/// type safety and reducing potential runtime errors. Use the [stringValue]
/// getter to access the underlying string representation for storage.
/// {@endtemplate}
enum StorageKey {
  /// Key for storing the authentication token needed for interraction with
  /// the backend API.
  authToken,

  /// Key for storing a boolean flag indicating whether the user has completed
  /// the onboarding flow.
  hasSeenOnboarding,

  /// Key for storing an integer that counts positive user interactions,
  /// used to determine when to show an in-app review dialog.
  positiveInteractionCount,

  /// Key for storing the Firebase Cloud Messaging (FCM) token for push notifications.
  fcmToken,

  /// Key for storing the OneSignal Player ID for push notifications.
  oneSignalPlayerId;

  /// Returns the snake_case string representation of the key for storage.
  String get stringValue {
    switch (this) {
      case StorageKey.authToken:
        return 'auth_token';
      case StorageKey.hasSeenOnboarding:
        return 'has_seen_onboarding';
      case StorageKey.positiveInteractionCount:
        return 'positive_interaction_count';
      case StorageKey.fcmToken:
        return 'fcm_token';
      case StorageKey.oneSignalPlayerId:
        return 'one_signal_player_id';
    }
  }
}
