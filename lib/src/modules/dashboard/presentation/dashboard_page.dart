import 'package:design_system_module/design_system_module.dart';
import 'package:flutter/material.dart';

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
        children: const [],
      ),
      bottomNavigationBar: CryptoBottomBar(
        onSelected: (index) => pageController.jumpToPage(index),
        items: const [
          CryptoBottomBarItem(icon: Icons.home, activeIcon: Icons.home_filled),
          CryptoBottomBarItem(icon: Icons.person, activeIcon: Icons.person_add),
        ],
      ),
    );
  }
}
