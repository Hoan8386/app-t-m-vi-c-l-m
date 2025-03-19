import 'package:app_tim_viec_lam/screens/profile/create_cv_screen.dart';
import 'package:app_tim_viec_lam/screens/profile/profile_info_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.black26,
        leading: IconButton(
          icon: Icon(Icons.menu, color: theme.primaryColor),
          onPressed: () => Scaffold.of(context).openEndDrawer(),
        ),
        title: Text(
          "Thông tin hồ sơ",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black87,
            letterSpacing: 0.5,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            _buildHeaderSection(theme, screenWidth),
            SizedBox(height: 30),
            _buildCVButtonsSection(theme, screenWidth, context),
          ],
        ),
      ),

      endDrawer: _buildCustomDrawer(context, theme),
    );
  }

  Widget _buildHeaderSection(ThemeData theme, double screenWidth) {
    return Column(
      children: [
        Icon(Icons.description_outlined, size: 80, color: theme.primaryColor),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Thêm CV vào Indeed",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
              height: 1.3,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            "Tạo hoặc tải lên CV của bạn để bắt đầu ứng tuyển",
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }

  Widget _buildCVButtonsSection(
    ThemeData theme,
    double screenWidth,
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          _buildActionButton(
            icon: Icons.upload_file,
            label: "Tải lên CV",
            color: theme.primaryColor,
            onPressed: () {},
          ),
          SizedBox(height: 20),
          _buildActionButton(
            icon: Icons.edit_document,
            label: "Xây dựng Indeed CV",
            color: Colors.green[600]!,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateCVScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        shadowColor: Colors.black26,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 26),
          SizedBox(width: 15),
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomDrawer(BuildContext context, ThemeData theme) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        children: [
          // Drawer Header
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: theme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Center(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: theme.primaryColor,
                  child: Icon(Icons.person, size: 35, color: Colors.white),
                ),
                title: Text(
                  "Người dùng",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Xem hồ sơ"),
              ),
            ),
          ),

          // Drawer Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 20),
              children: [
                _buildDrawerItem(
                  icon: Icons.person_outline,
                  label: "Thông tin tài khoản",
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileInfoScreen(),
                        ),
                      ),
                ),
                _buildDrawerItem(
                  icon: Icons.settings_outlined,
                  label: "Cài đặt",
                ),
                _buildDrawerItem(
                  icon: Icons.description_outlined,
                  label: "Điều khoản",
                ),
                Divider(height: 40, indent: 20, endIndent: 20),
                _buildDrawerItem(
                  icon: Icons.logout,
                  label: "Đăng xuất",
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String label,
    Color color = Colors.black87,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: color),
      contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      onTap: onTap,
    );
  }
}
