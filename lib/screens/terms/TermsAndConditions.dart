import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class TermsAndConditionsScreen extends StatefulWidget {
  @override
  _TermsAndConditionsScreenState createState() => _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  String termsAndConditions = '';

  @override
  void initState() {
    super.initState();
    loadTermsAndConditions();
  }

  Future<void> loadTermsAndConditions() async {
    final String text = await rootBundle.loadString('assets/txt/terms_and_conditions.txt');
    setState(() {
      termsAndConditions = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
        backgroundColor: theme.colorScheme.primary, // Колір фону навбару
        toolbarHeight: 45,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Text(
            termsAndConditions,
            style: TextStyle(fontSize: 16.0, color: Colors.white), // Зміна кольору тексту на білий
            textAlign: TextAlign.center, // Вирівнювання тексту по центру
          ),
        ),
      ),
    );
  }
}
