import '../models/archetype.dart';

class DecksRepository {
  final List<Archetype> _archetypes = const [
    Archetype(
      id: 'blue_eyes',
      name: 'Blue-Eyes',
      badgeText: '0',
      verified: true,
      variantCount: 3,
      variants: ['Blue-Eyes Ritual', 'Blue-Eyes Synchron', 'Pure Blue-Eyes'],
    ),
    Archetype(
      id: 'mimighoul',
      name: 'Mimighoul',
      badgeText: '0',
      verified: true,
      variantCount: 2,
      variants: ['Mimighoul Control', 'Mimighoul Kashtira'],
    ),
    Archetype(
      id: 'radiant_typhoon',
      name: 'Radiant Typhoon',
      badgeText: '0',
      verified: true,
      variantCount: 2,
      variants: ['Radiant OTK', 'Radiant Stun'],
    ),
    Archetype(
      id: 'voiceless_voice',
      name: 'Voiceless Voice',
      badgeText: '0',
      verified: true,
      variantCount: 4,
      variants: ['Voiceless Ritual', 'Voiceless Branded', 'Pure Voiceless'],
    ),
  ];

  List<Archetype> getAllArchetypes() {
    return _archetypes;
  }

  List<Archetype> searchArchetypes(String query) {
    if (query.trim().isEmpty) return _archetypes;
    return _archetypes
        .where((a) => a.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
