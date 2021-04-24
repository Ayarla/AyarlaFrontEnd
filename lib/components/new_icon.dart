import 'package:ayarla/components/UI/linearGradientMask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:universal_platform/universal_platform.dart';

class NewIcon extends StatelessWidget {
  final String iconName;
  final double size;

  /// Widget for building customized new icons.
  ///
  /// • For [iconName], make necessary additions at constants/xxxxx
  ///
  /// • Parameter [iconName] is required.
  NewIcon({@required this.iconName, this.size});

  @override
  Widget build(BuildContext context) {
    return UniversalPlatform.isWeb
        ? SvgPicture.asset(
            iconName,
            width: size ?? 30,
            color: Colors.black,
          )
        : LinearGradientMask(
            child: SvgPicture.asset(
              iconName,
              width: size ?? 30,
              color: Colors.white,
            ),
          );
  }
}
