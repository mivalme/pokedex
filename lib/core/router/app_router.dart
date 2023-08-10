import 'package:go_router/go_router.dart';
import 'package:pokedex/modules/pokedex/pokedex.dart';
import 'package:pokedex/modules/pokedex/presentation/screens/pokemon_detail_screen.dart';
import 'package:pokedex/modules/settings/presentation/screens/settings_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PokedexScreen(),
    ),
    GoRoute(
      path: '/pokemon/:id',
      builder: (context, state) {
        final pokemonId = state.pathParameters['id'] ?? 'no-id';
        return PokemonDetailScreen(pokemonId: pokemonId);
      },
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
