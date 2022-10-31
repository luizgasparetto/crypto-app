import 'package:flutter/material.dart';

import '../../../../design_system_module.dart';

class CryptoRoundedButtonWithText extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function() onTap;

  const CryptoRoundedButtonWithText({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CryptoRoundedButton(icon: icon, onTap: onTap),
        const SizedBox(height: 5),
        Text(text, style: TextStyle(color: CryptoColors.lightGrey, fontFamily: 'Biotif')),
      ],
    );
  }
}
