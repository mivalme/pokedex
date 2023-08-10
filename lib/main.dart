import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/router/app_router.dart';
import 'package:pokedex/core/theme/app_theme.dart';
import 'package:pokedex/modules/pokedex/presentation/bloc/pokedex_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<PokedexBloc>(
        create: (_) => PokedexBloc()..add(FetchPokemonsEvent()),
      )
    ], child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
