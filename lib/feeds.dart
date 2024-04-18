import 'package:flutter/material.dart';

class FeedsPage extends StatelessWidget {
  const FeedsPage({super.key});

  Widget getFeedsBody() {
    return const Center(
      child: Text(
        'Feeds Page',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getFeedsBody();
  }
}
