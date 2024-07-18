import 'package:crud_app/presentation/utils/assets_path.dart';
import 'package:flutter/material.dart';

class AppBarImageLogo extends StatelessWidget {
  const AppBarImageLogo({super.key, this.width, this.height});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        AssetsPath.appLogoImage,
        height: height,
        width: width,
      ),
    );
  }
}
