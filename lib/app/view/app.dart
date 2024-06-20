import 'package:flutter/material.dart';
import 'package:prueba_dyshez/app/routes.dart';
// import 'package:prueba_dyshez/features/counter/counter.dart';
import 'package:prueba_dyshez/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColorLight: const Color(0xFFE3026F),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
              const Color(0xFFE3026F),
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // home: const CounterPage(),
      initialRoute: initialRoute,
      routes: routes,
    );
  }
}
