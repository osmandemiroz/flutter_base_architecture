import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/src/package/custom_image/custom_memcache.dart';
import 'package:flutter/material.dart';

///It provides a custom network image from network url and image cache
@immutable
final class CustomNetworkImage extends StatelessWidget {
  ///required constructor to use this widget
  const CustomNetworkImage({
    this.boxFit = BoxFit.cover,
    super.key,
    this.imageUrl,
    this.defaultWidget,
    this.memCache = const CustomMemCache(height: 200, width: 200),
    this.loadingWidget = const Center(
      child: CircularProgressIndicator(),
    ),
    this.size,
  });

  ///Image source url
  final String? imageUrl;

  ///Default image
  final Widget? defaultWidget;

  ///Loading widget default value is [Center] [CircularProgressIndicator]
  final Widget? loadingWidget;

  ///size of image
  final Size? size;

  ///default value is 200x200 [CustomMemCache]
  final CustomMemCache? memCache;

  ///default value is [BoxFit.cover]
  final BoxFit boxFit;
  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    if (url == null || url.isEmpty) {
      return defaultWidget ?? const SizedBox.shrink();
    } else {
      return CachedNetworkImage(
        width: size?.width,
        height: size?.height,
        progressIndicatorBuilder: (context, url, progress) => loadingWidget!,
        imageUrl: url,
        fit: boxFit,
        memCacheHeight: memCache!.height,
        memCacheWidth: memCache!.width,
        errorWidget: (context, url, error) =>
            defaultWidget ?? const SizedBox.shrink(),
      );
    }
  }
}
