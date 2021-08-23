import 'package:app_rental_oto/data/data.dart';
import 'package:app_rental_oto/models/pesanan.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
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
        itemBuilder: (BuildContext context, int index) {
          Pesanan pesanan = currentUser.keranjang[index];
          return _buildKeranjang(pesanan);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1.0,
            color: Colors.grey,
          );
        },
        itemCount: currentUser.keranjang.length,
      ),
    );
  }

  _buildKeranjang(Pesanan pesanan) {
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
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.remove),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Hari',
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
                'Rp.${pesanan.kendaraan.hargaSewa}',
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
