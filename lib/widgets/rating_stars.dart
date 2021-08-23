import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int peringkat;

  RatingStars(this.peringkat);

  @override
  Widget build(BuildContext context) {
    String stars = '';

    for (int i = 0; i < peringkat; i++) {
      stars += '⭐ ';
    }
    stars.trim();

    return Text(
      stars,
      style: TextStyle(fontSize: 18.0),
    );
  }
}
