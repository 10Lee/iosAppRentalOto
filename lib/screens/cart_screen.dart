import 'package:app_rental_oto/data/data.dart';
import 'package:app_rental_oto/models/pesanan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var f = NumberFormat('###,###', 'en_US');

    int totalPrice = 0;
    currentUser.keranjang.forEach((element) {
      totalPrice += element.quantitas + element.kendaraan.hargaSewa;
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Keranjang'),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (index < currentUser.keranjang.length) {
            Pesanan pesanan = currentUser.keranjang[index];

            return _buildKeranjang(pesanan);
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lama Waktu Pengantaran',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '12 Menit',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Biaya Sewa',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      // 'Rp. ${totalPrice.toString()}K',
                      'Rp. ' + f.format(totalPrice) + 'K', // Using Package intl
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(
                  height: 150.0,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1.0,
            color: Colors.grey,
          );
        },
        itemCount: currentUser.keranjang.length + 1,
      ),
      bottomSheet: Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Center(
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Bayar Sekarang',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1),
            ),
          ),
        ),
      ),
    );
  }

  _buildKeranjang(Pesanan pesanan) {
    int pesananQuantitas = pesanan.quantitas;

    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      image: AssetImage(pesanan.kendaraan.imageUrl),
                      height: 100.0,
                      width: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pesanan.kendaraan.nama,
                          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10.0),
                                width: 65.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        pesananQuantitas--;
                                        print(pesananQuantitas);
                                      },
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      pesananQuantitas.toString(),
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        pesananQuantitas++;
                                        print(pesananQuantitas);
                                      },
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Mobil',
                                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                'Rp.${pesanan.kendaraan.hargaSewa}K',
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
