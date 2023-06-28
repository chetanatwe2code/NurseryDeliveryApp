import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class MakeShimmer extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const MakeShimmer({
    Key? key,
    required this.child,
    this.isLoading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Shimmer.fromColors(
            baseColor: Colors.indigo,
            highlightColor: Colors.blueGrey,
            child: child,
          )
        : child;
  }
}
