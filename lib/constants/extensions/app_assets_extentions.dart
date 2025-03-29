import 'package:portfolio_website/utils/resource/app_animation_assets.dart';

extension AppAssetsExtentions on String {
  String get animationAssetsBuilder =>
      '${AppAnimationAssets.animAssetPath}/${toString()}';
}
