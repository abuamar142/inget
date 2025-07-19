import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service locator untuk dependency injection
class ServiceLocator {
  const ServiceLocator._();

  /// Initialize semua dependencies yang dibutuhkan
  static Future<List<Override>> init() async {
    // Initialize SharedPreferences
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    // Return list of overrides untuk ProviderScope
    return <Override>[
      // Override sharedPreferences provider dengan instance yang sudah diinisialisasi
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ];
  }
}

/// Provider untuk SharedPreferences instance
final Provider<SharedPreferences> sharedPreferencesProvider =
    Provider<SharedPreferences>((Ref<SharedPreferences> ref) {
      throw UnimplementedError(
        'SharedPreferences provider must be overridden before use',
      );
    });
