import 'package:flutter/material.dart';
import '../res/dimens.dart' as dimens;

double getElevation(BuildContext context) {
  final platform = Theme.of(context).platform;
  return platform == TargetPlatform.iOS
      ? dimens.iOSElevation
      : dimens.androidElevation;
}
