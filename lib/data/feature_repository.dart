import 'package:flutter/material.dart';
import '../models/platform_feature.dart';

class FeatureRepository {
  List<PlatformFeature> getFeatures() {
    return const [
      PlatformFeature(
        id: 'deck_db',
        title: 'Deck Database',
        description:
            'Browse tournament-ready deck lists from multiple archetypes.',
        icon: Icons.inventory_2_outlined,
      ),
      PlatformFeature(
        id: 'format_guides',
        title: 'Format Guides',
        description:
            'Learn combos, advanced deck building, and specific matchup strategies.',
        icon: Icons.article_outlined,
      ),
      PlatformFeature(
        id: 'card_search',
        title: 'Card Search',
        description:
            'Search every legal card available in the Genesys database.',
        icon: Icons.search,
      ),
      PlatformFeature(
        id: 'knowledge_quiz',
        title: 'Knowledge Quiz',
        description:
            'Test your ruling knowledge and improve your understanding of the format.',
        icon: Icons.fact_check_outlined,
      ),
    ];
  }
}
