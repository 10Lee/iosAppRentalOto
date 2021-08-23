import 'package:app_rental_oto/data/data.dart';
import 'package:app_rental_oto/screens/provider_screen.dart';
import 'package:app_rental_oto/widgets/rating_stars.dart';
import 'package:app_rental_oto/widgets/recent_orders.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchHolder = TextEditingController();

  _buildProviders() {
    List<Widget> listPenyewa = [];

    providers.forEach((element) {
      listPenyewa.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProviderScreen(element),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                width: 1.0,
                color: Colors.white10,
              ),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                  child: Hero(
                    tag: element.imageUrl,
                    child: Image(
                      image: AssetImage(
                        element.imageUrl,
                      ),
                      height: 150.0,
                      width: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          element.nama,
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        RatingStars(element.peringkat),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          element.alamat,
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '0.2 KM dari lokasi anda',
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });

    return Column(children: listPenyewa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBEBEB),
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(currentUser.imageUrl),
            ),
            Container(
              margin: EdgeInsets.only(left: 23.0),
              child: Text(
                'Bursa Rental Oto',
                style: TextStyle(
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: currentUser.keranjang.length != 0
                ? Badge(
                    badgeContent: Text(
                      currentUser.keranjang.length.toString(),
                      style: TextStyle(
                          fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    position: BadgePosition(start: 30.0, bottom: 30.0),
                    child: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {},
                    ),
                  )
                : IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                  ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: searchHolder,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 30.0),
                  labelText: 'Cari Kendaraan',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      searchHolder.clear();
                    },
                    icon: Icon(Icons.close),
                  )),
            ),
          ),
          RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Penyewa Kendaraan Terdekat',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
              ),
              _buildProviders(),
            ],
          ),
        ],
      ),
    );
  }
}
