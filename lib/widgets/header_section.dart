import 'package:flutter/material.dart';
import '../data/auth_repository.dart';

class HeaderSection extends StatelessWidget {
  final VoidCallback? onProfileTap;

  const HeaderSection({super.key, this.onProfileTap});

  @override
  Widget build(BuildContext context) {
    final authRepo = AuthRepository();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
            children: [
              TextSpan(
                text: 'GENESYS',
                style: TextStyle(color: Colors.white),
              ),
              TextSpan(
                text: 'META',
                style: TextStyle(color: Color(0xFFE52E3D)),
              ),
            ],
          ),
        ),
        ListenableBuilder(
          listenable: authRepo,
          builder: (context, _) {
            final isLoggedIn = authRepo.isLoggedIn;

            return Row(
              children: [
                if (isLoggedIn) ...[
                  IconButton(
                    icon: const Icon(
                      Icons.bookmark_outline,
                      color: Color(0xFFB0B0BD),
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/bookmarks');
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.quiz_outlined,
                      color: Color(0xFFB0B0BD),
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/quiz');
                    },
                  ),
                  const SizedBox(width: 4),
                ],
                InkWell(
                  onTap: onProfileTap ??
                      () {
                        if (isLoggedIn) {
                          Navigator.pushNamed(context, '/profile');
                        } else {
                          Navigator.pushNamed(context, '/login');
                        }
                      },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF3A0A8),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person_outline,
                      color: Color(0xFF1E1E24),
                      size: 20,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
