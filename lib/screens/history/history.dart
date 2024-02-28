import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order History',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        toolbarHeight: 100,

      ),
      body: ListView.builder(
        itemCount: orderHistory.length,
        itemBuilder: (context, index) {
          return OrderContainer(
            orderName: orderHistory[index]['name'],
            nextDeliveryAt: orderHistory[index]['nextDelivery'],
            hasData: orderHistory[index]['hasData'],
          );
        },
      ),
    );
  }
}

class OrderContainer extends StatelessWidget {
  final String orderName;
  final String nextDeliveryAt;
  final bool hasData;

  const OrderContainer({
    required this.orderName,
    required this.nextDeliveryAt,
    required this.hasData,
  });

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
      child: Row(
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
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Ordered: $nextDeliveryAt",
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
    );
  }
}

// Sample order history data
List<Map<String, dynamic>> orderHistory = [
  {
    'name': 'Vege',
    'nextDelivery': '2024-01-24 13:00 PM',
    'hasData': true,
  },
];
