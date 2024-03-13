import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_catering/blocs/menu_bloc/menu_bloc.dart';
import 'package:meal_repository/meal_repository.dart';

class MenuDetailsProvider extends StatelessWidget {
  final Widget child;

  const MenuDetailsProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MenuBloc>(
      create: (context) => MenuBloc(
          menuRepository:
              MealRepository()), // Provide your MenuBloc instance here
      child: child,
    );
  }
}
