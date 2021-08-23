import 'package:app_rental_oto/models/kendaraan.dart';

class Penyewa {
  final String imageUrl;
  final String nama;
  final String alamat;
  final int peringkat;
  List<Kendaraan> tersedia;

  Penyewa({
    required this.imageUrl,
    required this.peringkat,
    required this.alamat,
    required this.nama,
    required this.tersedia,
  });
}
