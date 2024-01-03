import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BooksPhoto extends StatelessWidget {
  const BooksPhoto({
    super.key,
    required this.imageUrl,
    required this.aspectRatio,
  });
  final String imageUrl;
  final double aspectRatio;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => const Icon(
            FontAwesomeIcons.exclamation,
          ),
        ),
      ),
    );
  }
}
