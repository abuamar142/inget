import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final List<Override> overrides = await ServiceLocator.init();

  runApp(ProviderScope(overrides: overrides, child: const IngetApp()));
}
