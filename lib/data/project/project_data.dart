import 'package:portfolio_website/models/project/project_model.dart';
import 'package:portfolio_website/utils/resource/app_image_assets.dart';

class ProjectData {
  static final List<ProjectModel> projects = [
    ProjectModel(
      title: 'XCash',
      description:
          "XCash is a professional digital wallet platform packed with premium features to elevate your business. Combining payment processing and an electronic wallet, similar to PayPal or Payoneer.",
      imageUrl: AppImageAssets.xCashProject,
      technologies: ['Flutter', 'REST APIs'],
      liveUrl:
          'https://play.google.com/store/apps/details?id=dev.vlab.xcash_user',
    ),
    ProjectModel(
      title: 'Viser Bank',
      description:
          'ViserBank is a comprehensive digital banking solution that provides an all-in-one banking experience for individuals and businesses. Our new Flutter(Android & IOS) application makes it easy to manage your finances on the go. With ViserBank mobile application, you can easily manage your finances from anywhere, anytime.',
      imageUrl: AppImageAssets.viserBankProject,
      technologies: ['Flutter', 'REST APIs'],
      liveUrl: 'https://play.google.com/store/apps/details?id=dev.vlab.vbank',
    ),
    ProjectModel(
      title: 'DemandLab',
      description:
          'DemandLab is a complete multi-vendor home service platform developed using the powerful Laravel and Flutter frameworks. This dynamic multivendor platform offers user-friendly apps for customers, a seamless provider panel for service experts, and an efficient admin panel for business owners. It is your gateway to transforming your service business or launching your entrepreneurial dream.',
      imageUrl: AppImageAssets.demandLabProject,
      technologies: ['Flutter', 'REST APIs'],
      liveUrl:
          'https://play.google.com/store/apps/details?id=com.vlab.on_demand',
    ),
    ProjectModel(
      title: 'HYIPLab',
      description:
          'HyipLab is an advanced investment mobile application(Android & IOS) that comes with the “HYIPLAB-Complete HYIP Investment system” CMS. This is a well-architect, powerful, secure, well-optimized, and responsive mobile application(Android &IOS) that comes to satisfy all investment platform owner needs.',
      imageUrl: AppImageAssets.hyipLabProject,
      technologies: ['Flutter', 'REST APIs'],
      liveUrl:
          'https://play.google.com/store/apps/details?id=dev.vlab.hyip_lab',
    ),
    ProjectModel(
      title: 'MineLab',
      description:
          'MineLab is a crypto mining flutter mobile application(Android &IOS) that comes with the “MineLab-Cloud Crypto Mining Platform” CMS. Worlds are becoming cashless and crypto is becoming more popular day by day. It is ready to use mobile application for the business owner who wants to run and promote their next crypto-mining business flawlessly. It is a well-architect, powerful, secure, well-optimized, and responsive mobile application(Android & IOS) that comes to satisfy all mining platform owner needs.',
      imageUrl: AppImageAssets.mineLabProject,
      technologies: ['Flutter', 'REST APIs'],
      liveUrl:
          'https://preview.codecanyon.net/item/minelab-cloud-crypto-mining-mobile-application/full_screen_preview/43018870?_ga=2.229391132.1813458721.1743692817-1477460179.1702149392',
    ),
    ProjectModel(
      title: 'SignalLab',
      description:
          'SignalLab is a Professional Trading Signal Solution that comes with Email, SMS & Telegram Integration. It’s developed for those people who want to start their Trading or forex signal website with additional features.',
      imageUrl: AppImageAssets.signalLabProject,
      technologies: ['Flutter', 'REST APIs'],
      liveUrl:
          'https://play.google.com/store/apps/details?id=dev.signal_lab.com',
    ),
  ];
}
