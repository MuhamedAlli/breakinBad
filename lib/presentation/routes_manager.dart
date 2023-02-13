import 'package:braeking_bad/business_logic/cubit/character_cubit.dart';
import 'package:braeking_bad/data/models/character_model.dart';
import 'package:braeking_bad/data/repositry/character_repositery.dart';
import 'package:braeking_bad/data/web_service/characyetr_web_service.dart';
import 'package:braeking_bad/presentation/details/details_view.dart';
import 'package:braeking_bad/presentation/main/main_view.dart';
import 'package:braeking_bad/presentation/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String splashRoute = '/';
  static const String mainRoute = '/mainRoute';
  static const String detailsRoute = '/detailsRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: ((context) => const SplashView()));
      case Routes.mainRoute:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) =>
                      CharacterCubit(CharacterRepositry(CharacterWebService())),
                  child: const MainView(),
                )));
      case Routes.detailsRoute:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: ((context) => BlocProvider(
              create: (context) =>
                  CharacterCubit(CharacterRepositry(CharacterWebService())),
              child: DetailsView(character: character))),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("No  Route Found!"),
        ),
        body: const Center(
          child: Text("No Route Found!"),
        ),
      );
    });
  }
}
