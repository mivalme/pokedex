import 'package:go_router/go_router.dart';
import 'package:pokedex/modules/pokedex/pokedex.dart';
import 'package:pokedex/modules/pokedex/presentation/screens/pokemon_detail_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      // name: HomeScreen.name,
      builder: (context, state) => const PokedexScreen(),
    ),
    GoRoute(
      path: '/pokemon/:id',
      // name: HomeScreen.name,
      builder: (context, state) {
        final pokemonId = state.pathParameters['id'] ?? 'no-id';
        return PokemonDetailScreen(pokemonId: pokemonId);
      },
    ),
  ],
);
