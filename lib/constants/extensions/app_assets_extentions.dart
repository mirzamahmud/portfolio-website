import 'package:portfolio_website/utils/resource/app_animation_assets.dart';
import 'package:portfolio_website/utils/resource/app_image_assets.dart';

extension AppAssetsExtentions on String {
  String get animationAssetsBuilder =>
      '${AppAnimationAssets.animAssetPath}/${toString()}';

  String get imageAssetsBuilder =>
      '${AppImageAssets.imageAssetPath}/${toString()}';
}
