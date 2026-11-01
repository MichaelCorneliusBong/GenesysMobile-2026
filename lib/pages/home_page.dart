import 'package:flutter/material.dart';
import '../data/feature_repository.dart';
import '../models/platform_feature.dart';
import '../widgets/feature_card.dart';
import '../widgets/header_section.dart';
import '../widgets/hero_banner.dart';
import '../widgets/section_title.dart';

class HomePage extends StatelessWidget {
  final Function(int)? onNavigateTab;
  final FeatureRepository _repository = FeatureRepository();

  HomePage({super.key, this.onNavigateTab});

  @override
  Widget build(BuildContext context) {
    final List<PlatformFeature> features = _repository.getFeatures();

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D11),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              const SizedBox(height: 24),
              HeroBanner(
                onBrowseDecksTap: () {
                  if (onNavigateTab != null) {
                    onNavigateTab!(1);
                  }
                },
                onSearchCardsTap: () {
                  if (onNavigateTab != null) {
                    onNavigateTab!(3);
                  }
                },
              ),
              const SizedBox(height: 32),
              const SectionTitle(title: 'Platform Features'),
              const SizedBox(height: 16),
              ...features.map(
                (feature) => FeatureCard(
                  feature: feature,
                  onTap: () {
                    _handleFeatureTap(context, feature);
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFeatureTap(BuildContext context, PlatformFeature feature) {
    if (feature.id == 'deck_db' && onNavigateTab != null) {
      onNavigateTab!(1);
    } else if (feature.id == 'card_search' && onNavigateTab != null) {
      onNavigateTab!(3);
    } else if (feature.id == 'format_guides' && onNavigateTab != null) {
      onNavigateTab!(4);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Opening ${feature.title}... (Interactive Prototype)'),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }
}
