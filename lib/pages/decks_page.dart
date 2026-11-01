import 'package:flutter/material.dart';
import '../data/decks_repository.dart';
import '../models/archetype.dart';
import '../widgets/archetype_card.dart';
import '../widgets/header_section.dart';

class DecksPage extends StatefulWidget {
  const DecksPage({super.key});

  @override
  State<DecksPage> createState() => _DecksPageState();
}

class _DecksPageState extends State<DecksPage> {
  final DecksRepository _repository = DecksRepository();
  final TextEditingController _searchController = TextEditingController();
  List<Archetype> _filteredArchetypes = [];

  @override
  void initState() {
    super.initState();
    _filteredArchetypes = _repository.getAllArchetypes();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _filteredArchetypes = _repository.searchArchetypes(query);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D11),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          physics: const BouncingScrollPhysics(),
          children: [
            const HeaderSection(),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFF421016),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF8B1D28),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE52E3D),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'DECK DATABASE',
                      style: TextStyle(
                        color: Color(0xFFE52E3D),
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Browse Archetypes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Explore every supported archetype in the Genesys Format. Each archetype contains tournament-ready deck variants, player submissions, and optimized deck builds.',
              style: TextStyle(
                color: Color(0xFF9E9EA8),
                fontSize: 13,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Filter archetypes...',
                hintStyle: const TextStyle(color: Color(0xFF5A5A66), fontSize: 14),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF6E6E7A), size: 18),
                filled: true,
                fillColor: const Color(0xFF14141A),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(color: Color(0xFF22222B)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(color: Color(0xFFE52E3D)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_filteredArchetypes.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child: Text(
                    'Tidak ada archetype ditemukan',
                    style: TextStyle(color: Color(0xFF8E8E9A)),
                  ),
                ),
              )
            else
              ..._filteredArchetypes.map(
                (archetype) => ArchetypeCard(archetype: archetype),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
