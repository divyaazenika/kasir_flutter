
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ukk_kasir/homepenjualan.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ukk_kasir/main.dart';
import 'package:ukk_kasir/pelanggan/index.dart';

class AddPelanggan extends StatefulWidget {
  const AddPelanggan({super.key});

  @override
  State<AddPelanggan> createState() => _AddPelangganState();
}

class _AddPelangganState extends State<AddPelanggan> {
  final _nmplg = TextEditingController();
  final _alamat = TextEditingController();
  final _notlp = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> langgan() async {
    if (_formKey.currentState!.validate()) {
      final String namapelanggan = _nmplg.text;
      final String alamat = _alamat.text;
      final String nomertelepon = _notlp.text;

      final response = await Supabase.instance.client.from('pelanggan').insert([
        {
          'namapelanggan': namapelanggan,
          'alamat': alamat,
          'nomertelepon': nomertelepon,
        }
      ]);

      // Cek jika ada error pada response
      if (response == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PelangganTab()));
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pelanggan'),
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
                  labelText: 'namapelanggan',
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
                controller:_notlp,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  labelText: 'nomertelepon',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomer tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: langgan,
                child: const Text('Tambah'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}