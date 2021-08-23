import 'package:app_rental_oto/models/kendaraan.dart';
import 'package:app_rental_oto/models/penyewa.dart';
import 'package:app_rental_oto/widgets/rating_stars.dart';
import 'package:flutter/material.dart';

class ProviderScreen extends StatefulWidget {
  final Penyewa penyewa;

  ProviderScreen(this.penyewa);

  @override
  _ProviderScreenState createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  _buildKendaraanTersedia(Kendaraan kendaraan) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(kendaraan.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.penyewa.imageUrl,
                child: Image(
                  image: AssetImage(widget.penyewa.imageUrl),
                  height: 220.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.penyewa.nama,
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text('0.2 km dari lokasi anda'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingStars(widget.penyewa.peringkat),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite),
                      color: Colors.red,
                    )
                  ],
                ),
                Text(widget.penyewa.alamat),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'TESTIMONI',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'HUBUNGI',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Tersedia',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(widget.penyewa.tersedia.length, (index) {
                Kendaraan kendaraan = widget.penyewa.tersedia[index];
                return _buildKendaraanTersedia(kendaraan);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
