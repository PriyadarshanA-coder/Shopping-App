import 'package:demo/change_pass.dart';
import 'package:demo/edit_profile.dart';
import 'package:demo/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'loginpage.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  // Custom colors
  final Color softBeige = const Color(0xFFF5F5F5); // Background color
  final Color _accountSectionColor = const Color(0xFFFFFFFF); // White
  final Color _preferencesSectionColor = const Color(0xFFFFFFFF); // White
  final Color softbeige = Color(0xFFFDF6EC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softbeige,
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                  },
                  icon: const Icon(Icons.arrow_back_outlined),
                ),
                const SizedBox(width: 90),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10),
                  child: Text(
                    'Settings',
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                // Account Section
                _buildSettingsSection(
                  title: "Account",
                  sectionColor: _accountSectionColor,
                  children: [
                    _buildSettingsTile(
                      icon: Icons.person_outline,
                      title: "Edit Profile",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
                      },
                    ),
                    _buildSettingsTile(
                      icon: Icons.lock_outline,
                      title: "Change Password",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  ChangePass()));
                      },
                    ),
                  ],
                ),

                // Preferences Section
                _buildSettingsSection(
                  title: "Preferences",
                  sectionColor: _preferencesSectionColor,
                  children: [
                    _buildSettingsTile(
                      icon: Icons.notifications_outlined,
                      title: "Notifications",
                      trailing: Switch(
                        value: _notificationsEnabled,
                        onChanged: (value) {
                          setState(() {
                            _notificationsEnabled = value;
                          });
                        },
                      ),
                    ),
                    _buildSettingsTile(
                      icon: Icons.dark_mode_outlined,
                      title: "Dark Mode",
                      trailing: Switch(
                        value: _darkModeEnabled,
                        onChanged: (value) {
                          setState(() {
                            _darkModeEnabled = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
               SizedBox(height: 20),
                // Logout Button
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.logout, color: Colors.white),
                    label: const Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide.none, // Remove border
                      ),
                      elevation: 2, // Add slight shadow
                    ),
                    onPressed: () => _showLogoutDialog(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection({
    required String title,
    required List<Widget> children,
    required Color sectionColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          elevation: 0,
          color: sectionColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Theme.of(context).dividerColor.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              // Perform logout
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpage()));
              // Navigate to login screen
            },
            child: Text(
              "Logout",
            ),
          ),
        ],
      ),
    );
  }
}