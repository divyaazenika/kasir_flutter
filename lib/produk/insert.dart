import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ukk_kasir/homepenjualan.dart';
import 'package:ukk_kasir/main.dart';
import 'package:ukk_kasir/produk/index.dart';
import 'package:ukk_kasir/produk/insert.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProdukTab extends StatefulWidget {
  const ProdukTab({super.key});

  @override
  State<ProdukTab> createState() => _ProdukTabState();
}

class _ProdukTabState extends State<ProdukTab> {
  List<Map<String, dynamic>> produk = [];
  bool isLoading = true;
  @override
  void initState(){
    super.initState();
    fetchProduk();
  }
  Future<void>fetchProduk() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await Supabase.instance.client.from('produk').select();
      setState(() {
        produk = List<Map<String, dynamic>>.from(response);
        isLoading = false;
      });
    } catch (e) {
      print(': $e');
      setState(() {
        isLoading = false;
      });
    }
  }
  Future<void> deleteProduk(int id) async{
    try{
      await Supabase.instance.client.from('produk').delete().eq('id', id);
      fetchProduk();
    }catch (e) {
      print(': $e');
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
            child: LoadingAnimationWidget.twoRotatingArc(color: Colors.grey, size: 30),
          )
        : produk.isEmpty
        ? Center(
          child: Text('tidak ada produk',
          style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold
          ),
          ),
        )
      : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12
        ),padding: EdgeInsets.all(8),
        itemCount: produk.length,
        itemBuilder: (context, index) {
          final prd = produk[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            child: SizedBox(
              height: 50,
              width: 10,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      prd['namaproduk'] ?? 'Nama Tidak Tersedia',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20,
                      )
                    ),
                    SizedBox(height: 4),
                    Text(
                      prd['harga'] != null ? prd['harga'].toString() : 'Harga Tidak Tersedia',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      prd['stok'] != null ? prd['stok'].toString() : 'Stok Tidak Tersedia',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => addproduk()));
      },
      child: Icon(Icons.add)
    )
    );
  }
}