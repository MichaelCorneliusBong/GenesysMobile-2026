import 'package:flutter/material.dart';

class HeroBanner extends StatelessWidget {
  final VoidCallback? onBrowseDecksTap;
  final VoidCallback? onSearchCardsTap;

  const HeroBanner({
    super.key,
    this.onBrowseDecksTap,
    this.onSearchCardsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
                'YU-GI-OH! GENESYS DATABASE',
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

        const SizedBox(height: 14),

        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              height: 1.15,
            ),
            children: [
              TextSpan(
                text: 'Master the\n',
                style: TextStyle(color: Colors.white),
              ),
              TextSpan(
                text: 'Genesys Format',
                style: TextStyle(
                  color: Color(0xFFE52E3D),
                  shadows: [
                    Shadow(
                      color: Color(0x66E52E3D),
                      blurRadius: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        const Text(
          'Explore competitive deck lists, discover detailed strategy guides, browse community articles, analyze tier lists, search thousands of cards, and challenge yourself with interactive format quizzes.',
          style: TextStyle(
            color: Color(0xFF9E9EA8),
            fontSize: 13,
            height: 1.45,
          ),
        ),

        const SizedBox(height: 20),

        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: onBrowseDecksTap ??
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Membuka Browse Decks...'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE52E3D),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.style_outlined, size: 20),
                SizedBox(width: 8),
                Text(
                  'Browse Decks',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 10),

        SizedBox(
          width: double.infinity,
          height: 48,
          child: OutlinedButton(
            onPressed: onSearchCardsTap ??
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Membuka Search Cards...'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0xFF1B1B22),
              foregroundColor: Colors.white,
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search, size: 20, color: Color(0xFFB0B0BD)),
                SizedBox(width: 8),
                Text(
                  'Search Cards',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
