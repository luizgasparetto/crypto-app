import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoHorizontalCard extends StatelessWidget {
  const CryptoHorizontalCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 60,
      child: Row(
        children: [
          Container(
            width: 60,
            decoration: const BoxDecoration(
              color: Color(0xFF1f2124),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.network(
                'https://cryptologos.cc/logos/cardano-ada-logo.svg?v=023',
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
