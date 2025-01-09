import 'package:flutter/material.dart';
import 'loginpage.dart';  
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ukk_kasir/homepenjualan.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Supabase.initialize(
    url:'https:vdaiftjeqmqhoiylczph.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZkYWlmdGplcW1xaG9peWxjenBoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzYzODI3MjAsImV4cCI6MjA1MTk1ODcyMH0.HbwTjEPylm-oYoTfevSPx6-T1mtnejuCYe3ZtRLsAPU' );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),  // Halaman pertama yang ditampilkan
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 181, 145, 186),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Menambahkan gambar
            Image.asset(
              'asset/OIP-removebg-preview.png',  // Pastikan gambar ada di folder assets
              height: 135, 
              width: 135,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 35,
                color: Color.fromARGB(255, 167, 123, 176),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Login to your account',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 41, 30, 43),
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String value) {},
                    validator: (value) {
                      return value!.isEmpty ? 'Please enter email' : null;
                    },
                  ),
                  SizedBox(height: 38),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String value) {},
                    validator: (value) {
                      return value!.isEmpty ? 'Please enter password' : null;
                    },
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage(title: 'Home Penjualan'),)
                      );
                    },
                    child: Text('sing up'),
                    style: ElevatedButton.styleFrom(
                      iconColor: Colors.purple, 
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



