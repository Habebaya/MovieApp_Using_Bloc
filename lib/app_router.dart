import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usingbloc/business_logic/cubit/characters_cubit.dart';
import 'package:usingbloc/constans/strings.dart';
import 'package:usingbloc/data/repo/characters_repo.dart';
import 'package:usingbloc/data/web_services/character_web_services.dart';
import 'package:usingbloc/presentation/screens/characters_details.dart';
import 'package:usingbloc/presentation/screens/characters_screen.dart';

class AppRouter {
  late CharacterRepo charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharacterRepo(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );
      case charactersDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
    }
  }
}
