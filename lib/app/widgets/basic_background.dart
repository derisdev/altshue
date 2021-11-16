import 'package:altshue/app/constants/asset_path.dart';
import 'package:flutter/widgets.dart';

class BasicBackground extends StatelessWidget {
  const BasicBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        AssetName.splashBg,
        fit: BoxFit.fill,
      ),
    );
  }
}
