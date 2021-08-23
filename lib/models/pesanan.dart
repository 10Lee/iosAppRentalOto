import 'package:app_rental_oto/models/kendaraan.dart';
import 'package:app_rental_oto/models/penyewa.dart';

class Pesanan {
  final String tanggal;
  final Kendaraan kendaraan;
  final Penyewa penyewa;
  final int quantitas;

  Pesanan({
    required this.tanggal,
    required this.kendaraan,
    required this.penyewa,
    required this.quantitas,
  });
}
