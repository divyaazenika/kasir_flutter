import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(), // Memastikan nama widget menggunakan PascalCase
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 181, 145, 186),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Menambahkan gambar
              Image.asset(
                'asset/d1a7c007dc2b34561e39a2b6d6d874fe-removebg-preview.png', 
                height: 400,
                width: 500,
              ),
              SizedBox(height: 20), 
              // Menambahkan tulisan di bawah gambar
              Text(
                'Welcome to Smart Library', 
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 216, 198, 219), 
                ),
              ),
              SizedBox(height: 30), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginPage()),
                      );
                    },
                    child: Text('Registrasi'),
                    style: ElevatedButton.styleFrom(
                      iconColor: Colors.purple,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(width: 30), 
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginPage()), 
                      );
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      iconColor: Colors.purple,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


