import 'package:flutter/material.dart';

class DetailsRow extends StatelessWidget {
  final String topText;
  final String? bottomText;

  const DetailsRow({Key? key, required this.topText, this.bottomText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    topText,
                    style: TextStyle(
                      fontWeight: bottomText != null
                          ? FontWeight.w900
                          : FontWeight.normal,
                      fontSize: 15,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  if (bottomText != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        bottomText!,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
