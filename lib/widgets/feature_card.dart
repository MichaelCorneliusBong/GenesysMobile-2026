import 'package:flutter/material.dart';
import '../models/platform_feature.dart';

class FeatureCard extends StatelessWidget {
  final PlatformFeature feature;
  final VoidCallback? onTap;

  const FeatureCard({
    super.key,
    required this.feature,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
                    content: Text('Membuka ${feature.title} (Prototype)'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: const Color(0xFF22222B),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    feature.icon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  feature.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  feature.description,
                  style: const TextStyle(
                    color: Color(0xFF8E8E9A),
                    fontSize: 13,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
