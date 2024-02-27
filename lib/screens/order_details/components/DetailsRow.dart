import 'package:flutter/material.dart';

class DetailsRow extends StatelessWidget {
  final String topText;
  final String? bottomText;

  const DetailsRow({super.key, required this.topText, this.bottomText});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    if (bottomText == null) {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0x2bd9d9d9),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(topText,
                        style: TextStyle(
                            fontSize: 15, color: theme.colorScheme.onPrimary)),
                  ]),
            ],
          ),
        ),
      );
    } else {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0x2bd9d9d9),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(topText,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                            color: theme.colorScheme.onPrimary)),
                    Text(bottomText!,
                        style: TextStyle(
                            fontSize: 15, color: theme.colorScheme.onPrimary)),
                  ]),
            ],
          ),
        ),
      );
    }
  }
}
