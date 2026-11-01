import 'package:flutter/material.dart';
import '../data/auth_repository.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/header_section.dart';
import '../widgets/section_title.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthRepository _authRepo = AuthRepository();

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    final user = _authRepo.currentUser;
    _nameController = TextEditingController(text: user?.name ?? 'Alex Turner');
    _emailController =
        TextEditingController(text: user?.email ?? 'alexturner@gmail.com');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Account changes successfully saved!'),
        backgroundColor: Color(0xFF1B1B24),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _handleLogout() {
    _authRepo.logout();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Successfully Logged Out.'),
        backgroundColor: Color(0xFF1B1B24),
        duration: Duration(seconds: 1),
      ),
    );
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    final user = _authRepo.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D11),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          physics: const BouncingScrollPhysics(),
          children: [
            const HeaderSection(),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF14141A),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF22222B)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: const Color(0xFF22222B),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Color(0xFF6E6E7A),
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (user?.name ?? 'ALEX TURNER').toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          user?.email ?? 'alexturner@gmail.com',
                          style: const TextStyle(
                            color: Color(0xFF8E8E9A),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Color(0xFFE52E3D),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.check,
                                  color: Colors.white, size: 10),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: const Color(0xFF421016),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'MEMBER',
                                style: TextStyle(
                                  color: Color(0xFFE52E3D),
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'JOINED NOV 2025',
                              style: TextStyle(
                                color: Color(0xFF6E6E7A),
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    title: 'BOOKMARKS',
                    value: '0',
                    icon: Icons.bookmark_outline,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    title: 'QUIZ PLAYED',
                    value: '0',
                    icon: Icons.person_outline,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    title: 'HIGHEST SCORE',
                    value: '0',
                    icon: Icons.military_tech_outlined,
                    valueColor: const Color(0xFFE52E3D),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    title: 'LAST QUIZ RESULT',
                    value: '-',
                    icon: Icons.history,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            const SectionTitle(title: 'ACCOUNT SETTINGS'),
            const SizedBox(height: 16),
            CustomInputField(
              label: 'Name',
              hintText: 'Alex Turner',
              prefixIcon: Icons.person_outline,
              controller: _nameController,
            ),
            const SizedBox(height: 14),
            CustomInputField(
              label: 'Email',
              hintText: 'alexturner@gmail.com',
              prefixIcon: Icons.email_outlined,
              controller: _emailController,
            ),
            const SizedBox(height: 14),
            CustomInputField(
              label: 'New Password',
              hintText: '••••••••',
              prefixIcon: Icons.lock_outlined,
              isPassword: true,
              controller: _newPasswordController,
            ),
            const SizedBox(height: 14),
            CustomInputField(
              label: 'Confirm Password',
              hintText: '••••••••',
              prefixIcon: Icons.lock_outlined,
              isPassword: true,
              controller: _confirmPasswordController,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _saveChanges,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE52E3D),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save_outlined, size: 18),
                    SizedBox(width: 8),
                    Text(
                      'SAVE CHANGES',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: _handleLogout,
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFF191921),
                  foregroundColor: const Color(0xFFE52E3D),
                  side: const BorderSide(color: Color(0xFF2B2B38)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, size: 18, color: Color(0xFFE52E3D)),
                    SizedBox(width: 8),
                    Text(
                      'LOG OUT',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE52E3D),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    Color valueColor = Colors.white,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF14141A),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF22222B)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF8E8E9A),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              Icon(icon, color: const Color(0xFF5A5A66), size: 16),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
