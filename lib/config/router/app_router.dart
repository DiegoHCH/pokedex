import 'package:go_router/go_router.dart';
import 'package:pokemon_2025/presentation/screens/screens.dart';
import 'package:pokemon_2025/presentation/screens/main_layout.dart';

final appRouter = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/',
      name: 'main',
      builder: (context, state) => const MainLayout(),
    ),
    GoRoute(
      path: '/pokemon-detail',
      name: 'pokemon-detail',
      builder: (context, state) {
        final pokemon = state.extra as dynamic;
        return PokemonDetailScreen(pokemon: pokemon);
      },
    ),
  ],
);