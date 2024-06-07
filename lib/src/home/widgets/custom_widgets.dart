import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:real_estate_app/style/colors.dart';

class OfferCard extends StatelessWidget {
  final String title;
  final String offers;
  final Color color;
  final Color textColor;
  final bool isRound;

  const OfferCard(
      {super.key,
      required this.title,
      required this.offers,
      required this.color,
      required this.textColor,
      this.isRound = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 160,
        width: 160,
        // width: MediaQuery.of(context).size.width * 0.42,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: isRound ? null : BorderRadius.circular(16),
          shape: isRound ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: 18,
                color: textColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              offers,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "offers",
              style: TextStyle(
                fontSize: 16,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final String imageUrl;
  final String address;
  final double? height;
  const PropertyCard({super.key, required this.imageUrl, required this.address, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 200,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
        image: DecorationImage(image: CachedNetworkImageProvider(imageUrl), fit: BoxFit.cover),
      ),
      child: Container(
        height: 50,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xffd8c6b6),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: Text(
                  address,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Color(0xfffbf5eb),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(66, 59, 56, 56),
                    blurRadius: 4,
                    offset: Offset(-10, -5),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                color: Colors.grey,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
