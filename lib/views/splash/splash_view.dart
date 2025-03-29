import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_website/constants/extensions/app_assets_extentions.dart';
import 'package:portfolio_website/constants/extensions/app_spacing_extension.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/utils/resource/app_animation_assets.dart';
import 'package:portfolio_website/views/splash/controller/splash_controller.dart';
import 'package:portfolio_website/widgets/text/custom_text.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.navigateToMainLayout();

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset(
                AppAnimationAssets.codingAnim.animationAssetsBuilder,
                height: 256,
                width: 256,
              ),
              36.verticalSpace,
              CustomText(
                title: 'Mirza Mahmud Hossan',
                textAlign: TextAlign.center,
                textStyle: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: PRIMARY_COLOR),
              ),
              12.verticalSpace,
              CustomText(
                title: 'Mobile App Developer',
                textAlign: TextAlign.center,
                textStyle: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: GREY_COLOR),
              ),
              20.verticalSpace,
              SizedBox(
                width: 144,
                child: LinearProgressIndicator(
                  backgroundColor: GREY_COLOR,
                  color: PRIMARY_COLOR,
                  minHeight: 2,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
