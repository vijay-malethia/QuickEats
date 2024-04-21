import 'package:flutter/material.dart';

//
import 'package:quick_eats/ui/common/ui_helpers.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          width: 200,
          decoration: BoxDecoration(border: Border.all()),
          alignment: Alignment.center,
          child: const Text('QuickEats Logo'),
        ),
        verticalSpaceSmall,
        const Text(
          'Quick Eats',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Text(
          'Discover new dining experiences nearby!',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
