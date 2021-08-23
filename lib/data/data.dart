import 'package:app_rental_oto/models/kendaraan.dart';
import 'package:app_rental_oto/models/penyewa.dart';
import 'package:app_rental_oto/models/pesanan.dart';
import 'package:app_rental_oto/models/user.dart';

// Kendaraan

final _alphard =
    Kendaraan(imageUrl: 'assets/images/alphard.jpeg', nama: 'Alphard', hargaSewa: 700);
final _avanza =
    Kendaraan(imageUrl: 'assets/images/avanza.jpg', nama: 'Avanza', hargaSewa: 450);
final _ertiga =
    Kendaraan(imageUrl: 'assets/images/ertiga.jpg', nama: 'Ertiga', hargaSewa: 400);

// Penyewa
final _enterprise = Penyewa(
  imageUrl: 'assets/images/rentcar_enterprise.jpg',
  peringkat: 5,
  alamat: 'Jl. Wolter Monginsidi Manado',
  nama: 'Enterprise Rental',
  tersedia: [
    _alphard,
    _avanza,
    _ertiga,
  ],
);

final _times = Penyewa(
  imageUrl: 'assets/images/rentcar_times.png',
  peringkat: 3,
  alamat: 'Jl. 17 Agustus',
  nama: 'Times Rental Oto',
  tersedia: [
    _avanza,
    _ertiga,
  ],
);

final _yellowCar = Penyewa(
  imageUrl: 'assets/images/rentcar_yellowcar.jpg',
  peringkat: 4,
  alamat: 'Jl. Langsat Sario',
  nama: 'Yellow Car',
  tersedia: [
    _avanza,
    _alphard,
  ],
);

List<Penyewa> providers = [
  _enterprise,
  _times,
  _yellowCar,
];

// Pesanan
// User
final currentUser = User(
  nama: 'Stenly Rachmad',
  imageUrl: 'assets/images/stenlyrachmad.jpg',
  keranjang: [
    Pesanan(
      tanggal: '5 Oktober 2021',
      kendaraan: _alphard,
      penyewa: _enterprise,
      quantitas: 1,
    ),
    Pesanan(
      tanggal: '5 Oktober 2021',
      kendaraan: _ertiga,
      penyewa: _yellowCar,
      quantitas: 2,
    ),
    Pesanan(
      tanggal: '5 Oktober 2021',
      kendaraan: _avanza,
      penyewa: _yellowCar,
      quantitas: 3,
    ),
    Pesanan(
      tanggal: '5 Oktober 2021',
      kendaraan: _alphard,
      penyewa: _times,
      quantitas: 1,
    ),
    Pesanan(
      tanggal: '5 Oktober 2021',
      kendaraan: _avanza,
      penyewa: _enterprise,
      quantitas: 1,
    ),
  ],
  pesanan: [
    Pesanan(
      tanggal: '27 September 2021',
      kendaraan: _alphard,
      penyewa: _enterprise,
      quantitas: 1,
    ),
    Pesanan(
      tanggal: '15 Agustus 2021',
      kendaraan: _ertiga,
      penyewa: _yellowCar,
      quantitas: 2,
    ),
    Pesanan(
      tanggal: '7 April 2021',
      kendaraan: _avanza,
      penyewa: _yellowCar,
      quantitas: 3,
    ),
    Pesanan(
      tanggal: '3 Maret 2021',
      kendaraan: _alphard,
      penyewa: _times,
      quantitas: 1,
    ),
    Pesanan(
      tanggal: '22 Januari 2021',
      kendaraan: _avanza,
      penyewa: _enterprise,
      quantitas: 1,
    ),
  ],
);
