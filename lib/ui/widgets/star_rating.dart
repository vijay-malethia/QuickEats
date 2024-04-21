import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final dynamic starRating;
  final double? size;
  const StarRating({super.key, required this.starRating, this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < 5; i++)
          i < double.parse(starRating.toString()).round()
              ? Icon(Icons.star_rate, size: size ?? 18, color: Colors.orange)
              : Icon(
                  Icons.star_rate_outlined,
                  size: size ?? 18,
                  color: Colors.grey,
                ),
      ],
    );
  }
}