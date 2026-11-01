import 'package:flutter/material.dart';
import '../widgets/empty_state_card.dart';
import '../widgets/header_section.dart';

class GuidesPage extends StatelessWidget {
  const GuidesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D11),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          physics: const BouncingScrollPhysics(),
          children: [
            const HeaderSection(),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFF421016),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF8B1D28),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE52E3D),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'KNOWLEDGE BASE',
                      style: TextStyle(
                        color: Color(0xFFE52E3D),
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Guides',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Learn the fundamentals of the Genesys Format, improve your gameplay, and master every archetype through detailed strategy guides.',
              style: TextStyle(
                color: Color(0xFF9E9EA8),
                fontSize: 13,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 28),
            const EmptyStateCard(
              icon: Icons.menu_book_outlined,
              title: 'No Guides Available',
              description: 'New strategic guides and articles will appear here soon.',
              showBadgeDot: true,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
