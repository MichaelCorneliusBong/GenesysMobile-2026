import '../models/guide.dart';

class GuidesRepository {
  final List<GuideModel> _guides = const [];

  List<GuideModel> getPublishedGuides() {
    return _guides.where((g) => g.isPublished).toList();
  }

  bool hasGuides() => getPublishedGuides().isNotEmpty;
}
