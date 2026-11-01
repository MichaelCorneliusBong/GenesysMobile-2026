import 'package:flutter/material.dart';
import '../models/card_item.dart';

class CardGridItem extends StatelessWidget {
  final CardItem card;
  final VoidCallback? onTap;

  const CardGridItem({
    super.key,
    required this.card,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasGp = card.gpPoints > 0;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF14141A),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF22222B),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap ??
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Card (${card.gpPoints} GP) Selected'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.hide_image_outlined,
                      color: Color(0xFF42424D),
                      size: 28,
                    ),
                    SizedBox(height: 6),
                    Text(
                      'NO IMAGE',
                      style: TextStyle(
                        color: Color(0xFF42424D),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: hasGp
                        ? const Color(0xFF3B2A08)
                        : const Color(0xFF1F1F28),
                    borderRadius: BorderRadius.circular(4),
                    border: hasGp
                        ? Border.all(
                            color: const Color(0xFFB88A14).withValues(alpha: 0.5))
                        : null,
                  ),
                  child: Text(
                    '${card.gpPoints} GP',
                    style: TextStyle(
                      color: hasGp
                          ? const Color(0xFFFFC107)
                          : const Color(0xFF8E8E9A),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
