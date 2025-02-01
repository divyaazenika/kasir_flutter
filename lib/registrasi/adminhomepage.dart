import 'package:flutter/material.dart';
import 'package:ukk_kasir/pelanggan/index.dart';
import 'package:ukk_kasir/penjualan/indexpenjualan.dart';
import 'package:ukk_kasir/produk/index.dart';
import 'package:ukk_kasir/loginpage.dart';
import 'package:ukk_kasir/pelanggan/index.dart';
import 'package:ukk_kasir/penjualan/indexpenjualan.dart';
import 'package:ukk_kasir/produk/insert.dart';
import 'package:ukk_kasir/registrasi/indexuser.dart';


class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.drafts, color: Color.fromARGB(255, 90, 61, 105)), text: 'Detail Penjualan'),
              Tab(icon: Icon(Icons.inventory, color: Color.fromARGB(255, 89, 69, 110)), text: 'Produk'),
              Tab(icon: Icon(Icons.people, color: Color.fromARGB(255, 72, 63, 100)), text: 'Customer'),
              Tab(icon: Icon(Icons.money, color: Color.fromARGB(255, 99, 77, 128)), text: 'Penjualan'),
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AdminHomePage()),
                      );
                    },
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text('Register'),
                onTap: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => UserTab())
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.bar_chart),
                title: Text('Laporan'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Pengaturan'),
              ),
              ListTile(
                leading: Icon(Icons.arrow_back),
                title: Text('Log Out'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProdukTab(),
            PelangganTab(),
            PenjualanTab(),
          ],
        ),
      ),
    );
  }
}