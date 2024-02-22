import 'package:flutter/material.dart';

class HappyCateringDataCard extends StatelessWidget {
  final bool hasData;
  final String orderName;
  final String nextDeliveryAt;

  HappyCateringDataCard(
      {super.key,
      required this.hasData,
      this.orderName = "",
      this.nextDeliveryAt = ""});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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
                SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/img/standard.png', // Replace with your image asset
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
                SizedBox(height: 16),
                Text('No data available right now'),
              ],
            ),
    );
  }
}
