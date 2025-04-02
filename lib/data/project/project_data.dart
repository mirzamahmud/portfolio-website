import 'package:portfolio_website/models/project/project_model.dart';

class ProjectData {
  static final List<ProjectModel> projects = [
    ProjectModel(
      title: 'XCash',
      description:
          "XCash is a professional digital wallet platform packed with premium features to elevate your business. Combining payment processing and an electronic wallet, similar to PayPal or Payoneer.",
      imageUrl:
          'https://play-lh.googleusercontent.com/y0_oMnARm6f-2kytBUGZ05wSOhxtQCArEqvIa_XPRaedjBspTucQ6UBwUvMXm-l95A=w416-h235-rw',
      technologies: ['Flutter', 'REST APIs'],
      liveUrl:
          'https://play.google.com/store/apps/details?id=dev.vlab.xcash_user',
    ),
    ProjectModel(
      title: 'Viser Bank',
      description:
          'ViserBank is a comprehensive digital banking solution that provides an all-in-one banking experience for individuals and businesses. Our new Flutter(Android & IOS) application makes it easy to manage your finances on the go. With ViserBank mobile application, you can easily manage your finances from anywhere, anytime.',
      imageUrl:
          'https://play-lh.googleusercontent.com/HhM_KdkZoZh_Jfhg3UvD-v8Tn8FCvEjcb8gsCpjzKwLikDDWvdGwZI8y_6_J3GArO5NB=w416-h235-rw',
      technologies: ['Flutter', 'REST APIs'],
      liveUrl: 'https://play.google.com/store/apps/details?id=dev.vlab.vbank',
    ),
    ProjectModel(
      title: 'DemandLab',
      description:
          'DemandLab is a complete multi-vendor home service platform developed using the powerful Laravel and Flutter frameworks. This dynamic multivendor platform offers user-friendly apps for customers, a seamless provider panel for service experts, and an efficient admin panel for business owners. It is your gateway to transforming your service business or launching your entrepreneurial dream.',
      imageUrl:
          'https://play-lh.googleusercontent.com/h14NJmj-t88BDXzmwDfS0yRtMrDwdTNXKefKDG4ko3jQY3EAieXLCGTyYeKVmRMiTlI=w416-h235-rw',
      technologies: ['Flutter', 'REST APIs'],
      liveUrl:
          'https://play.google.com/store/apps/details?id=com.vlab.on_demand',
    ),
    ProjectModel(
      title: 'QP Messenger',
      description:
          'QP Messenger is a mobile application where people can be communicating with each others. In this application there are so many features like, p2p and group chatting, audio and video call, share reels, link, forward message and reacts on messages. By using this application users can record their voice and send it like a voice message.',
      imageUrl: '',
      technologies: ['Flutter', 'REST APIs', 'Webrtc', 'Socket.io'],
      liveUrl: 'https://qposs.com/',
    ),
    ProjectModel(
      title: 'Market Logic (Learning Management System)',
      description:
          "This application is just for them who can learn treading. This application is role based application which have two roles 'Teacher' and 'Students'. Main features of this application is conference calling which is implemented by using 'Flutter Agora RTC Engine'",
      imageUrl: '',
      technologies: ['Flutter', 'REST APIs', 'Agora RTC Engine'],
      liveUrl: 'http://themarketlogic.com/',
    ),
    ProjectModel(
      title: 'HYIPLab',
      description:
          'HyipLab is an advanced investment mobile application(Android & IOS) that comes with the “HYIPLAB-Complete HYIP Investment system” CMS. This is a well-architect, powerful, secure, well-optimized, and responsive mobile application(Android &IOS) that comes to satisfy all investment platform owner needs.',
      imageUrl:
          'https://play-lh.googleusercontent.com/QppihYOc-RENNn2v3J2RqKSNqSfhMztwcZSpNs0fVQa4vhdktpJjz-js-3wTNa1oHSM=w416-h235-rw',
      technologies: ['Flutter', 'REST APIs'],
      liveUrl:
          'https://play.google.com/store/apps/details?id=dev.vlab.hyip_lab',
    ),
  ];
}
