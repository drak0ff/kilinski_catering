import 'package:flutter/material.dart';

class HappyCateringRatingButton extends StatelessWidget {
  final int rating;
  final VoidCallback onPressed;

  const HappyCateringRatingButton(
      {super.key, required this.rating, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Rating',
            style: TextStyle(
              color: theme.colorScheme.onPrimary,
            ),
          ),
          const SizedBox(width: 16),
          Row(
            children: List.generate(3, (index) {
              if (index < rating) {
                return const Icon(Icons.star, color: Colors.yellow);
              } else {
                return const Icon(Icons.star_border, color: Colors.yellow);
              }
            }),
          ),
        ],
      ),
    );
  }
}
