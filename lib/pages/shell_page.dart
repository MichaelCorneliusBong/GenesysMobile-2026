import 'package:flutter/material.dart';
import '../models/nav_item.dart';
import 'cards_page.dart';
import 'decks_page.dart';
import 'guides_page.dart';
import 'home_page.dart';
import 'tier_list_page.dart';

class ShellPage extends StatefulWidget {
  static final ValueNotifier<int> activeTabNotifier = ValueNotifier<int>(0);

  const ShellPage({super.key});

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  int _currentIndex = 0;

  final List<NavItem> _navItems = const [
    NavItem(
      index: 0,
      label: 'HOME',
      activeIcon: Icons.grid_view,
      inactiveIcon: Icons.grid_view_outlined,
    ),
    NavItem(
      index: 1,
      label: 'DECKS',
      activeIcon: Icons.style,
      inactiveIcon: Icons.style_outlined,
    ),
    NavItem(
      index: 2,
      label: 'TIER LIST',
      activeIcon: Icons.bar_chart,
      inactiveIcon: Icons.bar_chart_outlined,
    ),
    NavItem(
      index: 3,
      label: 'CARDS',
      activeIcon: Icons.auto_awesome,
      inactiveIcon: Icons.auto_awesome_outlined,
    ),
    NavItem(
      index: 4,
      label: 'GUIDES',
      activeIcon: Icons.menu_book,
      inactiveIcon: Icons.menu_book_outlined,
    ),
  ];

  @override
  void initState() {
    super.initState();
    ShellPage.activeTabNotifier.addListener(_onActiveTabChanged);
  }

  @override
  void dispose() {
    ShellPage.activeTabNotifier.removeListener(_onActiveTabChanged);
    super.dispose();
  }

  void _onActiveTabChanged() {
    if (mounted) {
      setState(() {
        _currentIndex = ShellPage.activeTabNotifier.value;
      });
    }
  }

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
      ShellPage.activeTabNotifier.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(onNavigateTab: _onTabSelected),
      const DecksPage(),
      const TierListPage(),
      const CardsPage(),
      const GuidesPage(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF0D0D11),
          border: Border(
            top: BorderSide(
              color: Color(0xFF1B1B24),
              width: 1,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _navItems.map((item) {
              final isSelected = _currentIndex == item.index;
              final color =
                  isSelected ? const Color(0xFFE52E3D) : const Color(0xFF757582);

              return InkWell(
                onTap: () => _onTabSelected(item.index),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isSelected ? item.activeIcon : item.inactiveIcon,
                      color: color,
                      size: 22,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: TextStyle(
                        color: color,
                        fontSize: 10,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
