import 'package:flutter/material.dart';

class CustomNavItem extends StatelessWidget {
  // final IconData icon;
  final String text;
  final int index;
  final int selectedIndex;
  final Function(int) onItemTapped;
  final String image;

  const CustomNavItem({
    super.key,
    // required this.icon,
    required this.text,
    required this.index,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedIndex == index;
    final Color color = isSelected ? Colors.blue : Colors.black;

    return InkWell(
      onTap: () => onItemTapped(index),
      borderRadius: BorderRadius.circular(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            image,
            color: color,
          ),
          // Icon(icon, color: color),
          const SizedBox(height: 4),
          Text(text, style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
