import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,   // set background putih
        elevation: 0,           //menghilangkan shadow     
        leadingWidth: 350,
        leading: Container(
          margin: EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset('assets/images/icon_transparant.png',
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),
              Container(
                margin: EdgeInsets.only(top: 0), // ⬅️ margin top 5px
                child: Text(
                  "KEDAI KAMBOJA",
                  style: TextStyle(
                    color: Color(0xFFD64A15),
                    fontSize: 32,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 80),
              Image.asset('assets/images/pos_logo_transparan.png'),
              SizedBox(height: 30),
              Container(
                  margin: EdgeInsets.only(top: 0), // ⬅️ margin top 5px
                  child: Text(
                    "Point of Sale System",
                    style: TextStyle(
                      color: Color(0xFFD64A15),
                      fontSize: 32,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              SizedBox(height: 10),
              Container(
                  margin: EdgeInsets.only(top: 0), // ⬅️ margin top 5px
                  child: Text(
                    "Atur pesanan lebih cepat pelayanan lebih mantap",
                    style: TextStyle(
                      color: Color(0xFFD64A15),
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
         
              Container(
                  margin: EdgeInsets.only(top: 0), // ⬅️ margin top 5px
                  child: Text(
                    "Kasir otomatis kerja jadi praktis",
                    style: TextStyle(
                      color: Color(0xFFD64A15),
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              
              SizedBox(height: 60),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width -160, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11), // atur radius di sini
                  ),
                  // warna utama (RGB)
                  backgroundColor: Color.fromARGB(255, 213, 99, 58),
                  // efek saat ditekan
                  overlayColor: const Color.fromARGB(255, 30, 120, 220),
                ),
                onPressed: () {}, 
                 child: const Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width -160, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11), // atur radius di sini
                  ),
                   // efek saat ditekan
                  overlayColor: const Color.fromARGB(255, 30, 120, 220),
                ),
                onPressed: () {}, 
                child: Text("REGISTER")
              ),
            ],
          ),
        ),
      ),
    );
  }
}

