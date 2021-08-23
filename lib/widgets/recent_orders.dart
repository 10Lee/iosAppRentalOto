import 'package:app_rental_oto/data/data.dart';
import 'package:app_rental_oto/models/pesanan.dart';
import 'package:flutter/material.dart';

class RecentOrders extends StatelessWidget {
  _buildPesanan(Pesanan pesanan) {
    return Container(
      width: 320.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      image: AssetImage(pesanan.kendaraan.imageUrl),
                      height: 110.0,
                      width: 110.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            pesanan.kendaraan.nama,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          Text(
                            pesanan.penyewa.nama,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          Text(
                            pesanan.penyewa.alamat,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50.0,
              width: 50.0,
              margin: EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Penyewaan Terakhir',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 120.0,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.pesanan.length,
            itemBuilder: (BuildContext context, int index) {
              Pesanan pesanan = currentUser.pesanan[index];
              return _buildPesanan(pesanan);
            },
          ),
        ),
      ],
    );
  }
}
