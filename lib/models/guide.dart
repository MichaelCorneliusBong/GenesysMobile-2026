class GuideModel {
  final String id;
  final String title;
  final String category;
  final String readTime;
  final String author;
  final bool isPublished;

  const GuideModel({
    required this.id,
    required this.title,
    required this.category,
    required this.readTime,
    required this.author,
    this.isPublished = false,
  });
}
