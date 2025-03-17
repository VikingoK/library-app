import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:librery_app/features/books/presentation/pages/detail_page.dart';
import 'package:librery_app/features/books/presentation/pages/home_page.dart';
import 'package:librery_app/features/books/presentation/pages/search_page.dart';

part 'books_router.gr.dart';

@AutoRouterConfig()
class BooksRouter extends AutoRouter {
  const BooksRouter({super.key});

  List<AutoRoute> get booksRoutes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: DetailRoute.page),
      ];
}

// transiciones de ruta
//  RouteType.custom(
//         durationInMilliseconds: 300,
//         reverseDurationInMilliseconds: 300,
//         transitionsBuilder: TransitionsBuilders.slideBottom,
//       );