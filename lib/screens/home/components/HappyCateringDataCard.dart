import 'package:flutter/material.dart';

class HappyCateringDataCard extends StatelessWidget {
  final String dietName;
  final DateTime nextDeliveryAt;
  final String pictureUrl;
  final VoidCallback onShowMenuPressed;

  const HappyCateringDataCard({
    Key? key,
    required this.dietName,
    required this.nextDeliveryAt,
    required this.pictureUrl,
    required this.onShowMenuPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      color: colorScheme.secondary,
      elevation: 4,
      child: SizedBox( // Wrap with SizedBox to specify width and height
        width: 450, // Increased width
        height: 300, // Increased height
        child: Row( // Use Row to align the image to the left
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Healthy Diet',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: colorScheme.tertiary,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Next delivery: Tomorrow',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.tertiary,
                    ),
                  ),
                  Spacer(), // Add Spacer to push button to the bottom
                  ElevatedButton( // Add ElevatedButton for "Show Menu"
                    onPressed: onShowMenuPressed,
                    child: Text('Show Menu'),
                  ),
                ],
              ),
            ),
            Expanded( // Expanded to let the image take remaining space
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Image.asset(
                  'assets/img/standard.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
