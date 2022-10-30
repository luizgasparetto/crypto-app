import 'package:design_system_module/src/common/constants/crypto_colors.dart';
import 'package:flutter/material.dart';

class CryptoBottomBar extends StatefulWidget {
  final List<CryptoBottomBarItem> items;
  final void Function(int index) onSelected;

  const CryptoBottomBar({
    super.key,
    required this.items,
    required this.onSelected,
  });

  @override
  State<CryptoBottomBar> createState() => _CryptoBottomBarState();
}

class _CryptoBottomBarState extends State<CryptoBottomBar> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: List.from(
        widget.items.map(
          (e) => BottomNavigationBarItem(
            icon: Icon(e.icon),
            activeIcon: Icon(e.activeIcon),
            label: '',
          ),
        ),
      ),
      backgroundColor: CryptoColors.darkColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: CryptoColors.dialogColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: selected,
      onTap: (index) {
        widget.onSelected(index);
        setState(() {
          selected = index;
        });
      },
    );
  }
}

class CryptoBottomBarItem {
  final IconData icon;
  final IconData activeIcon;

  const CryptoBottomBarItem({
    required this.icon,
    required this.activeIcon,
  });
}
