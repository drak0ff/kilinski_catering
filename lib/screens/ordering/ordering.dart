import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:happy_catering/screens/payment/payment.dart';
import 'package:meal_repository/meal_repository.dart';
import 'package:order_repository/order_repository.dart';

class CalorieSelectionScreen extends StatefulWidget {
  final OrderRepository orderRepository;
  final MealRepository mealRepository;

  const CalorieSelectionScreen({super.key, required this.orderRepository, required this.mealRepository});

  @override
  _CalorieSelectionScreenState createState() => _CalorieSelectionScreenState();
}

class _CalorieSelectionScreenState extends State<CalorieSelectionScreen> {
  int selectedCalorie = 1200;
  int selectedPeriod = 7;
  DateTime? _startDate;
  DateTime? _endDate;
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details', style: TextStyle(color: Colors.white)),
    backgroundColor: theme.colorScheme.background, // Колір фону навбару
    toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Select calorie density:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [1200, 1500, 2000, 2500]
                    .map((calorie) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ChoiceChip(
                    label: Text(
                      '$calorie',
                      style: TextStyle(color: Colors.white),
                    ),
                    selected: selectedCalorie == calorie,
                    onSelected: (selected) {
                      setState(() {
                        selectedCalorie = calorie;
                      });
                    },
                  ),
                ))
                    .toList(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select order period:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [7, 14, 30]
                    .map((period) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ChoiceChip(
                    label: Text(
                      '$period days',
                      style: TextStyle(color: Colors.white),
                    ),
                    selected: selectedPeriod == period,
                    onSelected: (selected) {
                      setState(() {
                        selectedPeriod = period;
                      });
                    },
                  ),
                ))
                    .toList(),
              ),
            ),
            SizedBox(height: 20),
            if (_startDate != null && _endDate != null)
              Text(
                'Selected Date Range: ${_startDate!.day}/${_startDate!.month}/${_startDate!.year} - ${_endDate!.day}/${_endDate!.month}/${_endDate!.year}',
                style: TextStyle(color: Colors.white),
              ),
            ElevatedButton(
              onPressed: () async {
                final picked = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.dark().copyWith(
                        colorScheme: ColorScheme.dark(
                          primary: theme.colorScheme.secondary,
                          onPrimary: Colors.white,
                          surface: theme.colorScheme.secondary,
                          onSurface: Colors.white,
                        ),
                        dialogBackgroundColor: theme.colorScheme.secondary,
                      ),
                      child: child!,
                    );
                  },
                );
                if (picked != null) {
                  setState(() {
                    _startDate = picked.start;
                    _endDate = picked.end;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                primary: theme.colorScheme.secondary,
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Select Date Range',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 60),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: addressController,
                decoration: InputDecoration(
                  hintText: 'Enter your address for delivery',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  filled: true,
                  fillColor: Color.fromRGBO(237, 156, 0, 0.1),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Color.fromRGBO(237, 156, 0, 1)),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(
                      selectedCalorie: selectedCalorie,
                      selectedPeriod: selectedPeriod,
                      orderRepository: widget.orderRepository, mealRepository: widget.mealRepository,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: theme.colorScheme.secondary,
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Go to payment',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  OrderRepository orderRepository = OrderRepository();
  MealRepository mealRepository = MealRepository();
  runApp(MaterialApp(
    home: CalorieSelectionScreen(orderRepository: orderRepository, mealRepository: mealRepository,),
  ));
}
