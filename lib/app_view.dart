import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_catering/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:happy_catering/screens/auth/welcome_screen.dart';
import 'package:meal_repository/meal_repository.dart';
import 'package:order_repository/order_repository.dart';

import 'blocs/sign_in_bloc/sign_in_bloc.dart';
import 'screens/home/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    OrderRepository orderRepository = OrderRepository(firestore: firestore);
    MealRepository mealRepository = MealRepository(firestore: firestore);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "Happy Catering",
        theme: ThemeData(
            colorScheme: const ColorScheme.light(
                background: Color.fromRGBO(54, 87, 61, 1),
                onBackground: Colors.white,
                primary: Color.fromRGBO(237, 156, 0, 1),
                onPrimary: Colors.white,
                secondary: Color.fromRGBO(195, 219, 181, 1),
                onSecondary: Color.fromRGBO(95, 99, 104, 1),
                tertiary: Color.fromRGBO(137, 134, 134, 1),
                error: Colors.red,
                outline: Color.fromRGBO(255, 66, 66, 0))),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return BlocProvider(
              create: (context) => SignInBloc(
                  userRepository:
                      context.read<AuthenticationBloc>().userRepository),
              child: HomeScreen(
                orderRepository: orderRepository,
                mealRepository: mealRepository,
              ),
            );
          } else {
            return const WelcomeScreen();
          }
        }));
  }
}
