import 'package:get/get_utils/get_utils.dart';

String? inputValidator(String? value, String label) {
  if (value == null) {
    return "$label tidak boleh kosong";
  }
  if (value.isEmpty) {
    return "$label tidak boleh kosong";
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Silakan masukkan nomor telepon';
  }

  // Ekspresi reguler untuk memvalidasi nomor telepon Indonesia
  final RegExp phoneRegex = RegExp(r'^08[0-9]{8,10}$');

  if (!phoneRegex.hasMatch(value)) {
    return 'Silakan masukkan nomor telepon yang valid';
  }
  return null; // Kembali null jika input valid
}

String? emailValidator(String? e) {
  if (e == null || e.isEmpty) {
    return "Email tidak boleh kosong";
  }

  if (!e.isEmail) {
    return "Email tidak valid";
  }
  return null;
}
