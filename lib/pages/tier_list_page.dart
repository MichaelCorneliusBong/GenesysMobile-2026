import 'package:flutter/material.dart';
import '../widgets/empty_state_card.dart';
import '../widgets/header_section.dart';

class TierListPage extends StatelessWidget {
  const TierListPage({super.key});

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
                      'META ANALYSIS',
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
              'TIER LISTS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Explore the current Genesys Format metagame. Each tier list ranks archetypes based on tournament performance, consistency, and overall competitiveness.',
              style: TextStyle(
                color: Color(0xFF9E9EA8),
                fontSize: 13,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 28),
            const EmptyStateCard(
              icon: Icons.military_tech_outlined,
              title: 'NO TIER LIST AVAILABLE',
              description:
                  'There are currently no published tier lists. Check back after the next tournament.',
              showBadgeDot: true,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
