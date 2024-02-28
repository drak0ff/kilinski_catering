import 'package:flutter/material.dart';
import 'package:happy_catering/screens/payment/payment.dart';
import 'package:meal_repository/meal_repository.dart';
import 'package:order_repository/order_repository.dart';

class HappyCateringDietDataCard extends StatelessWidget {
  final String pictureUrl;
  final String dietName;

  const HappyCateringDietDataCard({
    Key? key,
    required this.pictureUrl,
    required this.dietName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.primary), // Add border color
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: colorScheme.secondary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
              width: 200,
              child: Container(
                width: 150,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: colorScheme.secondary,
                ),
                child: Image.asset(
                  pictureUrl, // Replace with your image asset
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              child: Text(
                dietName,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaymentScreen(
                          selectedCalorie: 2000,
                          selectedPeriod: 20,
                          orderRepository: OrderRepository(),
                          mealRepository: MealRepository())),
                );
              },
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                side: BorderSide(color: colorScheme.primary), // Outline color
              ),
              child: Text(
                'Order >',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: colorScheme.tertiary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
