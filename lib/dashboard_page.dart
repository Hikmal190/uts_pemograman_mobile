import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String username =
        ModalRoute.of(context)?.settings.arguments as String? ?? "User";

    return Scaffold(
      backgroundColor: Color(0xFFF8F0FF),
      appBar: AppBar(title: Text("Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              width: double.infinity,
              padding: EdgeInsets.all(12),
              child: Text(
                "Dashboard",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                _dashboardButton(Icons.add, "Counter", () {
                  Navigator.pushNamed(context, '/counter');
                }),
                _dashboardButton(Icons.person, "Profile", () {}),
                _dashboardButton(Icons.settings, "Settings", () {}),
                _dashboardButton(Icons.logout, "Logout", () {
                  Navigator.pushReplacementNamed(context, '/');
                }),
              ],
            ),
            SizedBox(height: 60),
            Container(
              color: Colors.lightBlue.shade100,
              padding: EdgeInsets.all(16),
              child: Text("Selamat datang, $username !"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dashboardButton(IconData icon, String label, VoidCallback onPressed) {
    return SizedBox(
      width: 140,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 4,
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color.fromARGB(255, 33, 243, 82), size: 60),
            SizedBox(height: 10),
            Text(label, style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
