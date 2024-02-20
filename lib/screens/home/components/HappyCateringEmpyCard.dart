import 'package:flutter/material.dart';

class HappyCateringEmpyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.secondary,
      shadowColor: Colors.transparent,
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 10,
            padding: const EdgeInsets.all(10),
            child: const Image(
              image: AssetImage('assets/img/cancel.png'),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                'Looks like you don\'t have any order yet',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
