import '../models/card_item.dart';

class CardsRepository {
  final List<CardItem> _cards = const [
    CardItem(id: 'c1', name: 'Blue-Eyes White Dragon', gpPoints: 0, cardCode: '#001'),
    CardItem(id: 'c2', name: 'Dark Magician', gpPoints: 0, cardCode: '#002'),
    CardItem(id: 'c3', name: 'Ash Blossom & Joyous Spring', gpPoints: 8, cardCode: '#003'),
    CardItem(id: 'c4', name: 'Infinite Impermanence', gpPoints: 18, cardCode: '#004'),
    CardItem(id: 'c5', name: 'Effect Veiler', gpPoints: 0, cardCode: '#005'),
    CardItem(id: 'c6', name: 'Nibiru, the Primal Being', gpPoints: 7, cardCode: '#006'),
    CardItem(id: 'c7', name: 'Sabyrz, the Dragon', gpPoints: 0, cardCode: '#007'),
    CardItem(id: 'c8', name: 'Promethean Princess', gpPoints: 0, cardCode: '#008'),
    CardItem(id: 'c9', name: 'Mulcharmy Purulia', gpPoints: 0, cardCode: '#009'),
    CardItem(id: 'c10', name: 'Triple Tactics Talent', gpPoints: 0, cardCode: '#010'),
    CardItem(id: 'c11', name: 'Forbidden Droplet', gpPoints: 5, cardCode: '#011'),
    CardItem(id: 'c12', name: 'Crossout Designator', gpPoints: 0, cardCode: '#012'),
    CardItem(id: 'c13', name: 'Pot of Prosperity', gpPoints: 10, cardCode: '#013'),
    CardItem(id: 'c14', name: 'Called by the Grave', gpPoints: 12, cardCode: '#014'),
    CardItem(id: 'c15', name: 'Harpie\'s Feather Duster', gpPoints: 0, cardCode: '#015'),
    CardItem(id: 'c16', name: 'Lightning Storm', gpPoints: 0, cardCode: '#016'),
    CardItem(id: 'c17', name: 'Divine Arsenal AA-ZEUS', gpPoints: 15, cardCode: '#017'),
    CardItem(id: 'c18', name: 'Accesscode Talker', gpPoints: 0, cardCode: '#018'),
    CardItem(id: 'c19', name: 'Baronne de Fleur', gpPoints: 20, cardCode: '#019'),
    CardItem(id: 'c20', name: 'SP Little Knight', gpPoints: 25, cardCode: '#020'),
    CardItem(id: 'c21', name: 'Super Polymerization', gpPoints: 0, cardCode: '#021'),
    CardItem(id: 'c22', name: 'Cosmic Cyclone', gpPoints: 0, cardCode: '#022'),
  ];

  List<CardItem> getAllCards() {
    return _cards;
  }

  List<CardItem> searchCards(String query) {
    if (query.trim().isEmpty) return _cards;
    return _cards
        .where((c) =>
            c.name.toLowerCase().contains(query.toLowerCase()) ||
            c.cardCode.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
