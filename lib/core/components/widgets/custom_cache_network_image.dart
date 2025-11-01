import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImageWidget extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget Function(BuildContext, String)? placeholder;
  const CustomCachedImageWidget({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: path,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      placeholder:
          placeholder ?? (context, url) => Container(color: Colors.grey[300]),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey[300],
        child: const Icon(Icons.movie, size: 100),
      ),
    );
  }
}
