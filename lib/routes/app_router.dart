import 'package:auto_route/auto_route.dart';
import 'package:librery_app/features/books/presentation/routes/books_router.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [...BooksRouter().booksRoutes];
}
