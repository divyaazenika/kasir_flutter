import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ukk_kasir/pelanggan/index.dart';
import 'package:ukk_kasir/pelanggan/insert.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: MyHomePage(title: 'Home Penjualan'),
  ));
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedOrderType;
  bool isMakananVisible = false;
  Map<String, int> cart = {}; 

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color.fromARGB(255, 122, 106, 132),
          foregroundColor: Colors.white,
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.person, color: Colors.white),
                child: Text('pelanggan', style: TextStyle(color: Colors.white)),
              ),
              Tab(
                icon: Icon(Icons.shopping_bag, color: Colors.white),
                child: Text('penjualan', style: TextStyle(color: Colors.white)),
              ),
              Tab(
                icon: Icon(Icons.shopping_bag, color: Colors.white),
                child: Text('produk', style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              SizedBox(
                height: 100,
                child: DrawerHeader(
                  child: ListTile(
                    leading: Icon(Icons.arrow_back),
                    title: Text(
                      'Pengaturan dan Aktivitas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text('Dashbord'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.bar_chart),
                title: Text('Laporan'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Setting'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.arrow_back),
                title: Text('Log Out'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PelangganTab(),
            Center(child: Text('coba1')),
          ],
        ),
        // FloatingActionButton added here
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
             MaterialPageRoute(builder: (context) => AddPelanggan())
            );
          },
          backgroundColor: Color.fromARGB(255, 122, 106, 132),
          child: Icon(Icons.add), // Icon for "Tambah"
        ),
      ),
    );
  }

  ElevatedButton _buildCategoryButton(String label) {
    return ElevatedButton(
      onPressed: () {
        if (label == 'Makanan') {
          setState(() {
            isMakananVisible = !isMakananVisible;
          });
        }
      },
      style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 163, 129, 205)),
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildCategoryItem(String name, String imagePath) {
    return GestureDetector(
      onTap: () {
        _showQuantityDialog(name);
      },
      child: Card(
        color: Colors.brown[100],
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dialog untuk memilih jumlah produk
  void _showQuantityDialog(String productName) {
    int quantity = cart[productName] ?? 0;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Pilih Jumlah untuk $productName'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Jumlah yang ingin dibeli:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      if (quantity > 0) {
                        setState(() {
                          cart[productName] = quantity - 1;
                        });
                      }
                    },
                  ),
                  Text(quantity.toString()),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        cart[productName] = quantity + 1;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Tutup'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  if (quantity > 0) {
                    cart[productName] = quantity;
                  }
                });
              },
              child: Text('Tambahkan ke Keranjang'),
            ),
          ],
        );
      },
    );
  }
}
