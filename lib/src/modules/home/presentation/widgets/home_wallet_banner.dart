import 'package:design_system_module/design_system_module.dart';
import 'package:flutter/material.dart';

class HomeWalletBanner extends StatelessWidget {
  const HomeWalletBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AspectRatio(
      aspectRatio: size.width / 220,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 109, 255, 158),
              Color.fromARGB(255, 79, 230, 129),
              Color.fromARGB(255, 109, 255, 158),
              Color.fromARGB(255, 79, 230, 129),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Crypto Wallet', style: TextStyle(fontSize: 19)),
              const Text('R\$ 120,879.98', style: TextStyle(fontSize: 32)),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: CryptoColors.darkColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        '0x8b5436...4c9992',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(Icons.copy_outlined, size: 18),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
