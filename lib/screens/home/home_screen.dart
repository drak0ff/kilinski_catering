import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_catering/blocs/components_bloc/card_bloc/card_bloc.dart';
import 'package:happy_catering/screens/home/components/HappyCateringOrderCardCarousel.dart';
import 'package:order_repository/order_repository.dart';

class HomeScreen extends StatefulWidget {
  final OrderRepository orderRepository;

  const HomeScreen({Key? key, required this.orderRepository}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BlocProvider(
      create: (context) => CardBloc(orderRepository: widget.orderRepository),
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: theme.colorScheme.primary,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
                selectedIcon: Icon(Icons.person),
                icon: Icon(Icons.person_outlined),
                label: 'Profile')
          ],
          backgroundColor: theme.colorScheme.secondary,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        ),
        body: <Widget>[
          SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 7,
                      width: MediaQuery.of(context).size.height / 6,
                      child: const Image(
                          image: AssetImage(
                              'assets/img/only_color_logo_no_background.png')),
                    ),
                  )
                ],
              ),
              Center(
                child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: HappyCateringOrderCardCarousel()),
              )
            ],
          )),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100, // Встановлюємо висоту логотипу
                  child: Image.asset(
                    'assets/img/only_color_logo_no_background.png', // Шлях до зображення логотипу
                    fit: BoxFit.contain, // Збільшуємо або зменшуємо логотип, щоб вміститися
                  ),
                ),
                SizedBox(height: 20), // Проміжок між логотипом і текстом "Hi, user"
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Hi, user',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to "Change your data" screen
                          },
                          child: Text('Change your data'),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Color.fromRGBO(237, 156, 0, 1); // Колір обводки під час натискання
                              }
                              return Theme.of(context).colorScheme.tertiary; // Колір обводки в звичайному стані
                            }),
                            backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to "Rules" screen
                          },
                          child: Text('Rules'),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Color.fromRGBO(237, 156, 0, 1); // Колір обводки під час натискання
                              }
                              return Theme.of(context).colorScheme.tertiary; // Колір обводки в звичайному стані
                            }),
                            backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to "Order history" screen
                          },
                          child: Text('Order history'),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Color.fromRGBO(237, 156, 0, 1); // Колір обводки під час натискання
                              }
                              return Theme.of(context).colorScheme.tertiary; // Колір обводки в звичайному стані
                            }),
                            backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Log out
                          },
                          child: Text('Log out'),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Color.fromRGBO(237, 156, 0, 1); // Колір обводки під час натискання
                              }
                              return Theme.of(context).colorScheme.tertiary; // Колір обводки в звичайному стані
                            }),
                            backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),





          /// Messages page
          ListView.builder(
            reverse: true,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Hello',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: theme.colorScheme.onPrimary),
                    ),
                  ),
                );
              }
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hi!',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            },
          ),
        ][currentPageIndex],
      ),
    );
  }
}
