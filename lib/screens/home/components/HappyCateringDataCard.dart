import 'package:flutter/material.dart';

class HappyCateringDataCard extends StatelessWidget {
  final String dietName;
  final DateTime nextDeliveryAt;
  final String pictureUrl;
  final VoidCallback onShowMenuPressed;

  const HappyCateringDataCard(
      {super.key,
      required this.dietName,
      required this.nextDeliveryAt,
      required this.pictureUrl,
      required this.onShowMenuPressed});
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      color: colorScheme.secondary,
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 40, top: 15),
                  child: Text('Healthy Diet',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: colorScheme.tertiary)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 40, top: 15),
                  child: Text('Next delivery: Tomorrow',
                      style: TextStyle(
                          fontSize: 5,
                          fontWeight: FontWeight.w900,
                          color: colorScheme.tertiary)))
            ],
          )
        ],
      ),
    );
  }
}
