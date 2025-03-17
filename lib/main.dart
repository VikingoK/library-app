import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:librery_app/core/theme/app_theme.dart';
import 'package:librery_app/routes/app_router.dart';

void main() {
  final AppRouter appRouter = AppRouter();
  runApp(ProviderScope(
    child: MyApp(
      appRouter: appRouter,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return MaterialApp.router(
        routerConfig: appRouter.config(),
        debugShowCheckedModeBanner: false,
        theme: AppTheme(isDarkmode: true).getTheme(),
      );
    });
  }
}
