import 'package:flutter/material.dart';

class HappyCateringOrderDataCard extends StatelessWidget {
  final bool hasData;
  final String orderName;
  final String nextDeliveryAt;
  final String? imageUrl;

  HappyCateringOrderDataCard(
      {super.key,
      required this.hasData,
      this.orderName = "",
      this.nextDeliveryAt = "",
      this.imageUrl = ""});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.primary),
        color: colorScheme.secondary,
      ),
      child: hasData
          ? Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150, // Adjust the width as needed
                        child: Text(
                          orderName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Delivery Time: $nextDeliveryAt",
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/img/$orderName.png', // Replace with your image asset
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 5),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/cancel.png', // Replace with your no data image asset
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 16),
                const Text('No data available right now'),
              ],
            ),
    );
  }
}
