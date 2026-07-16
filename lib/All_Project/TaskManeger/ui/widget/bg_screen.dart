import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../util/assets_path.dart';

class bg_screen extends StatelessWidget {
  final Widget child;
  const bg_screen({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AssetsPath.backgroundPath,height: double.maxFinite,width: double.maxFinite,fit: BoxFit.cover),
        child

      ],
    );
  }
}