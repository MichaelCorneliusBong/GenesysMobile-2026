class CardItem {
  final String id;
  final String name;
  final int gpPoints;
  final String cardCode;
  final String type;

  const CardItem({
    required this.id,
    required this.name,
    required this.gpPoints,
    required this.cardCode,
    this.type = 'Monster',
  });
}
