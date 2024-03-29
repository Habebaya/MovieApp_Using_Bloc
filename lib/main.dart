import 'package:flutter/material.dart';
import 'package:usingbloc/app_router.dart';

void main() {
  runApp( MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
   MyApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
