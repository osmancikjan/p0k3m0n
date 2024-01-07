import 'package:flutter/material.dart';

final class FlexibleNetworkImage extends StatelessWidget {
  final String imageUrl;

  const FlexibleNetworkImage(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Image.network(
        imageUrl,
      ),
    );
  }
}
