import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.blue, // Màu khi tab được chọn
      unselectedItemColor: Colors.grey, // Màu khi tab không được chọn
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet),
          label: "Việt làm của tôi",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: "Tin nhắn"),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: "Hồ sơ",
        ),
      ],
    );
  }
}
