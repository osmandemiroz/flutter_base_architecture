import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

///Project Custom network image with lottie
class ProjectNetworkImage extends StatelessWidget {
  ///required things to use this widget
  const ProjectNetworkImage({required this.url, super.key});

  ///url to use this widget
  final String? url;
  @override
  Widget build(BuildContext context) {
    return CustomNetworkImage(
      imageUrl: url,
      loadingWidget: Assets.lottie.animZombie.lottie(),
    );
  }
}
