import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/alat.dart';
import '../providers/alat_provider.dart';

class AddAlatPage extends StatefulWidget {
  const AddAlatPage({super.key});

  @override
  State<AddAlatPage> createState() => _AddAlatPageState();
}

class _AddAlatPageState extends State<AddAlatPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaPic1Controller = TextEditingController();
  final TextEditingController _telpPic1Controller = TextEditingController();
  final TextEditingController _namaPic2Controller = TextEditingController();
  final TextEditingController _telpPic2Controller = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _telpAlatController = TextEditingController();
  final TextEditingController _linkMapController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();

  bool _isSubmitting = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      final alatProvider = Provider.of<AlatProvider>(context, listen: false);
      bool success = await alatProvider.addAlat(
        Alat(
          idAlat: 0, // Will be assigned by server
          namaPic1: _namaPic1Controller.text,
          telpPic1: _telpPic1Controller.text,
          namaPic2: _namaPic2Controller.text.isEmpty ? null : _namaPic2Controller.text,
          telpPic2: _telpPic2Controller.text.isEmpty ? null : _telpPic2Controller.text,
          alamat: _alamatController.text,
          telp: _telpAlatController.text,
          linkMaps: _linkMapController.text,
          longitude: double.tryParse(_longitudeController.text) ?? 0.0,
          latitude: double.tryParse(_latitudeController.text) ?? 0.0,
        ),
      );

      if (success) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Berhasil"),
              content: const Text("Alat berhasil ditambahkan."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Error"),
              content: Text("Gagal menambahkan alat: ${alatProvider.errorMessage}"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }

      setState(() {
        _isSubmitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Color(0xFF4872B1)),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                Center(
                  child: Image.asset(
                    'assets/images/logo2.png',
                    width: 80,
                    height: 80,
                  ),
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    "Tambah Alat",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4872B1),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(_namaPic1Controller, "Nama PIC 1"),
                const SizedBox(height: 10),
                _buildTextField(_telpPic1Controller, "Nomor Telepon PIC 1"),
                const SizedBox(height: 10),
                _buildTextField(_namaPic2Controller, "Nama PIC 2"),
                const SizedBox(height: 10),
                _buildTextField(_telpPic2Controller, "Nomor Telepon PIC 2"),
                const SizedBox(height: 10),
                _buildTextField(_alamatController, "Alamat Alat"),
                const SizedBox(height: 10),
                _buildTextField(_telpAlatController, "Nomor Telepon Alat"),
                const SizedBox(height: 10),
                _buildTextField(_linkMapController, "Link Map"),
                const SizedBox(height: 10),
                _buildTextField(_longitudeController, "Longitude"),
                const SizedBox(height: 10),
                _buildTextField(_latitudeController, "Latitude"),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isSubmitting ? null : _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4872B1),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: _isSubmitting
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          )
                        : const Text(
                            "Konfirmasi",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String labelText,
  ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0xFF4872B1)),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFA1BED6)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFA1BED6), width: 2),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$labelText wajib diisi";
        }
        return null;
      },
    );
  }
}
