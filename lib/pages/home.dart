import 'package:flutter/material.dart';
import 'login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 350,
        leading: Container(
          margin: const EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset(
                'assets/images/icon_transparant.png',
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),
              Container(
                margin: const EdgeInsets.only(top: 14),
                child: const Text(
                  "KEDAI KAMBOJA",
                  style: TextStyle(
                    color: Color(0xFFD64A15),
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 80),
              Image.asset('assets/images/pos_logo_transparan.png'),
              const SizedBox(height: 30),

              const Text(
                "Point of Sale System",
                style: TextStyle(
                  color: Color(0xFFD64A15),
                  fontSize: 32,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Atur pesanan lebih cepat pelayanan lebih mantap",
                style: TextStyle(
                  color: Color(0xFFD64A15),
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),

              const Text(
                "Kasir otomatis kerja jadi praktis",
                style: TextStyle(
                  color: Color(0xFFD64A15),
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 60),

              // Button LOGIN
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize:
                      Size(MediaQuery.of(context).size.width - 160, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  backgroundColor: const Color(0xFFD5633A),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Button REGISTER
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize:
                      Size(MediaQuery.of(context).size.width - 160, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
                onPressed: () {},
                child: const Text("REGISTER"),
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
