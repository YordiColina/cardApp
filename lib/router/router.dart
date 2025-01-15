import 'package:go_router/go_router.dart';
import '../domain/models/item_data/item.dart';
import '../presentation/screens/details_screen.dart';
import '../presentation/screens/form_screen/form_screen.dart';
import '../presentation/screens/home_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/form',
      name: 'form',
      builder: (context, state) {
        final item = state.extra as Item?;
        return FormScreen(item: item);
      },
    ),
    GoRoute(
      path: '/detail',
      name: 'detail',
      builder: (context, state) {
        final item = state.extra as Item;
        return DetailsScreen(item: item);
      },
    ),
  ],
);
