import 'package:flutter/material.dart';
import 'package:ukk_kasir/homepenjualan.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ukk_kasir/main.dart';

class UpdateProduk extends StatefulWidget {
  final int Produkid;

  const UpdateProduk({super.key, required this.Produkid});

  @override
  State<UpdateProduk> createState() => _UpdateProdukState();
}

class _UpdateProdukState extends State<UpdateProduk> {
  final _nmplg = TextEditingController();
  final _alamat = TextEditingController();
  final _stok = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadProdukData();
  }

  // Fungsi untuk memuat data pelanggan berdasarkan ID
  Future<void> _loadProdukData() async {
    final data = await Supabase.instance.client
        .from('detailproduk')
        .select()
        .eq('ProdukID', widget.Produkid)
        .single();

    setState(() {
      _nmplg.text = data['namaproduk'] ?? '';
      _alamat.text = data['alamat'] ?? '';
      _stok.text = data['stok'] ?? '';
    });
  }

Future<void> UpdateProduk() async {
  if (_formKey.currentState!.validate()) {
    await Supabase.instance.client.from('detailproduk').update({
      'namaProduk': _nmplg.text,
      'alamat': _alamat.text,
      'stok': _stok.text,
    }).eq('Produkid', widget.Produkid);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
      (route) => false, // Hapus semua halaman sebelumnya
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nmplg,
                decoration: const InputDecoration(
                  labelText: 'namaproduk',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _alamat,
                decoration: const InputDecoration(
                  labelText: 'alamat',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _stok,
                decoration: const InputDecoration(
                  labelText: 'Stok',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor telepon tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: UpdateProduk,
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}