import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/router/app_router.dart';
import 'package:pokedex/modules/pokedex/presentation/bloc/pokedex_bloc.dart';
import 'package:pokedex/modules/settings/presentation/cubits/theme_cubit/theme_cubit.dart';


void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<PokedexBloc>(
        create: (_) => PokedexBloc()..add(FetchPokemonsEvent()),
      ),
      BlocProvider<ThemeCubit>(
        create: (_) => ThemeCubit(),
      )
    ], child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<ThemeCubit>().state.appTheme;

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
    );
  }
}
