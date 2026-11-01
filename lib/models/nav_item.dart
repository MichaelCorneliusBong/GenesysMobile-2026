import 'package:flutter/material.dart';

class NavItem {
  final int index;
  final String label;
  final IconData activeIcon;
  final IconData inactiveIcon;

  const NavItem({
    required this.index,
    required this.label,
    required this.activeIcon,
    required this.inactiveIcon,
  });
}
