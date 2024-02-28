import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_catering/screens/order_details/components/DetailsRow.dart';
import 'package:happy_catering/screens/order_details/components/HappyCateringRatingButton.dart';

class MenuDetails extends StatefulWidget {
  const MenuDetails({super.key});

  @override
  State<MenuDetails> createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails> {
  final PageController _controller = PageController(viewportFraction: 0.8);
  final int itemCount = 8;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
      ),
      bottomNavigationBar: BottomAppBar(
        color: theme.colorScheme.secondary,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
            onPressed: () {
              //TODO Implement button action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
            ),
            child: Text(
              'Order',
              style: TextStyle(color: theme.colorScheme.onBackground),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Menu details",
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 20,
                  ),
                ),
              ],
            ),

            // Image
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 250,
                  height: 160,
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/img/Vegan.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),

            // Details
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Healthy Diet',
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          HappyCateringRatingButton(
                            onPressed: () {
                              print('Button pressed!'); //TODO Implement action
                            },
                            rating: 3, //TODO change dummy value
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Carousel
            Container(
              width: 400,
              height: 300,
              margin: const EdgeInsets.only(top: 20),
              child: PageView.builder(
                itemCount: itemCount,
                controller: _controller,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        DetailsRow(
                            topText: DateTime.now().toLocal().toString()),
                        DetailsRow(topText: 'Breakfast', bottomText: 'Text1'),
                        DetailsRow(topText: 'Dinner', bottomText: 'Text2'),
                        DetailsRow(topText: 'Supper', bottomText: 'Text3'),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Text(
                      'Jeśli chcesz zadbać o siebie, wybierz tę dietę. To idealna dieta dla osób, które chcą zachować zdrowy styl życia i chcą zrzucić kilka kilogramów.',
                      maxLines: 10,
                      overflow: TextOverflow.fade,
                      style: TextStyle(color: theme.colorScheme.onPrimary),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
