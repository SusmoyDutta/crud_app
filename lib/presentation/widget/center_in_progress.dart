import 'package:flutter/material.dart';

class CenterInProgress extends StatelessWidget {
  const CenterInProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
