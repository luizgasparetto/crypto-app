import 'package:crypto_app/src/modules/home/presentation/home_page.dart';
import 'package:design_system_module/design_system_module.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          const HomePage(),
          Container(color: Colors.blue),
        ],
      ),
      bottomNavigationBar: CryptoBottomBar(
        onSelected: (index) => pageController.jumpToPage(index),
        items: const [
          CryptoBottomBarItem(icon: IconlyLight.home, activeIcon: IconlyBold.home),
          CryptoBottomBarItem(icon: IconlyLight.profile, activeIcon: IconlyBold.profile),
        ],
      ),
    );
  }
}
