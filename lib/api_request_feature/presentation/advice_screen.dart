import 'package:flutter/material.dart';

class AdviceScreen extends StatelessWidget {
  const AdviceScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Sould be wrapped with Bloc Widget.
        const Text('I am an advice from the api'),
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.api),
            label: const Text('Start Api request '))
      ],
    );
  }
}
