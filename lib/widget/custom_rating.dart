import 'package:e_commerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StarRating extends StatelessWidget {
  final double rating; // The rating value

  const StarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    // Determine the number of filled and unfilled stars
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) > 0;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    List<Widget> stars = [];

    // Add full stars
    for (int i = 0; i < fullStars; i++) {
      stars.add(Icon(Icons.star, color: Colors.yellow[700]));
    }

    // Add half star if applicable
    if (hasHalfStar) {
      stars.add(Icon(Icons.star, color: Colors.yellow[700]));
    }

    // Add empty stars
    for (int i = 0; i < emptyStars; i++) {
      stars.add(Icon(Icons.star, color: Colors.yellow[700]));
    }

    return Row(
      children: [
        ...stars,
        const SizedBox(width: 8.0),
        Text(
          '(${rating.toStringAsFixed(1)})',
          style: theme.textTheme.bodySmall!.copyWith(),
        ),
      ],
    );
  }
}
