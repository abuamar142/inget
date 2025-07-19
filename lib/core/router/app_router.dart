import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/notes/presentations/screens/notes_screen.dart';

final Provider<GoRouter> appRouterProvider = Provider<GoRouter>((
  Ref<GoRouter> ref,
) {
  return GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const NotesScreen(),
      ),
    ],
  );
});
