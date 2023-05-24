import 'package:flutter/material.dart';

final class RoundedImage extends StatefulWidget {
  String url;
  double radius;
  double width;
  double height;

  RoundedImage({
    super.key,
    required this.url,
    this.radius = 16,
    this.width = 120, this.height = 120
  });

  @override
  State<RoundedImage> createState() => _RoundedImageState();
}

class _RoundedImageState extends State<RoundedImage> {
  late String url;

  @override
  void initState() {
    super.initState();
    url = widget.url;
  }

  // void updateImage {}

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius), // Image border
      child: SizedBox.fromSize(
        size: const Size.fromRadius(48), // Image radius
        child: Image(
          image: NetworkImage(url),
          width: widget.width,
          height: widget.height,
          fit: BoxFit.fitHeight,
        ),
      ),
    );;
  }
}