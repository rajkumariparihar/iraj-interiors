import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/cosntants.dart';

class ImageShimmer extends StatefulWidget {
  const ImageShimmer({Key? key}) : super(key: key);

  @override
  _ImageShimmerState createState() => _ImageShimmerState();
}

class _ImageShimmerState extends State<ImageShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
      child: Container(
        width:
            Constants.get_width(context) - Constants.get_width(context) * 0.3,
        height: Constants.get_height(context) * 0.7,
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7))),
          color: Colors.grey,
        ),
      ),
    );
  }
}
