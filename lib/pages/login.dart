import 'package:flutter/material.dart';
import 'dashboard.dart';
import '../api/api_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

 bool loading = false;

  void doLogin() async {
    setState(() => loading = true);

    final res = await ApiService.login(
      usernameController.text,
      passwordController.text,
    );

    setState(() => loading = false);

    if (res["status"] == true) {
      // Berhasil login → lanjut ke Dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
    } else {
      // Gagal login → tampilkan alert
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res["message"]),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // ======================================================
  // UI LOGIN PAGE
  // ======================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xFFD64A15),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            // Logo
            Image.asset(
              'assets/images/logo_transparant.png',
              height: 160,
            ),

            const SizedBox(height: 20),

            const Text(
              "Kasir lancar pelanggan senang",
              style: TextStyle(
                color: Color(0xFFD64A15),
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Silakan login untuk melanjutkan",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontFamily: 'Roboto',
              ),
            ),

            const SizedBox(height: 40),

            // Username Input
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Username",
                prefixIcon: const Icon(Icons.person, color: Color(0xFFD64A15)),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFD64A15)),
                  borderRadius: BorderRadius.circular(12),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Password Input
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: const Icon(Icons.lock, color: Color(0xFFD64A15)),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFD64A15)),
                  borderRadius: BorderRadius.circular(12),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Button Login
           ElevatedButton(
              onPressed: loading ? null : doLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD64A15),
                fixedSize: Size(MediaQuery.of(context).size.width - 60, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: loading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
