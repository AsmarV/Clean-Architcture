import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'responsive.dart';

class CachedImageView extends StatelessWidget {
  const CachedImageView({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(sized16() / 2),
      child: CachedNetworkImage(
        imageUrl: img,
        placeholder: (context, url) => Image.asset(
          'assets/images/default_img.png',
          fit: BoxFit.fitHeight,
        ),
        errorWidget: (context, url, error) => Image.asset(
          'assets/images/error_img.png',
          fit: BoxFit.fitHeight,
        ),
        imageBuilder: (context, imageProvider) => Image(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
