import 'package:flutter/material.dart';
import 'matakuliah_detail.dart';

class MatakuliahForm extends StatefulWidget {
  const MatakuliahForm({super.key});

  @override
  State<MatakuliahForm> createState() => _MatakuliahFormState();
}

class _MatakuliahFormState extends State<MatakuliahForm> {
  final _formKey = GlobalKey<FormState>();
  final _matakuliahCtrl = TextEditingController();
  final _sksCtrl = TextEditingController();
  final _semesterCtrl = TextEditingController();

  int sks = 0;

  @override
  void initState() {
    super.initState();
    sks = int.tryParse(_sksCtrl.text) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Matakuliah")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              matakuliahField(),
              const SizedBox(height: 10),
              sksField(),
              const SizedBox(height: 10),
              semesterField(),
              const SizedBox(height: 20),
              tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  Widget matakuliahField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "MATAKULIAH"),
      controller: _matakuliahCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Mata kuliah tidak boleh kosong";
        }
        return null;
      },
    );
  }

  Widget sksField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "SKS"),
      controller: _sksCtrl,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "SKS tidak boleh kosong";
        }
        if (int.tryParse(value) == null) {
          return "SKS harus berupa angka";
        }
        return null;
      },
    );
  }

  Widget semesterField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "SEMESTER"),
      controller: _semesterCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Semester tidak boleh kosong";
        }
        return null;
      },
    );
  }

  Widget tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          sks = int.tryParse(_sksCtrl.text) ?? 0;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MatakuliahDetail(
                matakuliah: _matakuliahCtrl.text,
                sks: sks,
                semester: _semesterCtrl.text,
              ),
            ),
          );
        }
      },
      child: const Text("Simpan"),
    );
  }
}
