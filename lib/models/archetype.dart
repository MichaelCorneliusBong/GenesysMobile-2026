class Archetype {
  final String id;
  final String name;
  final String badgeText;
  final bool verified;
  final int variantCount;
  final List<String> variants;

  const Archetype({
    required this.id,
    required this.name,
    this.badgeText = '0',
    this.verified = true,
    required this.variantCount,
    required this.variants,
  });
}
