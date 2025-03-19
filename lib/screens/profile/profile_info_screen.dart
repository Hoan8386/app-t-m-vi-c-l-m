import 'package:flutter/material.dart';

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildProfileHeader(theme),
            const SizedBox(height: 24),
            _buildContactSection(theme),
            const SizedBox(height: 24),
            _buildAboutSection(theme),
            const SizedBox(height: 24),
            _buildSkillsSection(theme, isDarkMode),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(ThemeData theme) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: theme.primaryColor, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 60,
            backgroundImage: const AssetImage("assets/profile.jpg"),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Nguyễn Văn A",
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
          ),
        ),
        Text(
          "Flutter Developer",
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildContactSection(ThemeData theme) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildInfoRow(
              icon: Icons.location_on_outlined,
              text: "Hà Nội, Việt Nam",
              theme: theme,
            ),
            const Divider(height: 24),
            _buildInfoRow(
              icon: Icons.email_outlined,
              text: "nguyenvana@email.com",
              theme: theme,
            ),
            const Divider(height: 24),
            _buildInfoRow(
              icon: Icons.phone_android_outlined,
              text: "+84 123 456 789",
              theme: theme,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection(ThemeData theme) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "GIỚI THIỆU",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Lập trình viên Flutter với 3 năm kinh nghiệm. Đam mê phát triển ứng dụng di động, tối ưu hiệu suất và trải nghiệm người dùng.",
              style: theme.textTheme.bodyLarge?.copyWith(
                height: 1.5,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsSection(ThemeData theme, bool isDarkMode) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "KỸ NĂNG CHUYÊN MÔN",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildSkillChip("Dart & Flutter", isDarkMode),
                _buildSkillChip("REST API & Firebase", isDarkMode),
                _buildSkillChip(
                  "State Management (Provider, Bloc)",
                  isDarkMode,
                ),
                _buildSkillChip("UI/UX Design & Animations", isDarkMode),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String text,
    required ThemeData theme,
  }) {
    return Row(
      children: [
        Icon(icon, color: theme.primaryColor, size: 28),
        const SizedBox(width: 16),
        Text(
          text,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillChip(String skill, bool isDarkMode) {
    return Chip(
      label: Text(skill),
      backgroundColor: isDarkMode ? Colors.blueGrey[800] : Colors.blueGrey[50],
      labelStyle: TextStyle(
        color: isDarkMode ? Colors.white : Colors.blueGrey[800],
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.blueGrey.withOpacity(0.2), width: 1),
      ),
    );
  }
}
