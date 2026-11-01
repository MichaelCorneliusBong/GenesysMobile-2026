import 'package:flutter/material.dart';

class PlatformFeature {
  final String id;
  final String title;
  final String description;
  final IconData icon;

  const PlatformFeature({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
  });
}
