import 'package:flutter/material.dart';
import 'package:ukk_kasir/homepenjualan.dart';
import 'package:ukk_kasir/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
      home: HomePage(), // Memastikan nama widget menggunakan PascalCase
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final SupabaseClient supabase = Supabase.instance.client;
  bool _isPasswordVisible = false;

  // fungsi login dengan memverifikasi username dan password di supabase
  Future<void> _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Check if fields are empty
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Username atau Password tidak boleh kosong!')),
      );
      return;
    }

    try {
      final response = await supabase
          .from('user')
          .select('username, password')
          .eq('username', username)
          .maybeSingle();

      if (response == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Username tidak ditemukan!')),
        );
        return;
      }

      if (response['password'] == password) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login berhasil!')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()), // Navigate to HomePage
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password salah!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: ${e.toString()}')),
      );
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 181, 145, 186),
      ),
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
                  color: Color.fromARGB(255, 83, 59, 87), 
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
                                LoginPage()), // Navigasi ke halaman lain
                      );
                    },  
                    child: Text('Registrasi'),
                    style: ElevatedButton.styleFrom(
                      iconColor: Colors.purple,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
                                HomePage()), // Navigasi ke halaman lain
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
