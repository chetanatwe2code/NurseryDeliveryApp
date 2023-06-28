import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'make_shimmer.dart';

class CommonImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final double radius;
  final Color? errorBackground;
  final BoxFit? fit;
  final String? assetPlaceholder;

  const CommonImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.radius = 10,
    this.errorBackground,
    this.fit,
    this.assetPlaceholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius.r),
      child: CachedNetworkImage(
              imageUrl: '$imageUrl',
              width: width?.r,
              height: height?.r,
              fit: fit ?? BoxFit.cover,
              progressIndicatorBuilder: (_, __, ___) => MakeShimmer(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius.r),
                  ),
                ),
              ),
              errorWidget: (_, __, ___) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: errorBackground ?? Colors.grey.withOpacity(0.5),
                ),
                alignment: Alignment.center,
                child:
                assetPlaceholder != null ?
                Image.asset("$assetPlaceholder")
                    :
                Icon(
                  FlutterRemix.image_line,
                  size: 20.r,
                ),
              ),
            ),
    );
  }
}
