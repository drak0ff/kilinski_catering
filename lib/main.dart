import 'package:happy_catering/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_catering/firebase_options.dart';
import 'package:user_repository/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'simple_bloc_observer.dart';

import 'dart:developer';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(FirebaseUserRepo()));

  // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  // List<Map<String, dynamic>> keto = [
    // {
    //   "CalorieDensity": [400, 800, 1200, 1600],
    //   "Image": "breakfast_image_1.jpg",
    //   "Name": "Oatmeal with Fresh Berries",
    //   "Rating": 4,
    //   "Type": "breakfast"
    // },
    // {
    //   "CalorieDensity": [350, 700, 1050, 1400],
    //   "Image": "breakfast_image_2.jpg",
    //   "Name": "Avocado with low-carb Toast and Poached Egg",
    //   "Rating": 4.5,
    //   "Type": "breakfast"
    // },
    // {
    //   "CalorieDensity": [600, 1200, 1800, 2400],
    //   "Image": "lunch_image_1.jpg",
    //   "Name": "Grilled Chicken Caesar Salad",
    //   "Rating": 4.6,
    //   "Type": "breakfast"
    // },
    // {
    //   "CalorieDensity": [700, 1400, 2100, 2800],
    //   "Image": "lunch_image_3.jpg",
    //   "Name": "Salmon and Avocado Sushi Rolls with cauliflower rice",
    //   "Rating": 4.8,
    //   "Type": "dinner"
    // },
    // {
    //   "CalorieDensity": [620, 1240, 1860, 2480],
    //   "Image": "lunch_image_5.jpg",
    //   "Name": "Shrimp Stir-Fry with Broccoli",
    //   "Rating": 4.5,
    //   "Type": "dinner"
    // },
    // {
    //   "CalorieDensity": [700, 1400, 2100, 2800],
    //   "Image": "dinner_image_1.jpg",
    //   "Name": "Grilled Steak with Garlic Butter",
    //   "Rating": 4.9,
    //   "Type": "dinner"
    // },
    // {
    //   "CalorieDensity": [750, 1500, 2250, 3000],
    //   "Image": "dinner_image_3.jpg",
    //   "Name": "Baked Lemon with bone-in chicken and fresh herbs",
    //   "Rating": 4.7,
    //   "Type": "dinner"
    // },
    // {
    //   "CalorieDensity": [550, 1100, 1650, 2200],
    //   "Image": "supper_image_2.jpg",
    //   "Name": "Fresh Spinach and Full Feta Stuffed Chicken Breast",
    //   "Rating": 4.6,
    //   "Type": "supper"
    // },
    // {
    //   "CalorieDensity": [480, 960, 1440, 1920],
    //   "Image": "supper_image_3.jpg",
    //   "Name": "Low-Carb Vegetable Stir-Fry with Tofu",
    //   "Rating": 4.0,
    //   "Type": "supper"
    // },
    // {
    //   "CalorieDensity": [530, 1060, 1590, 2120],
    //   "Image": "supper_image_4.jpg",
    //   "Name": "Turkey and Vegetable Skewers",
    //   "Rating": 4.2,
    //   "Type": "supper"
    // },
//   ];
//   List<Map<String, dynamic>> vege = [
//       {
//         "CalorieDensity": [300, 600, 900, 1200],
//         "Name": "Avocado and Spinach Omelette",
//         "Rating": 4.2,
//         "Type": "breakfast"
//       },
//       {
//         "CalorieDensity": [250, 500, 750, 1000],
//         "Name": "Mushroom and Tomato Scramble",
//         "Rating": 4.0,
//         "Type": "breakfast"
//       },
//       {
//         "CalorieDensity": [550, 1100, 1650, 2200],
//         "Name": "Vegetarian Quinoa Bowl",
//         "Rating": 4.2,
//         "Type": "dinner"
//       },
//       {
//         "DocumentID": "9wLf67BsvDfgTnmL0PoQ",
//         "CalorieDensity": [380, 760, 1140, 1520],
//         "Image": "breakfast_image_5.jpg",
//         "Name": "Smoothie Bowl with Mixed Fruits",
//         "Rating": 4.7,
//         "Type": "breakfast"
//       },
//       {
//         "DocumentID": "ZXzPOiU87fghTqWme4Kl",
//         "CalorieDensity": [300, 600, 900, 1200],
//         "Name": "Whole Grain Pancakes with Maple Syrup",
//         "Rating": 3.8,
//         "Type": "breakfast"
//       },
//     {
//       "DocumentID": "WqErTghYl45Fv32BcXo9",
//       "CalorieDensity": [650, 1300, 1950, 2600],
//       "Image": "dinner_image_2.jpg",
//       "Name": "Vegetable Lasagna with Marinara Sauce",
//       "Rating": 4.3,
//       "Type": "vegetarian"
//     },
//     {
//       "CalorieDensity": [680, 1360, 2040, 2720],
//       "Name": "Pasta Primavera with Roasted Veggies",
//       "Rating": 4.2,
//       "Type": "dinner"
//     },
//     {
//       "CalorieDensity": [420, 840, 1260, 1680],
//       "Name": "Vegetarian Zucchini Noodle Stir-Fry",
//       "Rating": 4.8,
//       "Type": "dinner"
//     },
//     {
//       "CalorieDensity": [350, 700, 1050, 1400],
//       "Name": "Cauliflower Fried Rice with Mixed Vegetables",
//       "Rating": 4.6,
//       "Type": "dinner"
//     },
//     {
//       "CalorieDensity": [350, 700, 1050, 1400],
//       "Name": "Vegetarian Quinoa Bowl",
//       "Rating": 4.2,
//       "Type": "supper"
//     },
//     {
//       "CalorieDensity": [420, 840, 1260, 1680],
//       "Name": "Mushroom and Spinach Stuffed Bell Peppers",
//       "Rating": 4.7,
//       "Type": "supper"
//     },
//     {
//       "CalorieDensity": [280, 560, 840, 1120],
//       "Name": "Cauliflower Fried Rice with Tofu",
//       "Rating": 4.4,
//       "Type": "supper"
//     },
//     {
//       "CalorieDensity": [400, 800, 1200, 1600],
//       "Name": "Zucchini Noodles with Pesto and Cherry Tomatoes",
//       "Rating": 4.6,
//       "Type": "supper"
//     }
//   ];
//   List<Map<String, dynamic>> gain_weight = [
// {
//   "CalorieDensity": [800, 1600, 2400, 3200],
//   "Name": "Protein-Packed Oatmeal with Almonds",
//   "Rating": 4.2,
//   "Type": "breakfast"
// },
// {
//   "CalorieDensity": [900, 1800, 2700, 3600],
//   "Name": "Avocado and Bacon Stuffed Omelette",
//   "Rating": 4.8,
//   "Type": "breakfast"
// },
// {
//   "CalorieDensity": [750, 1500, 2250, 3000],
//   "Name": "Greek Yogurt Parfait with Berries and Granola",
//   "Rating": 4.4,
//   "Type": "breakfast"
// },
// {
//     "CalorieDensity": [850, 1700, 2550, 3400],
//     "Name": "Creamy Chicken Alfredo with Fettuccine",
//     "Rating": 4.2,
//     "Type": "dinner"
//   },
//   {
//     "CalorieDensity": [780, 1560, 2340, 3120],
//     "Name": "Beef and Cheese Stuffed Bell Peppers",
//     "Rating": 4.8,
//     "Type": "dinner"
//   },
//   {
//     "CalorieDensity": [920, 1840, 2760, 3680],
//     "Name": "Salmon and Avocado Quinoa Bowl",
//     "Rating": 4.6,
//     "Type": "dinner"
//   },
//   {
//     "CalorieDensity": [760, 1520, 2280, 3040],
//     "Name": "Lamb Chops with Roasted Vegetables",
//     "Rating": 4.4,
//     "Type": "dinner"
//   },
//   {
//     "CalorieDensity": [620, 1240, 1860, 2480],
//     "Name": "High-Calorie Chicken Alfredo",
//     "Rating": 4.5,
//     "Type": "supper"
//   },
//   {
//     "CalorieDensity": [680, 1360, 2040, 2720],
//     "Name": "Avocado and Salmon Quinoa Bowl",
//     "Rating": 4.8,
//     "Type": "supper"
//   },
//   {
//     "CalorieDensity": [750, 1500, 2250, 3000],
//     "Name": "Beef and Vegetable Stir-Fry with Brown Rice",
//     "Rating": 4.3,
//     "Type": "supper"
//   },
//   {
//     "CalorieDensity": [580, 1160, 1740, 2320],
//     "Name": "Sweet Potato and Chickpea Curry",
//     "Rating": 4.6,
//     "Type": "supper"
//   }

//   ];
//     gain_weight.forEach((element) {
//     firebaseFirestore.collection('gain_weight').add(element);
//   });
}
