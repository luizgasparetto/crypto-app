import 'package:design_system_module/design_system_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CryptoWalletCard extends StatelessWidget {
  final List<Color> gradient;
  final Color textColor;

  const CryptoWalletCard({super.key, required this.gradient, required this.textColor});

  const CryptoWalletCard.green({
    super.key,
    this.gradient = const [
      Color.fromARGB(255, 109, 255, 158),
      Color.fromARGB(255, 79, 230, 129),
      Color.fromARGB(255, 109, 255, 158),
      Color.fromARGB(255, 79, 230, 129),
    ],
    this.textColor = Colors.black,
  });

  const CryptoWalletCard.blue({
    super.key,
    this.gradient = const [
      Color(0xFF32a5f7),
      Color.fromARGB(255, 80, 173, 239),
      Color(0xFF32a5f7),
      Color.fromARGB(255, 80, 173, 239),
    ],
    this.textColor = Colors.white,
  });

  const CryptoWalletCard.red({
    super.key,
    this.gradient = const [
      Color.fromARGB(255, 247, 50, 50),
      Color.fromARGB(255, 239, 74, 74),
      Color.fromARGB(255, 247, 50, 50),
      Color.fromARGB(255, 239, 74, 74),
    ],
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AspectRatio(
      aspectRatio: size.width / 220,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(colors: gradient),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Crypto Wallet', style: TextStyle(fontSize: 19, color: textColor)),
              Text('R\$ 120,879.98', style: TextStyle(fontSize: 32, color: textColor)),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: CryptoColors.darkColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        '0x8b5436...4c9992',
                        style: TextStyle(fontSize: 13, color: textColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Clipboard.setData(const ClipboardData(text: 'Yeahhh')).then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Wallet ID copied', textAlign: TextAlign.center),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      });
                    },
                    child: Icon(Icons.copy_outlined, size: 18, color: textColor),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
