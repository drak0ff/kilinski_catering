import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_catering/blocs/components_bloc/card_bloc/card_bloc.dart';
import 'package:happy_catering/screens/home/components/order_carousel/HappyCateringOrderCardCarousel.dart';
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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.height / 5,
                      child: const Image(
                          image: AssetImage(
                              'assets/img/only_color_logo_no_background.png')),
                    ),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(flex: 1, child: HappyCateringOrderCardCarousel()),
                ],
              ),
            ],
          )),

          /// Notifications page
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: ListTile(
                    leading: Icon(Icons.notifications_sharp),
                    title: Text('Notification 1'),
                    subtitle: Text('This is a notification'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.notifications_sharp),
                    title: Text('Notification 2'),
                    subtitle: Text('This is a notification'),
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
