import 'package:app_rental_oto/models/pesanan.dart';

class User {
  final String nama;
  final String imageUrl;
  final List<Pesanan> pesanan;
  final List<Pesanan> keranjang;

  User({
    required this.imageUrl,
    required this.nama,
    required this.keranjang,
    required this.pesanan,
  });
}
