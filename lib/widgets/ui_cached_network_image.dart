import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_helper/extensions/data_type.dart';

class UICachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double? radius;
  final BorderRadius? borderRadius;
  final Color? color;
  final BlendMode? colorBlendMode;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double memCacheWidth;
  final double memCacheHeight;
  final bool? circular;


  const UICachedNetworkImage(
    this.imageUrl, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.color,
    this.colorBlendMode,
    this.circular = false,
    this.placeholder,
    this.errorWidget,
        this.radius ,
    this.memCacheWidth = 600,
    this.memCacheHeight = 600,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isNullOrEmpty) {
      return errorWidget ??  _buildErrorWidget();
    }

    final image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      color: color,
      colorBlendMode: colorBlendMode,
      memCacheWidth: 600,
      placeholder: (context, url) => placeholder ?? _buildPlaceholder(context),
      errorWidget: (context, url, error) => errorWidget ?? _buildErrorWidget(),
    );

    if(circular == true){
      return ClipOval(clipBehavior: Clip.hardEdge, child: image);
    }

    if (borderRadius != null || radius != null) {
      return ClipRRect(borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 0), child: image);
    }
    return image;
  }

  /// default placeHolder
  Widget _buildPlaceholder(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.shade300,
      child: Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: const CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }

  ///default error
  Widget _buildErrorWidget() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.shade200,
      alignment: Alignment.center,
      child: const Icon(Icons.broken_image, color: Colors.grey, size: 32),
    );
  }
}
