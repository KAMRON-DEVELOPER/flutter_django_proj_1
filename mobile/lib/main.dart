import 'package:flutter/material.dart';
// import 'package:mobile/add_note_page.dart';
import 'package:mobile/home_page.dart';
import 'package:mobile/note_page.dart';
import 'package:mobile/notes_page.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/state_manage.dart';
import 'package:mobile/counter.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => Counter())],
        child: const MyApp(),
      ),
    );

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePageWidget();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'notes',
          builder: (BuildContext context, GoRouterState state) {
            return const NotesListPageWidget();
          },
          routes: <RouteBase>[
            GoRoute(
              path: ':id',
              builder: (BuildContext context, GoRouterState state) {
                final noteId = state.pathParameters['id'];
                return NotePageWidget(noteId: noteId!);
              },
            ),
          ],
        ),
        GoRoute(
          path: 'state_manage',
          builder: (BuildContext context, GoRouterState state) {
            return const StateManagementWidget();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       routes: {
//         '/': (context) => const HomePageWidget(),
//         '/notes': (context) => const NotesListPageWidget(),
//         '/notes/:id': (context) => const NotePageWidget(),
//         '/addNote': (context) => const AddNoteWidget(),
//       },
//     );
//   }
// }
