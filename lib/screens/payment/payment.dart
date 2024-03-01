import 'package:flutter/material.dart';
import 'package:happy_catering/screens/home/home_screen.dart';
import 'package:meal_repository/meal_repository.dart';
import 'package:order_repository/order_repository.dart';

class PaymentScreen extends StatelessWidget {
  final int selectedCalorie;
  final int selectedPeriod;
  final OrderRepository orderRepository;
  final MealRepository mealRepository;

  const PaymentScreen({
    Key? key,
    required this.selectedCalorie,
    required this.selectedPeriod,
    required this.orderRepository,
    required this.mealRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: theme.colorScheme.background,
        toolbarHeight: 45,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/img/Vege.png',
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Vege',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    'Calorie Density: ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '$selectedCalorie',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    'Selected Period: ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '$selectedPeriod days',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Обробник натискання кнопки "Diet Menu"
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.restaurant_menu,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Diet Menu',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '1500 PLN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Показ повідомлення про успішну оплату на 5 секунд
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Payment successful. You can now check the menu schedule.'),
                              duration: Duration(seconds: 5),
                            ),
                          );

                          // Перенаправлення на домашній екран після успішної оплати
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                      mealRepository: mealRepository,
                                      orderRepository: orderRepository,
                                    )),
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
                          'Pay',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
