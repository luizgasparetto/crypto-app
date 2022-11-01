import 'package:design_system_module/design_system_module.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageController = PageController(viewportFraction: 1.1);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CryptoRoundedButton(icon: Icons.language, onTap: () {}),
                  const Text(
                    'Fake Crypto',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  CryptoRoundedButton(icon: IconlyBold.profile, onTap: () {})
                ],
              ),
              const SizedBox(height: 60),
              AspectRatio(
                aspectRatio: 1.8,
                child: PageView(
                  controller: pageController,
                  children: [
                    FractionallySizedBox(
                      widthFactor: 1 / pageController.viewportFraction,
                      child: const CryptoWalletCard.green(),
                    ),
                    FractionallySizedBox(
                      widthFactor: 1 / pageController.viewportFraction,
                      child: const CryptoWalletCard.blue(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CryptoRoundedButtonWithText(
                      text: 'Buy',
                      icon: Icons.attach_money,
                      onTap: () {},
                    ),
                    CryptoRoundedButtonWithText(
                      text: 'Send',
                      icon: IconlyLight.arrow_up,
                      onTap: () {},
                    ),
                    CryptoRoundedButtonWithText(
                      text: 'Receive',
                      icon: IconlyLight.arrow_down,
                      onTap: () {},
                    ),
                    CryptoRoundedButtonWithText(
                      text: 'Exchange',
                      icon: Icons.import_export,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (_, __) {
                    return Column(
                      children: const [
                        CryptoHorizontalCard(),
                        SizedBox(height: 15),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
