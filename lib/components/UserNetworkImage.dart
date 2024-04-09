import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserNetworkImage extends StatelessWidget {
  final String image;
  final BoxFit? fit;
  final double? width, height;
  const UserNetworkImage(this.image,
      {Key? key, this.fit, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      useOldImageOnUrlChange: true,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Image.asset(
        'assets/images/user.svg',
        fit: BoxFit.cover,
      ),
      fit: fit,
      width: width,
      height: height,
    );
  }
}
