import 'package:cached_network_image/cached_network_image.dart';
import 'package:rick_and_morty/core/ui.dart';

/// {@template cached_network_image_adapter}
/// Lightweight wrapper around [CachedNetworkImage] with sensible defaults.
/// Provides optional placeholder, error widget, and border radius handling.
/// {@endtemplate}
class CachedNetworkImageAdapter extends StatelessWidget {
  /// {@macro cached_network_image_adapter}
  const CachedNetworkImageAdapter({
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.borderRadius,
    super.key,
  });

  /// Target image URL.
  final String imageUrl;

  /// Optional width.
  final double? width;

  /// Optional height.
  final double? height;

  /// How the image should be inscribed into the space allocated during layout.
  final BoxFit fit;

  /// Custom placeholder widget while the image is loading.
  final Widget? placeholder;

  /// Custom widget shown if loading fails.
  final Widget? errorWidget;

  /// Optional border radius.
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) =>
          placeholder ?? _DefaultPlaceholder(width: width, height: height),
      errorWidget: (context, url, error) =>
          errorWidget ?? _DefaultError(width: width, height: height),
    );

    if (borderRadius == null) {
      return image;
    }

    return ClipRRect(borderRadius: borderRadius!, child: image);
  }
}

class _DefaultPlaceholder extends StatelessWidget {
  const _DefaultPlaceholder({this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: const Icon(Icons.image_outlined, color: Colors.white70, size: 24),
    );
  }
}

class _DefaultError extends StatelessWidget {
  const _DefaultError({this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.broken_image_outlined,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}
