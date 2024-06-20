import 'package:flutter/material.dart';

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget({
    required this.onTap,
    required this.initialText,
    required this.finalText,
    super.key,
  });
  final void Function() onTap;
  final String initialText;
  final String finalText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          initialText,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            finalText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).primaryColorLight,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
