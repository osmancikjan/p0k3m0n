import 'package:flutter/material.dart';

final class FailedText extends StatelessWidget {
  final String errorMessage;
  const FailedText({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: const TextStyle(
          color: Colors.deepOrangeAccent,
          fontSize: 26,
        ),
      ),
    );
  }
}
